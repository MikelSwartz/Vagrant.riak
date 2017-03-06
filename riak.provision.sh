#!/bin/bash
cd /vagrant/
yum update
yum install -y vim git tree wget curl
curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
chmod a+x kerl

yum install -y gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel

yum install -y wxBase.x86_64

wget http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho10.tar.gz
tar zxvf otp_src_R16B02-basho10.tar.gz
cd OTP_R16B02_basho10
./otp_build autoconf
./configure && make && sudo make install

curl -s https://packagecloud.io/install/repositories/basho/riak/script.rpm.sh | sudo bash
yum install riak-2.2.0-1.el7.centos.x86_64 -y
