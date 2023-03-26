;; Auto-generated. Do not edit!


(when (boundp 'ball_chaser::DriveToTarget)
  (if (not (find-package "BALL_CHASER"))
    (make-package "BALL_CHASER"))
  (shadow 'DriveToTarget (find-package "BALL_CHASER")))
(unless (find-package "BALL_CHASER::DRIVETOTARGET")
  (make-package "BALL_CHASER::DRIVETOTARGET"))
(unless (find-package "BALL_CHASER::DRIVETOTARGETREQUEST")
  (make-package "BALL_CHASER::DRIVETOTARGETREQUEST"))
(unless (find-package "BALL_CHASER::DRIVETOTARGETRESPONSE")
  (make-package "BALL_CHASER::DRIVETOTARGETRESPONSE"))

(in-package "ROS")





(defclass ball_chaser::DriveToTargetRequest
  :super ros::object
  :slots (_linear_x _angular_z ))

(defmethod ball_chaser::DriveToTargetRequest
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:angular_z __angular_z) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _angular_z (float __angular_z))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:angular_z
   (&optional __angular_z)
   (if __angular_z (setq _angular_z __angular_z)) _angular_z)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _angular_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_z
       (sys::poke _angular_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_z
     (setq _angular_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ball_chaser::DriveToTargetResponse
  :super ros::object
  :slots (_msg_feedback ))

(defmethod ball_chaser::DriveToTargetResponse
  (:init
   (&key
    ((:msg_feedback __msg_feedback) "")
    )
   (send-super :init)
   (setq _msg_feedback (string __msg_feedback))
   self)
  (:msg_feedback
   (&optional __msg_feedback)
   (if __msg_feedback (setq _msg_feedback __msg_feedback)) _msg_feedback)
  (:serialization-length
   ()
   (+
    ;; string _msg_feedback
    4 (length _msg_feedback)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg_feedback
       (write-long (length _msg_feedback) s) (princ _msg_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg_feedback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg_feedback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ball_chaser::DriveToTarget
  :super ros::object
  :slots ())

(setf (get ball_chaser::DriveToTarget :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::DriveToTarget :datatype-) "ball_chaser/DriveToTarget")
(setf (get ball_chaser::DriveToTarget :request) ball_chaser::DriveToTargetRequest)
(setf (get ball_chaser::DriveToTarget :response) ball_chaser::DriveToTargetResponse)

(defmethod ball_chaser::DriveToTargetRequest
  (:response () (instance ball_chaser::DriveToTargetResponse :init)))

(setf (get ball_chaser::DriveToTargetRequest :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::DriveToTargetRequest :datatype-) "ball_chaser/DriveToTargetRequest")
(setf (get ball_chaser::DriveToTargetRequest :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback

")

(setf (get ball_chaser::DriveToTargetResponse :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::DriveToTargetResponse :datatype-) "ball_chaser/DriveToTargetResponse")
(setf (get ball_chaser::DriveToTargetResponse :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback

")



(provide :ball_chaser/DriveToTarget "c8652349d2a34a90a09475339e2a93d9")


