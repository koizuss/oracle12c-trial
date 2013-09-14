echo "update yum ------------------------"
yum -y update

# desctop環境
echo "install desktop ------------------------"
yum -y groupinstall "X Window System" Desktop
sed -i 's|id:3:initdefault:|id:5:initdefault:|g' /etc/inittab

# 日本語化パッケージ
echo "install lang-japanese ------------------------"
yum -y groupinstall "Japanese Support"
yum -y install system-config-language

# oracle12c setup
echo "install oracle env ------------------------"
yum -y install oracle-rdbms-server-12cR1-preinstall

echo "setup hosts ------------------------"
cp /etc/hosts /etc/hosts.default
cat /vagrant/shared/hosts > /etc/hosts
cat /etc/hosts

echo "setup sysctl ------------------------"
cp /etc/sysctl.conf /etc/sysctl.conf.default
cat /vagrant/shared/sysctl.conf >> /etc/sysctl.conf
cat /etc/sysctl.conf
/sbin/sysctl -p

echo "setup limits ------------------------"
cp /etc/security/limits.conf /etc/security/limits.conf.default
cat /vagrant/shared/limits.conf > /etc/security/limits.conf
cat /etc/security/limits.conf.default >> /etc/security/limits.conf
cat /etc/security/limits.conf

echo "setup /u01 ------------------------"
mkdir -p /u01/app/oracle/product/12.1.0/db_1
chown -R oracle:oinstall /u01
chmod -R 775 /u01

echo "setup oracle/.bash_profile ------------------------"
cat /vagrant/shared/.bash_profile >> /home/oracle/.bash_profile
cat /home/oracle/.bash_profile

echo "unzip installer ------------------------"
cd /home/oracle
unzip /vagrant/shared/installer/linuxamd64_12c_database_1of2.zip
unzip /vagrant/shared/installer/linuxamd64_12c_database_2of2.zip

# echo "create swap ------------------------"
# dd if=/dev/zero of=/swap.extended bs=1G count=3
# mkswap /swap.extended
# swapon /swap.extended
# swapon -s
#
# cp /etc/fstab /etc/fstab.default
# cat /vagrant/shared/fstab >> /etc/fstab
# cat /etc/fstab

echo "setup successful ------------------------"