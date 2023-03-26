# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ball_chaser: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ball_chaser_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_custom_target(_ball_chaser_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ball_chaser" "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(ball_chaser
  "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ball_chaser
)

### Generating Module File
_generate_module_cpp(ball_chaser
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ball_chaser
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ball_chaser_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ball_chaser_generate_messages ball_chaser_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_dependencies(ball_chaser_generate_messages_cpp _ball_chaser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ball_chaser_gencpp)
add_dependencies(ball_chaser_gencpp ball_chaser_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ball_chaser_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(ball_chaser
  "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ball_chaser
)

### Generating Module File
_generate_module_eus(ball_chaser
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ball_chaser
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ball_chaser_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ball_chaser_generate_messages ball_chaser_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_dependencies(ball_chaser_generate_messages_eus _ball_chaser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ball_chaser_geneus)
add_dependencies(ball_chaser_geneus ball_chaser_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ball_chaser_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(ball_chaser
  "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ball_chaser
)

### Generating Module File
_generate_module_lisp(ball_chaser
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ball_chaser
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ball_chaser_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ball_chaser_generate_messages ball_chaser_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_dependencies(ball_chaser_generate_messages_lisp _ball_chaser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ball_chaser_genlisp)
add_dependencies(ball_chaser_genlisp ball_chaser_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ball_chaser_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(ball_chaser
  "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ball_chaser
)

### Generating Module File
_generate_module_nodejs(ball_chaser
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ball_chaser
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ball_chaser_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ball_chaser_generate_messages ball_chaser_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_dependencies(ball_chaser_generate_messages_nodejs _ball_chaser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ball_chaser_gennodejs)
add_dependencies(ball_chaser_gennodejs ball_chaser_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ball_chaser_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(ball_chaser
  "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ball_chaser
)

### Generating Module File
_generate_module_py(ball_chaser
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ball_chaser
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ball_chaser_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ball_chaser_generate_messages ball_chaser_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eight/Downloads/Udacity_RoboticsSE/Project/RoboticsND-where-am-i/catkin_ws/src/ball_chaser/srv/DriveToTarget.srv" NAME_WE)
add_dependencies(ball_chaser_generate_messages_py _ball_chaser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ball_chaser_genpy)
add_dependencies(ball_chaser_genpy ball_chaser_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ball_chaser_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ball_chaser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ball_chaser
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ball_chaser_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ball_chaser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ball_chaser
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ball_chaser_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ball_chaser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ball_chaser
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ball_chaser_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ball_chaser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ball_chaser
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ball_chaser_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ball_chaser)
  install(CODE "execute_process(COMMAND \"/home/eight/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ball_chaser\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ball_chaser
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ball_chaser_generate_messages_py std_msgs_generate_messages_py)
endif()
