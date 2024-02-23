cmake_minimum_required(VERSION 3.8)
project(package_a)

# find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)

add_library(package_a SHARED src/package_a.cpp)

target_include_directories(package_a
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

ament_package()
