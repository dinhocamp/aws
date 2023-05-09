a=0
a=`php -v | grep Zend | wc -l`
if test $a -eq 0
then
sudo apt-get install php apache2 mysql-server 
if test $? -eq 0 
then 
echo modules successfully installed
sudo apt-get install php-mysqli
if test $? -eq 0
then
echo mysqli instqlled successfully
sed -e 's/;extension=mysqli/extension=mysqli' /etc/php/8.1/apache2/php.ini
if test $? -eq 0
then
echo extension enabled
else 
echo could not find  config file
return
fi
else
echo probelm installing mysqli extension
return
fi
else 
echo problem installing modules
return
fi
else 
echo "already installed"
sed 's/;extension=mysqli/extension=mysqli/' geekfile.txt /etc/php/8.1/apache2/php.ini 2>&1 
sudo systemctl enable apache2 2>&1
sudo systemctl start apache2 2>&1
if test $? -eq 0
then 
echo apache server started ...
else 
echo apache could not start
fi 
fi
