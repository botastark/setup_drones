echo "Installing ROS Melodic"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -


sudo apt update
sudo apt install ros-melodic-desktop
echo "installed ROS melodic"
echo "verify"
apt search ros-melodic


source /opt/ros/melodic/setup.bash 

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "installing dependencies"
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt-get install ros-melodic-catkin python-catkin-tools -y
sudo rosdep init

rosdep update


