#!/bin/bash
cd /vagrant/
yum update
yum install -y vim git tree wget curl

curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
chmod a+x kerl

yum install -y gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel pam-devel

rm OTP* otp* -rf
wget http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho10.tar.gz
tar zxvf otp_src_R16B02-basho10.tar.gz
cd OTP_R16B02_basho10
./otp_build autoconf
./configure && make && sudo make install


#https://packagecloud.io/basho/riak/packages/el/7/riak-2.2.0-1.el7.centos.x86_64.rpm
curl -s https://packagecloud.io/install/repositories/basho/riak/script.rpm.sh | sudo bash
yum install riak-2.2.0-1.el7.centos.x86_64 -y

: << 'END'
#http://docs.basho.com/riak/kv/2.2.0/setup/installing/source/
cd /vagrant
lurl -O http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.2.0/riak-2.2.0.tar.gz
curl -O http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.2.0/riak-2.2.0.tar.gz
tar zxvf riak-2.2.0.tar.gz
cd riak-2.2.0
make locked-deps
make rel

#http://docs.basho.com/riak/kv/2.2.0/setup/installing/rhel-centos/
cd /vagrant
wget http://s3.amazonaws.com/downloads.basho.com/riak/2.2/2.2.0/riak-2.2.0.tar.gz
tar zxvf riak-2.2.0.tar.gz
cd riak-2.2.0
make rel
END
