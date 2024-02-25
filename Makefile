all: build package

build:
	. /opt/ros/iron/setup.sh && colcon build

package: 
	. /opt/ros/iron/setup.sh && colcon build --cmake-target package --cmake-target-skip-unavailable

.PHONY: build package
