FROM stackbrew/ubuntu:14.04

# Basic environment setup
RUN apt-get update; apt-get install -y unzip openjdk-7-jdk openjdk-7-doc openjdk-7-jre-lib wget supervisor docker.io openssh-server
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

# Set default password
RUN echo 'root:superstrongpasswd' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

# install scala
#RUN curl -o /tmp/scala-2.10.2.tgz http://www.scala-lang.org/files/archive/scala-2.10.2.tgz
#RUN tar xzf /tmp/scala-2.10.2.tgz -C /usr/share/
#RUN ln -s /usr/share/scala-2.10.2 /usr/share/scala

# symlink scala binary to /usr/bin
#RUN for i in scala scalc fsc scaladoc scalap; do ln -s /usr/share/scala/bin/${i} /usr/bin/${i}; done

#RUN curl -o /tmp/sbt.deb  http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.12.4/sbt.deb
#RUN dpkg -i /tmp/sbt.deb
RUN mkdir /testmystuff
VOLUME ["/testmystuff"]

echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get install sbt

#CMD cd /myapp && sbt run

