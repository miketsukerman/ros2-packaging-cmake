cmake_minimum_required(VERSION 3.8)
project(package_b)

# find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)

add_executable(package_b SHARED src/package_b.cpp)

target_include_directories(package_b
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

ament_package()
