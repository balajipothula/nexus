FROM alpine:3.9
RUN apk update && apk upgrade && apk add --no-cache openjdk8-jre ttf-dejavu && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
VOLUME ["/root/.nexusoss2", "/root/.artifactory"]
CMD ["/root/.nexusoss2/bin/nexus", "start", "run"]

docker build -t balajipothula/nexusoss2:openjdk8-jre .

mkdir root                                                                                               && \
curl -J -L https://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz -o $HOME/root/nexus.tar.gz && \
tar xzf $HOME/root/nexus.tar.gz -C $HOME/root/                                                           && \
rm -rf  $HOME/root/nexus.tar.gz                                                                          && \
mv      $HOME/root/nexus-*       $HOME/root/.nexusoss2                                                   && \
mv      $HOME/root/sonatype-work $HOME/root/.artifactory                                                 && \
find    $HOME/root/.nexusoss2     -maxdepth 1 -name "*.txt" -type f -delete                              && \
find    $HOME/root/.nexusoss2/bin -maxdepth 1 -name "*.bat" -type f -delete                              && \
find    $HOME/root/.artifactory   -maxdepth 1 -name "*.txt" -type f -delete                              && \
rm -rf  $HOME/root/.nexusoss2/bin/jsw/{license,linux-ppc*,linux-x86-32,macosx*,solaris*,windows*}        && \
sed -i 's/sonatype-work/.artifactory/g' $HOME/root/.nexusoss2/conf/nexus.properties                      && \
sh      $HOME/root/.nexusoss2/bin/nexus start

docker run --name nexusoss2 -d -i --privileged --restart always -p 8081:8081 -v $HOME/root/.nexusoss2:/root/.nexusoss2 -v $HOME/root/.artifactory:/root/.artifactory balajipothula/nexusoss2:openjdk8-jre
