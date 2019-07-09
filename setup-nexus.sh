#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing nexus on rhel, ubuntu.

# https://help.sonatype.com/repomanager2/download#Download-NexusRepositoryManager2OSS

# installing git java-1.8.0 on ubuntu.
# sudo apt -y install git openjdk-8-jdk

# installing git java-1.8.0 on rhel.
sudo yum -y install git java-1.8.0-openjdk

# downloading nexus
curl -J -L https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o nexus.tar.gz

# extracting nexus tarball.
tar xzf nexus.tar.gz

# renaming nexus-VERSION to nexus-server.
mv nexus-* nexus

# starting nexus server.
sh $HOME/nexus/bin/nexus start
