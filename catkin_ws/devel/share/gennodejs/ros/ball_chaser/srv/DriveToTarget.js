// Auto-generated. Do not edit!

// (in-package ball_chaser.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class DriveToTargetRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.linear_x = null;
      this.angular_z = null;
    }
    else {
      if (initObj.hasOwnProperty('linear_x')) {
        this.linear_x = initObj.linear_x
      }
      else {
        this.linear_x = 0.0;
      }
      if (initObj.hasOwnProperty('angular_z')) {
        this.angular_z = initObj.angular_z
      }
      else {
        this.angular_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriveToTargetRequest
    // Serialize message field [linear_x]
    bufferOffset = _serializer.float64(obj.linear_x, buffer, bufferOffset);
    // Serialize message field [angular_z]
    bufferOffset = _serializer.float64(obj.angular_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriveToTargetRequest
    let len;
    let data = new DriveToTargetRequest(null);
    // Deserialize message field [linear_x]
    data.linear_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_z]
    data.angular_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ball_chaser/DriveToTargetRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6aa08055c0c4aea51799f3f7164796a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 linear_x
    float64 angular_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriveToTargetRequest(null);
    if (msg.linear_x !== undefined) {
      resolved.linear_x = msg.linear_x;
    }
    else {
      resolved.linear_x = 0.0
    }

    if (msg.angular_z !== undefined) {
      resolved.angular_z = msg.angular_z;
    }
    else {
      resolved.angular_z = 0.0
    }

    return resolved;
    }
};

class DriveToTargetResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msg_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('msg_feedback')) {
        this.msg_feedback = initObj.msg_feedback
      }
      else {
        this.msg_feedback = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriveToTargetResponse
    // Serialize message field [msg_feedback]
    bufferOffset = _serializer.string(obj.msg_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriveToTargetResponse
    let len;
    let data = new DriveToTargetResponse(null);
    // Deserialize message field [msg_feedback]
    data.msg_feedback = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msg_feedback);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ball_chaser/DriveToTargetResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2897a4bc4d7ca330e430870cfdee7314';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msg_feedback
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriveToTargetResponse(null);
    if (msg.msg_feedback !== undefined) {
      resolved.msg_feedback = msg.msg_feedback;
    }
    else {
      resolved.msg_feedback = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: DriveToTargetRequest,
  Response: DriveToTargetResponse,
  md5sum() { return 'c8652349d2a34a90a09475339e2a93d9'; },
  datatype() { return 'ball_chaser/DriveToTarget'; }
};
