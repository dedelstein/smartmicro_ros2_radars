FROM ros:foxy

## Revert to snapshot once GPG key error is resolved
RUN rm /etc/apt/sources.list.d/ros2-snapshots.list
RUN apt-get update && apt-get install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get install -y \
    iputils-ping \
    python3 \
    python3-pip \
    ros-foxy-point-cloud-msg-wrapper \
    ros-foxy-rviz2 \
    ros-foxy-rviz-common \
    ros-foxy-rviz-default-plugins \
    ros-foxy-rviz-rendering \
    can-utils \
    iproute2 \
    tmux \
    wget

WORKDIR /code
