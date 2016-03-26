#!/bin/bash -ex
install_salt_repo() {
  rpm --import https://repo.saltstack.com/yum/redhat/6/x86_64/latest/SALTSTACK-GPG-KEY.pub
  cat >/etc/yum.repos.d/saltstack.repo <<EOS
[saltstack-repo]
name=SaltStack repo for RHEL/CentOS 6
baseurl=https://repo.saltstack.com/yum/redhat/6/\$basearch/latest
enabled=1
gpgcheck=1
gpgkey=https://repo.saltstack.com/yum/redhat/6/\$basearch/latest/SALTSTACK-GPG-KEY.pub
EOS
}

yum_update() {
  yum clean expire-cache
  yum -y update
}

install_salt_master() {
  yum -y install salt-master
  chkconfig salt-master on
}

install_salt_minion() {
  yum -y install salt-minion
  chkconfig salt-minion on
}

install_salt_repo &>> /var/tmp/boostrap.log
yum_update &>> /var/tmp/boostrap.log
install_salt_master &>> /var/tmp/boostrap.log
install_salt_minion &>> /var/tmp/boostrap.log
