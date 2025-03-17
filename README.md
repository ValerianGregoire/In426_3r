# In426_3r

### Installation

mkdir -p ~/ros2_ws/src && cd ~/ros2_ws/src && git clone https://github.com/JohvanyROB/IN426
cd ~/ros2_ws/src/IN426 && ./install_galactic.sh && source ~/.bashrc
cd ~/ros2_ws/src/IN426 && ./install_dependencies.sh && source ~/ros2_ws/install/setup.bash

### Build

**To be determined**

### Execution

# Run example
ros2 launch in426_simu display_example_launch.py
ros2 launch in426_simu display_1_launch.py
ros2 launch in426_simu simu_1_launch.py

