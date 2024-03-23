cmake_minimum_required(VERSION 3.20)

project(publisher VERSION 0.1)

find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)
find_package(std_msgs REQUIRED)
find_package(maths REQUIRED)

add_executable(publisher_node 
  src/publisher_main.cpp
  src/MinimalPublisher.cpp
)

target_include_directories(publisher_node PUBLIC include)

ament_target_dependencies(publisher_node rclcpp std_msgs maths)

install(TARGETS
  publisher_node
  DESTINATION lib/${PROJECT_NAME})

ament_package()

set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGE_NAME "publisher")

include(CPack)
