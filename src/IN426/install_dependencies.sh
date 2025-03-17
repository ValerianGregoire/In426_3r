#!/bin/bash

sudo apt update -y

# Install project's dependencies 
sudo apt -y install python3-colcon-common-extensions
sudo apt -y install python3-pip
sudo apt -y install ros-galactic-gazebo-ros-pkgs ros-galactic-tf-transformations ros-galactic-tf2-tools ros-galactic-teleop-twist-keyboard ros-galactic-xacro

pip3 install transforms3d

echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc

sudo apt install -y ros-galactic-joint-state-publisher-gui ros-galactic-effort-controllers ros-galactic-controller-manager ros-galactic-gazebo-ros2-control ros-galactic-ros2-control ros-galactic-joint-state-broadcaster ros-galactic-joint-trajectory-controller ros-galactic-position-controllers ros-galactic-diff-drive-controller ros-galactic-velocity-controllers

source /opt/ros/galactic/setup.bash
cd ~/ros2_ws && colcon build --symlink-install
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc