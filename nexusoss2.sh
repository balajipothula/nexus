sudo yum -y update

sudo yum -y install java-1.8.0-openjdk

curl -J -L https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o $HOME/nexus.tar.gz && \
tar xzf $HOME/nexus.tar.gz -C $HOME/                                                                && \
rm -rf  $HOME/nexus.tar.gz                                                                          && \
mv      $HOME/nexus-* $HOME/.nexusoss2                                                              && \
mv      $HOME/sonatype-work $HOME/.artifactory                                                      && \
find    $HOME/.nexusoss2     -maxdepth 1 -name "*.txt" -type f -delete                              && \
find    $HOME/.nexusoss2/bin -maxdepth 1 -name "*.bat" -type f -delete                              && \
find    $HOME/.artifactory   -maxdepth 1 -name "*.txt" -type f -delete                              && \
rm -rf  $HOME/.nexusoss2/bin/jsw/{license,linux-ppc*,linux-x86-32,macosx*,solaris*,windows*}
