all: build package

build:
	. /opt/ros/iron/setup.sh && colcon build

package: 
	. /opt/ros/iron/setup.sh && colcon build --cmake-target package --cmake-target-skip-unavailable

clean: 
	rm -rf build install log

.PHONY: build package clean
