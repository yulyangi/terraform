#!/usr/bin/env bash

apt update
apt -y install apache2

myip=`curl ident.me`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="black">
<h2>My external IP is $myip</h2>
</body>
</html>
EOF

systemctl enable apache2
systemctl restart apache2


