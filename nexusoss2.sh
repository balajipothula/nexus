sudo yum -y update

sudo yum -y install java-1.8.0-openjdk

mkdir root                                                                                               && \
curl -J -L https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o $HOME/root/nexus.tar.gz && \
tar xzf $HOME/root/nexus.tar.gz -C $HOME/root/                                                           && \
rm -rf  $HOME/root/nexus.tar.gz                                                                          && \
mv      $HOME/root/nexus-*       $HOME/root/.nexusoss2                                                   && \
mv      $HOME/root/sonatype-work $HOME/root/.artifactory                                                 && \
find    $HOME/root/.nexusoss2     -maxdepth 1 -name "*.txt" -type f -delete                              && \
find    $HOME/root/.nexusoss2/bin -maxdepth 1 -name "*.bat" -type f -delete                              && \
find    $HOME/root/.artifactory   -maxdepth 1 -name "*.txt" -type f -delete                              && \
rm -rf  $HOME/root/.nexusoss2/bin/jsw/{license,linux-ppc*,linux-x86-32,macosx*,solaris*,windows*}  
