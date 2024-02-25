cmake_minimum_required(VERSION 3.8)
project(package_a)

find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)

add_library(package_a src/package_a.cpp)

target_include_directories(package_a
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

ament_export_targets(package_a_targets HAS_LIBRARY_TARGET)

install(
  DIRECTORY include/
  DESTINATION include
)

install(
  TARGETS package_a
  EXPORT package_a_targets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

ament_package()

set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGE_NAME "package_a")

include(CPack)
