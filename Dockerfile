# Minecraft Dockerfile

# Base system is the 14.04 LTS version of Ubuntu
FROM ubuntu:14.04

MAINTAINER Asgaut Eng <asgaut@gmail.com>

# Use APT (Advanced Packaging Tool) built in the Linux distro to download Java, a dependency
# to run Minecraft.
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jre-headless wget

# Download Minecraft Server components
RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.9.2/minecraft_server.1.9.2.jar

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
# Create mount point, and mark it as holding externally mounted volume
WORKDIR /data
VOLUME /data

# Expose the container's network port: 25565 during runtime.
EXPOSE 25565

# Default command to run. Accept Minecraft EULA, and start Minecraft server.
CMD echo eula=true > /data/eula.txt && java -jar /minecraft_server.1.9.2.jar
