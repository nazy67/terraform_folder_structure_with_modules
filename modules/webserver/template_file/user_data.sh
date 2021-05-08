 #!/bin/bash
 sudo yum update -y
 sudo yum install -y httpd 
 sudo systemctl start httpd
 sudo systemctl enable httpd
 echo "db details for ${env} env\naddress = ${address}\nusername=${username}" app > /var/www/html/index.html