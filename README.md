# ros-noetic-where-am-i-amcl
ROS-Noetic

Application of using the adaptive monte carlo localizatin (AMCL) algorithm is implemented in ROS. AMCL dynamically adjusts the number of particles over a period of time, as the robot navigates around in a map. The process of AMCL algorithm is followed by the [amcl](http://wiki.ros.org/amcl) ROS package to get a working localization. This is done in ROS-noetic. If you wish to launch file in ROS-kinetic, read [ros-kinetic-whereami](https://github.com/bmaxdk/RoboticsND-where-am-i.git).

[image1]: img/p1.png "img1"
[image2]: img/p2.png "img2"
[image3]: img/f1.png "img3"
[image4]: img/f2.png "img4"


![alt text][image4]


### Getting started

#### Following Instructions:

[ROS installation instructions](http://wiki.ros.org/ROS/Installation).

[Gazebo download and installation instructions](http://gazebosim.org).

#### Following package need to be installed
```bash
$ sudo apt-get install ros-noetic-navigation
$ sudo apt-get install ros-noetic-map-server
$ sudo apt-get install ros-noetic-move-base
$ sudo apt-get install ros-noetic-amcl
```

#### To run PGM map creator need to be installed `libignition-math2-dev` and `protobuf-compiler` to compile the map creator
```bash
$ sudo apt-get install libignition-math2-dev protobuf-compiler

```

#### Build and launch the environment
With Gazebo and ROS installed, first need to create a catkin workspace. Navigate to your home directory and execute:
```bash
$ mkdir -p catkin_ws/src
$ cd catkin_ws/src
$ catkin_init_workspace
$ cd ..
$ catkin_make
```

Next, clone the repository into the src directory:
```bash
$ git clone https://github.com/bmaxdk/ros-noetic-where-am-i-amcl.git
$ mv -avr ros-noetic-where-am-i-amcl/catkin_ws/src src
$ rm -rf ros-noetic-where-am-i-amcl
$ cd src
$ rm -rf CMakeLists.txt
```

Then navigate up to the top-level catkin workspace directory and build the executables:
```bash
$ cd ..
$ catkin_make
```

Next, you can open Gazebo with the robot in it:
```bash
$ source devel/setup.bash
$ roslaunch my_robot world.launch
```

To launch amcl laucn file, open a new terminal and execute the following:
```bash
$ source devel/setup.bash
$ roslaunch whereami amcl.launch
```
#### Rviz Configuration will be already setup. If not, follows step
* Select `odom` for fixed frame. 
* Add `RobotModel`.
* Add `Map` and select `/map` topic.
* Add `PoseArray` and select `particlecloud` topic.
* Add laser sensor.

#### Control robot step
(option1) To launch telop, open a new terminal and execute the following:
```bash
$ source devel/setup.bash
$ rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

(option2) To make the robot chase the white ball, open a new terminal and execute the following:
```bash
$ source devel/setup.bash
$ roslaunch ball_chaser ball_chaser.launch
```
Now place the white ball at different positions in front of the robot and see if the robot is chasing the ball.

(option3) To control robot with topic message, open a new terminal and execute the following:
```bash
$ rostopic pub /cmd_vel geometry_msgs/Twist  "linear:
  x: 0.1
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.1" 
```
### Result
Initial Condition 
![alt text][image1]

Processing Condition
![alt text][image2]

Final Result
![alt text][image3]

## Directory Structure
```bash
workspace/catkin_ws/src# tree
.
├── ball_chaser
│   ├── CMakeLists.txt
│   ├── launch
│   │   └── ball_chaser.launch
│   ├── package.xml
│   ├── src
│   │   ├── drive_bot.cpp
│   │   └── process_image.cpp
│   └── srv
│       └── DriveToTarget.srv
├── CMakeLists.txt -> /opt/ros/kinetic/share/catkin/cmake/toplevel.cmake
├── my_robot                                            # Package contains robot and world
│   ├── CMakeLists.txt
│   ├── config
│   │   ├── base_local_planner_params.yaml
│   │   ├── costmap_common_params.yaml
│   │   ├── global_costmap_params.yaml
│   │   ├── local_costmap_params.yaml
│   │   └── __MACOSX
│   ├── launch
│   │   ├── amcl.launch
│   │   ├── robot_description.launch
│   │   └── world.launch
│   ├── maps
│   │   ├── map.pgm
│   │   └── map.yaml
│   ├── meshes
│   │   └── hokuyo.dae
│   ├── package.xml
│   ├── urdf
│   │   ├── my_robot.gazebo
│   │   └── my_robot.xacro
│   └── worlds
│       ├── cho_robot_world.world                       # Current world file: Will use it to generate pgm_map
│       └── robotl1_old.world
├── pgm_map_creator                                     # Package for converting a world into a pgm map
│   ├── CMakeLists.txt
│   ├── CODEOWNERS
│   ├── launch
│   │   └── request_publisher.launch
│   ├── LICENSE
│   ├── maps
│   │   └── map.pgm                                     # PGM map generated from pgm_map_creator
│   ├── msgs
│   │   ├── CMakeLists.txt
│   │   └── collision_map_request.proto
│   ├── package.xml
│   ├── README.md
│   ├── src
│   │   ├── collision_map_creator.cc
│   │   └── request_publisher.cc
│   └── world
│       ├── cho_robot_world.world                       # my world file with plugin added to generate pgm map
│       └── udacity_mtv
├── teleop_twist_keyboard                               # (Optioin-2) Teleop Robot package
│   ├── CHANGELOG.rst
│   ├── CMakeLists.txt
│   ├── package.xml
│   ├── README.md
│   └── teleop_twist_keyboard.py
└── whereami                                            # Package for amcl launch file
    ├── CMakeLists.txt
    ├── config
    │   ├── base_local_planner_params.yaml
    │   ├── costmap_common_params.yaml
    │   ├── global_costmap_params.yaml
    │   ├── local_costmap_params.yaml
    │   └── __MACOSX
    ├── include
    │   └── whereami
    ├── launch
    │   └── amcl.launch                                 # project amcl launch file
    ├── maps
    │   ├── map.pgm                                     # pgm map of wold file that created from pgm_map_creator
    │   └── map.yaml
    ├── package.xml
    └── src

```

## Project Overview
Following package need to be installed
```bash
$ sudo apt-get install ros-noetic-navigation
$ sudo apt-get install ros-noetic-map-server
$ sudo apt-get install ros-noetic-move-base
$ sudo apt-get install ros-noetic-amcl
```

To run PGM map creator need to install `libignition-math2-dev` and `protobuf-compiler` to compile the map creator
```bash
sudo apt-get install libignition-math2-dev protobuf-compiler
```

### Simulation Setup
To begin with simulation setup `roslaunch <YOUR PACKAGE NAME> world.launch`
```bash
$ roslaunch my_robot world.launch
```

### Map Setup (some reason pgm_map_creator is not working in noetic. You need to find other pgm_map_creator for fenerating map.pgm)
Current robot (my_robot) has zero information on its surroundings. To generate the map from Gazebo world directly using ROS package: [pgm_map_creator](https://github.com/udacity/pgm_map_creator). The map ROS AMCL Package uses is a `pgm` file.

To generate map,
```bash
# cd /home/workspace/catkin_ws/src/<YOUR PACKAGE NAME>
$ cd /home/workspace/catkin_ws/src/whereami
$ mkdir maps
$ cd /home/workspace/catkin_ws/src/
$ git clone https://github.com/udacity/pgm_map_creator.git
$ cd ..
$ catkin_make
$ cd src/my_robot/worlds
# copy current world file into world folder in pgm_map_creator package
# cp <YOUR GAZEBO WORLD FILE> src/pgm_map_creator/world/
$ cp cho_robot_world.world src/pgm_map_creator/world/

```

In `src/pgm_map_creator/world/` add the following tag towards the end of the file, but just before </world> tag into [world](https://github.com/bmaxdk/ros-noetic-where-am-i-amcl/blob/main/catkin_ws/src/pgm_map_creator/world/cho_robot_world.world) file.
```xml
<plugin filename="libcollision_map_creator.so" name="collision_map_creator"/>
```

To create the PGM map, need to run `gzserver` with the map file and launch the `request_publisher` node
```bash
# gzserver src/pgm_map_creator/world/<YOUR GAZEBO WORLD FILE>
$ gzserver src/pgm_map_creator/world/cho_robot_world.world

# open another terminal
$ roslaunch pgm_map_creator request_publisher.launch
```
If the map is cropped, you might want to adjust the parameters in `launch/request_publisher.launch`, namely the `x` and `y` values, which defines the size of the map:
```xml
  <arg name="xmin" default="-15" />
  <arg name="xmax" default="15" />
  <arg name="ymin" default="-15" />
  <arg name="ymax" default="15" />
  <arg name="scan_height" default="5" />
  <arg name="resolution" default="0.01" />
```

Once pgm map is created in maps folder, move map.map to your package. After that need to create `yaml` file providing the [metadata about the map](http://wiki.ros.org/map_server#YAML_format)
```bash
$ cd /home/workspace/catkin_ws/
# cp src/pgm_map_creator/maps/<YOUR MAP NAME>  src/<YOUR PACKAGE NAME>/maps/<YOUR MAP NAME>
$ cp src/pgm_map_creator/maps/map.pgm  src/whereami/maps/
$ cd src/whereami/maps
touch map.yaml
```
In map.yaml
```yaml
image: map.pgm
resolution: 0.01
origin: [-15.0, -15.0, 0.0]
occupied_thresh: 0.65
free_thresh: 0.196
negate: 0
```
The default map size is 30 by 30, so the origin will be [-15, -15, 0], i.e. half the size of the map.

### AMCL `launch` file
[whereami](https://github.com/bmaxdk/ros-noetic-where-am-i-amcl/tree/main/catkin_ws/src/whereami) package contains `AMCL launch` file.
The following steps applied to create AMCL launch file
```bash
# cd /home/workspace/catkin_ws/src/<YOUR PACKAGE NAME>/launch/
$ cd /home/workspace/catkin_ws/src/whereami/launch/
$ touch amcl.launch
```


In [amcl.launch](https://github.com/bmaxdk/ros-noetic-where-am-i-amcl/blob/main/catkin_ws/src/whereami/launch/amcl.launch) file, `Map Server Node`, `AMCL Node`, and `Move Base Node` are added.

[`Map Server Node`](http://wiki.ros.org/map_server) provides map data as a ROS service to other nodes as the `amcl` node. It will locate the map and send it ouy as the map data.

Map server node set up:
```xml
<!-- <arg name="map_file" default="$(find <YOUR PACKAGE NAME>)/maps/<YOUR MAP NAME>.yaml"/> -->
<arg name="map_file" default="$(find whereami)/maps/map.yaml"/>
<node name="map_server" pkg="map_server" type="map_server" args="$(arg map_file)" />
```


To perform the AMCL localization, `AMCL Node` is necessary for using `odometry` and `laser scan` data. `amcl` package will look for the `scan` topic ofr Hokuyo Lidar sensor data which publish on the `<YOUR PACKAGE NAME>/laser/scan`. More information about [remap](http://wiki.ros.org/roslaunch/XML/remap) in ROS Wiki. Add AMCL parameter necessary to connect the world(`map` frame) with the robot(`odom` frame).

```xml

<!-- AMCL Node -->
<node name="amcl" ...>
<!--   <remap from="scan" to="<YOUR PACKAGE NAME>/laser/scan"/> -->
  <remap from="scan" to="whereami/scan"/>
  <param name="odom_frame_id" value="odom"/>
  <param name="odom_model_type" value="diff-corrected"/>
  <param name="base_frame_id" value="robot_footprint"/>
  <param name="global_frame_id" value="map"/>
</node>
```
In [`amcl` ROS Wiki](http://wiki.ros.org/amcl), contains the purpose of the parameters such as:
* `odom_frame_id` (string, default: "odom"): Which frame to use for odometry
* `odom_model_type` (string, default: "diff"): Which model to use, either "diff", "omni", "diff-corrected" or "omni-corrected"
* `base_frame_id` (string, default: "base_link"): Which frame to use for the robot base
* `global_frame_id` (string, default: "map"): The name of the coordinate frame published by the localization system

Remember, AMCL package `links` the robot (`odom` frame) with the world (`map` frame). These parameters are required for `amcl` package to localize the robot in the world.

In AMCL node, it allows to set initial position by adding
```xml
<param name="initial_pose_x" value="<YOUR X VALUE>"/>
<param name="initial_pose_y" value="<YOUR Y VALUE>"/>
```

`move_base` package allows to define a nevigation goal position for the robot in the map which will navigate to that goal position. This step is option if choose to use `teleop` node to control and localize robot. This step utilizes a costmap where each part of the map is divided into which area is occupied, like walls or obstacles and which area is unoccupied.
`Move Base Node`requires both remap and parameters to move the robot in the world. You can use`rosparam` to include config files to set multiple parameters directly. 
In this step added [config files](https://github.com/bmaxdk/ros-noetic-where-am-i-amcl/tree/main/catkin_ws/src/whereami/config) in `catkin_ws/src/whereami/config`.
```bash
$ cd ..
$ mkdir config
$ cd config
$ wget https://s3-us-west-1.amazonaws.com/udacity-robotics/Resource/where_am_i/config.zip
$ unzip config.zip
$ rm config.zip
```
```xml
<!--   <rosparam file="$(find robot)/config/costmap_common_params.yaml" command="load" ns="global_costmap" /> -->
<!--   <rosparam file="$(find robot)/config/costmap_common_params.yaml" command="load" ns="local_costmap" /> -->
<!--   <rosparam file="$(find robot)/config/local_costmap_params.yaml" command="load" /> -->
<!--   <rosparam file="$(find robot)/config/global_costmap_params.yaml" command="load" /> -->
<!--   <rosparam file="$(find robot)/config/base_local_planner_params.yaml" command="load" /> -->
```
```xml
  <node name="move_base" pkg="move_base" type="move_base" respawn="false" output="screen">
<!--     <remap from="scan" to="<YOUR PACKAGE NAME>/laser/scan"/> -->
    <remap from="scan" to="whereami/scan"/> 
    <param name="base_global_planner" value="navfn/NavfnROS" />
    <param name="base_local_planner" value="base_local_planner/TrajectoryPlannerROS"/>
    <!-- <rosparam file="$(find robot)/config/costmap_common_params.yaml" command="load" ns="global_costmap" /> -->
    <!-- <rosparam file="$(find robot)/config/costmap_common_params.yaml" command="load" ns="local_costmap" /> -->
    <!-- <rosparam file="$(find robot)/config/local_costmap_params.yaml" command="load" /> -->
    <!-- <rosparam file="$(find robot)/config/global_costmap_params.yaml" command="load" /> -->
    <!-- <rosparam file="$(find robot)/config/base_local_planner_params.yaml" command="load" /> -->
  </node>
```

### Teleop Package
To control robot with teleop package
```bash
$ cd /home/workspace/catkin_ws/src
$ git clone https://github.com/ros-teleop/teleop_twist_keyboard
$ cd ..
$ catkin_make
$ source devel/setup.bash
$ rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

### Launch the simulation:
```bash
$ cd /home/workspace/catkin_ws/
# roslaunch <YOUR PACKAGE NAME> <YOUR WORLD>.launch
$ roslaunch my_robot world.launch

# In a new terminal, launch amcl launch file:
# roslaunch <YOUR PACKAGE NAME> amcl.launch
$ roslaunch whereami amcl.launch

```

## Control Step
#### (Option-1)Publishing Directly
Open a new terminal window anywhere in the catkin_ws and publish velocity commands directly to the robot's wheel actuators. To stop vehicle publish zero values and then Ctrl + C.
```bash
$ rostopic pub /cmd_vel geometry_msgs/Twist  "linear:
  x: 0.1
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.1" 
```

#### (Optioin-2) Teleop Robot
Open new terminal and from anywhere inside catkin_ws
```bash
$ rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

#### (Option-3) Navigation Goal
Send a `2D Nav Goal` from RViz. Click the `2D Nav Goal` button in the toolbar, then click and drag on the map to send the goal to the robot. It will start moving and localize itself in the process. If you would like to give the amcl node a nudge, you could give the robot an initial position estimate on the map using 2D Pose Estimate.



## Tuning Localization Parameters
The amcl package has a lot of parameters to select from. Different sets of parameters contribute to different aspects of the algorithm. Broadly speaking, they can be categorized into three categories - overall filter, laser, and odometry. Let’s cover some of the parameters that we recommend you start with or details to focus on.

#### Overall Filter
* `min_particles` and `max_particles` - As amcl dynamically adjusts its particles for every iteration, it expects a range of the number of particles as an input. Often, this range is tuned based on your system specifications. A larger range, with a high maximum might be too computationally extensive for a low-end system.
* `initial_pose` - For the project, you should set the position to [0, 0]. Feel free to play around with the mean yaw value.
* `update_min*` - `amcl` relies on incoming laser scans. Upon receiving a scan, it checks the values for `update_min_a` and `update_min_d` and compares to how far the robot has moved. Based on this comparison it decides whether or not to perform a filter update or to discard the scan data. Discarding data could result in poorer localization results, and too many frequent filter updates for a fast moving robot could also cause computational problems.


#### Laser
There are two different types of models to consider under this - the `likelihood_field` and the `beam`. Each of these models defines how the laser rangefinder sensor estimates the obstacles in relation to the robot.

The `likelihood_field` model is usually more computationally efficient and reliable for an environment such as the one you are working with. So you can focus on parameters for that particular model such as the -

* laser_*_range
* laser_max_beams
* laser_z_hit and laser_z_rand
Tuning of these parameters will have to be experimental. While tuning them, observe the laser scan information in RViz and try to make sure that the laser scan matches or is aligned with the actual map, and how it gets updated as the robot moves. The better the estimation of where the obstacles are, the better the localization results.


#### Odometry
`odom_model_type` - Since you are working with a differential drive mobile robot, it’s best to use the `diff-corrected` type. There are additional parameters that are specific to this type - the `odom_alphas` (1 through 4). These parameters define how much noise is expected from the robot's movements/motions as it navigates inside the map.

Note: The odometry information for this project is received directly from Gazebo, and is equivalent to the ground truth value (no noise expected). So, you need not have to tune these parameters and can leave them at their default values. But feel free to experiment with some values and see if you notice any changes.

If you received warning on `Transform Timeout` and `Map Update Loop`, you might want to configure the corresponding parameters. Namely larger `transform_tolerance` value for the AMCL node and lower `update_frequency` & `publish_frequency` values in the configuration files.
