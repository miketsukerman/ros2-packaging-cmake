cmake_minimum_required(VERSION 3.20)

project(subscriber VERSION 0.1)

find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(subscriber_node 
  src/subscriber_main.cpp
  src/MinimalSubscriber.cpp
  )

target_include_directories(subscriber_node PUBLIC include)

ament_target_dependencies(subscriber_node rclcpp std_msgs)

install(TARGETS
  subscriber_node
  DESTINATION lib/${PROJECT_NAME})

ament_package()

set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGE_NAME "subscriber")

include(CPack)
