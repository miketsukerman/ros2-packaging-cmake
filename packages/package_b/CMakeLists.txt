cmake_minimum_required(VERSION 3.8)
project(package_b)

find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)
find_package(package_a REQUIRED)

add_executable(package_b src/package_b.cpp)

target_include_directories(package_b
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

ament_target_dependencies(package_b package_a)

ament_package()

set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGE_NAME "package_b")

include(CPack)
