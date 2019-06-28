#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing nexus on rhel, ubuntu.

# installing git java-1.8.0 on ubuntu.
# sudo apt -y install git openjdk-8-jdk

# installing git java-1.8.0 on rhel.
sudo yum -y install git java-1.8.0-openjdk

# downloading nexus
wget https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz

# extracting nexus tarball.
tar xzf nexus-latest-bundle.tar.gz

# renaming nexus-VERSION to nexus-server.
mv nexus-* nexus-server

# starting nexus server.
sh $HOME/nexus-server/bin/nexus start
