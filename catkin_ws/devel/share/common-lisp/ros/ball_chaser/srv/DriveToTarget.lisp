; Auto-generated. Do not edit!


(cl:in-package ball_chaser-srv)


;//! \htmlinclude DriveToTarget-request.msg.html

(cl:defclass <DriveToTarget-request> (roslisp-msg-protocol:ros-message)
  ((linear_x
    :reader linear_x
    :initarg :linear_x
    :type cl:float
    :initform 0.0)
   (angular_z
    :reader angular_z
    :initarg :angular_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass DriveToTarget-request (<DriveToTarget-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveToTarget-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveToTarget-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ball_chaser-srv:<DriveToTarget-request> is deprecated: use ball_chaser-srv:DriveToTarget-request instead.")))

(cl:ensure-generic-function 'linear_x-val :lambda-list '(m))
(cl:defmethod linear_x-val ((m <DriveToTarget-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ball_chaser-srv:linear_x-val is deprecated.  Use ball_chaser-srv:linear_x instead.")
  (linear_x m))

(cl:ensure-generic-function 'angular_z-val :lambda-list '(m))
(cl:defmethod angular_z-val ((m <DriveToTarget-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ball_chaser-srv:angular_z-val is deprecated.  Use ball_chaser-srv:angular_z instead.")
  (angular_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveToTarget-request>) ostream)
  "Serializes a message object of type '<DriveToTarget-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveToTarget-request>) istream)
  "Deserializes a message object of type '<DriveToTarget-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveToTarget-request>)))
  "Returns string type for a service object of type '<DriveToTarget-request>"
  "ball_chaser/DriveToTargetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveToTarget-request)))
  "Returns string type for a service object of type 'DriveToTarget-request"
  "ball_chaser/DriveToTargetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveToTarget-request>)))
  "Returns md5sum for a message object of type '<DriveToTarget-request>"
  "c8652349d2a34a90a09475339e2a93d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveToTarget-request)))
  "Returns md5sum for a message object of type 'DriveToTarget-request"
  "c8652349d2a34a90a09475339e2a93d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveToTarget-request>)))
  "Returns full string definition for message of type '<DriveToTarget-request>"
  (cl:format cl:nil "float64 linear_x~%float64 angular_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveToTarget-request)))
  "Returns full string definition for message of type 'DriveToTarget-request"
  (cl:format cl:nil "float64 linear_x~%float64 angular_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveToTarget-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveToTarget-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveToTarget-request
    (cl:cons ':linear_x (linear_x msg))
    (cl:cons ':angular_z (angular_z msg))
))
;//! \htmlinclude DriveToTarget-response.msg.html

(cl:defclass <DriveToTarget-response> (roslisp-msg-protocol:ros-message)
  ((msg_feedback
    :reader msg_feedback
    :initarg :msg_feedback
    :type cl:string
    :initform ""))
)

(cl:defclass DriveToTarget-response (<DriveToTarget-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveToTarget-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveToTarget-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ball_chaser-srv:<DriveToTarget-response> is deprecated: use ball_chaser-srv:DriveToTarget-response instead.")))

(cl:ensure-generic-function 'msg_feedback-val :lambda-list '(m))
(cl:defmethod msg_feedback-val ((m <DriveToTarget-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ball_chaser-srv:msg_feedback-val is deprecated.  Use ball_chaser-srv:msg_feedback instead.")
  (msg_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveToTarget-response>) ostream)
  "Serializes a message object of type '<DriveToTarget-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg_feedback))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg_feedback))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveToTarget-response>) istream)
  "Deserializes a message object of type '<DriveToTarget-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg_feedback) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg_feedback) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveToTarget-response>)))
  "Returns string type for a service object of type '<DriveToTarget-response>"
  "ball_chaser/DriveToTargetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveToTarget-response)))
  "Returns string type for a service object of type 'DriveToTarget-response"
  "ball_chaser/DriveToTargetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveToTarget-response>)))
  "Returns md5sum for a message object of type '<DriveToTarget-response>"
  "c8652349d2a34a90a09475339e2a93d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveToTarget-response)))
  "Returns md5sum for a message object of type 'DriveToTarget-response"
  "c8652349d2a34a90a09475339e2a93d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveToTarget-response>)))
  "Returns full string definition for message of type '<DriveToTarget-response>"
  (cl:format cl:nil "string msg_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveToTarget-response)))
  "Returns full string definition for message of type 'DriveToTarget-response"
  (cl:format cl:nil "string msg_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveToTarget-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msg_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveToTarget-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveToTarget-response
    (cl:cons ':msg_feedback (msg_feedback msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DriveToTarget)))
  'DriveToTarget-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DriveToTarget)))
  'DriveToTarget-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveToTarget)))
  "Returns string type for a service object of type '<DriveToTarget>"
  "ball_chaser/DriveToTarget")