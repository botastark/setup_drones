echo "Create catkin workspace"

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
source /opt/ros/melodic/setup.bash
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

sudo apt-get install python3-pip -y
sudo apt install libzmqpp-dev -y

roscore

sudo apt-get install python-catkin-tools python-rosinstall-generator -y 

wstool init src

rosinstall_generator --rosdistro melodic mavlink | tee /tmp/mavros.rosinstall

rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4 

sudo apt-get install ros-melodic-geographic-msgs ros-melodic-libmavconn ros-melodic-mavlink ros-melodic-tf2-eigen ros-melodic-uuid-msgs



sudo apt-get install ros-${ROS_DISTRO}-control-toolbox

rosdep install --from-paths src --ignore-src -y -r

(https://github.com/mavlink/mavros/issues/1938)

sudo ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh
catkin build
source devel/setup.bash

sudo apt install git ninja-build pkg-config gcc g++ systemd
sudo pip3 install meson
git clone https://github.com/mavlink-router/mavlink-router
cd mavlink-router
git submodule update --init --recursive

gedit .bashrc 
	add alias python=/usr/bin/python3.6

meson setup build .
