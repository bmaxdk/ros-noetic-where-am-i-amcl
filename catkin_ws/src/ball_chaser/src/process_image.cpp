#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    ROS_INFO_STREAM("ROBOT IS READY!");
    // TODO: Request a service and pass the velocities to it to drive the robot
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;
    
    // Call the command_robot service and pass the requested joint angles
    if (!client.call(srv)){
        ROS_ERROR("Failed to call service command_robot");
    }   
}


// sensor_msgs/Image Message
// File: sensor_msgs/Image.msg
// Raw Message Definition

// # This message contains an uncompressed image
// # (0, 0) is at top-left corner of image
// #

// Header header        # Header timestamp should be acquisition time of image
//                      # Header frame_id should be optical frame of camera
//                      # origin of frame should be optical center of camera
//                      # +x should point to the right in the image
//                      # +y should point down in the image
//                      # +z should point into to plane of the image
//                      # If the frame_id here and the frame_id of the CameraInfo
//                      # message associated with the image conflict
//                      # the behavior is undefined

// uint32 height         # image height, that is, number of rows
// uint32 width          # image width, that is, number of columns

// # The legal values for encoding are in file src/image_encodings.cpp
// # If you want to standardize a new string format, join
// # ros-users@lists.sourceforge.net and send an email proposing a new encoding.

// string encoding       # Encoding of pixels -- channel meaning, ordering, size
//                       # taken from the list of strings in include/sensor_msgs/image_encodings.h

// uint8 is_bigendian    # is this data bigendian?
// uint32 step           # Full row length in bytes
// uint8[] data          # actual matrix data, size is (step * rows)



// conditional operator
int maximum(int left, int middle, int right)
{
   int max = (left < middle) ? middle : left;
   return ((max < right) ? right : max);
}


void process_image_callback(const sensor_msgs::Image img)
{
    int white_pixel = 255;

    // TODO: Loop through each pixel in the image and check if there's a bright white one
    // Then, identify if this pixel falls in the left, mid, or right side of the image
    // Depending on the white ball position, call the drive_bot function and pass velocities to it
    // Request a stop when there's no white ball seen by the camera

    int left_count = 0;
    int front_count = 0;
    int right_count = 0;
    // First, search for white pixels inside the array image
    for (int i = 0; i < img.height * img.step; i += 3) {

        //i with range of img. step = img.width*3 (rgb) that divide 3 for left middle and right.            
        int current_index = (i % img.step) / 3; 


        // Set RGB or BGR? to be white where r, g, b = 255, 255, 255
        // Since the ball is the only object in the world that is white, white pixels indicate the ball’s presence.
        if (img.data[i] == white_pixel && img.data[i + 1] == white_pixel && img.data[i + 2] == white_pixel) {
            // separate 3 sides; left middle right
            // count each index where both whie color appear and then decide where to go
            if(current_index < (img.width/3)) {
                left_count += 1;
                // printf("\nleft_counter = %d", left_count);
                // printf("\nposition_index = %d", current_index);
            }
            if(current_index >= (img.width/3) && current_index <= (2*img.width/3)) {
                front_count += 1;
                // printf("\n------------------------front_count = %d", front_count);
                // printf("\n------------------------current_index = %d", current_index);
            }
            if(current_index > (2*img.width/3)) {
                right_count += 1;
                // printf("\n------------------------------------------------right_count = %d", right_count);
                // printf("\n------------------------------------------------current_index = %d", current_index);
            }
        }
    }
        
    // Find maximum count for left, fron, right to move:
    int max_count = maximum(left_count, front_count, right_count);


    string image_side;

    // Set the robot to stop when the robot close enough to reach white ball
    int image_area = img.width * img.height;
    float image_color_occupancy = (float)left_count/image_area + (float)front_count/image_area + (float)right_count/image_area;
    if (image_color_occupancy >= 0.55) {
        max_count = 0;
    }


    // Important step to send lin_x and ang_z to Request a ball_chaser/command_robot service to move
    // Depending on the white ball position, call the drive_bot function and pass velocities to it.
    
    //Set initialize with zero otherwise it will start with current position.
    if (max_count == 0) {
        image_side = "Not Moving";
        drive_robot(0.0, 0.0); // Request my_robot to be stop
    }
    else if (max_count == left_count) {
        image_side = "Moving Left";
        drive_robot(0.0, 0.5);  // Request my_robot to rotate left

    }
    else if (max_count == front_count) {
        image_side = "Moving Forward";
        drive_robot(0.5, 0.0);  // Request my_robot move forward
    }
    else if (max_count == right_count) {
        image_side = "Moving Right";
        drive_robot(0.0, -0.5); // Request my_robot to rotate right
    }
    ROS_INFO("[CURRENT STATUS] STATUS: %s", image_side.c_str());

}


// Given
int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to the /camera/rgb/image_raw topic to get instantaneous images from the robot’s camera
    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}