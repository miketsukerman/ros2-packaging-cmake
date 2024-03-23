cmake_minimum_required(VERSION 3.20)

project(maths VERSION 0.1)

find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)

add_library(maths SHARED
  src/RandomNumber.cpp
  )

target_include_directories(maths
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/maths>
)

ament_export_targets(maths_targets HAS_LIBRARY_TARGET)

install(
  DIRECTORY include/
  DESTINATION include
)

install(
  TARGETS maths
  EXPORT maths_targets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(TARGETS
  maths
  DESTINATION lib/${PROJECT_NAME})

ament_package()

set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGE_NAME "maths")

include(CPack)
