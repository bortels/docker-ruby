#
# ruby Dockerfile
# Bits ruthlessly swiped from https://index.docker.io/u/bugthing/docker-debian-ruby-nodejs/
# Yay for trusted builds! Yay for bugthing! Yay for docker!
#
# This seems to work, but I'm faking it mostly. If you are a superior mutant and see an issue,
# tell me, or fork this bad boy and fix it (and tell me, please!)

# Pull base image.
FROM dockerfile/ubuntu
MAINTAINER bortels@gmail.com

RUN apt-get install -y build-essential

# install chruby
RUN wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz && tar -xzvf chruby-0.3.8.tar.gz
RUN cd chruby-0.3.8/ && make install

# install ruby-install
RUN wget -O ruby-install-0.4.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.3.tar.gz && tar -xzvf ruby-install-0.4.3.tar.gz
RUN cd ruby-install-0.4.3/ && make install

# install Ruby
# Currently, ruby is broken with readline versions 6.3 or greater, here's the ugly workaround
# https://github.com/postmodern/ruby-install/issues/136
#RUN ruby-install -p https://gist.githubusercontent.com/plexus/10021256/raw/9d9edf8d4f03643c7dce4d52c576ad40f2a01760/ruby-2.1.1-readline.patch ruby 2.1
# When fixed, kill that and use this:
RUN ruby-install ruby 2.1.2

# install & configure ruby env
RUN echo '[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return' >> /etc/profile.d/chruby.sh
RUN echo 'source /usr/local/share/chruby/chruby.sh' >> /etc/profile.d/chruby.sh
ENV PATH $PATH:/opt/rubies/ruby-2.1.2/bin
RUN echo 'chruby ruby-2.1.2' >> $HOME/.bash_profile
