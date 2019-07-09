#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing nexus on rhel, ubuntu.

# https://help.sonatype.com/repomanager2/download#Download-NexusRepositoryManager2OSS

sudo yum -y update

# installing git java-1.8.0 on ubuntu.
# sudo apt -y install git openjdk-8-jdk

# installing git java-1.8.0 on rhel.
sudo yum -y install git java-1.8.0-openjdk

sudo yum -y install git java-1.8.0-openjdk.x86_64

# downloading nexus
curl -J -L https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o nexus.tar.gz

# extracting nexus tarball.
tar xzf nexus.tar.gz

# renaming nexus-VERSION to nexus-server.
mv nexus-* nexus

sudo adduser nexus

sudo chown -R nexus:nexus $HOME/nexus

sudo ln -s /nexus/bin/nexus /etc/init.d/nexus

# starting nexus server.
sh $HOME/nexus/bin/nexus start
