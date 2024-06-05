echo "Create catkin workspace"

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin init
catkin build
source devel/setup.bash



echo "install mavlink"
sudo apt-get install ros-${ROS_DISTRO}-mavros ros-${ROS_DISTRO}-mavros-extras ros-${ROS_DISTRO}-mavros-msgs
sudo apt-get install libgeographic-dev -y
sudo apt-get install geographiclib-tools -y

wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh

catkin build
source devel/setup.bash

sudo apt-get install python3-pip 
sudo apt install libopencv-dev
sudo apt install libzmqpp-dev

source <ROS_INSTALL_PATH>/devel/setup.bash

roscore

sudo apt-get install python-catkin-tools python-rosinstall-generator -y 

cd ~/my_catkin_ws

catkin init 
wstool init src

rosinstall_generator --rosdistro melodic mavlink | tee /tmp/mavros.rosinstall

rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4 - Builds the ros workspace
rosdep install --from-paths src --ignore-src -y

(https://github.com/mavlink/mavros/issues/1938)

./src/mavros/mavros/scripts/install_geographiclib_datasets.sh - Install GeographicLib datasets

catkin build
source devel/setup.bash

