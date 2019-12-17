+	Spin up 1 VMs   
+	Create “inventory” file with all necessary connection options to VM. 
+	Create following roles and setup basic utils
+ Htop
+ Atop
+ Iftop
+ Vim
+ Wget
+ Curl
+ snmp
+ Jenkins
+ Letsencrypt
+ Nginx 
+ setup Jenkins. 
 - Add flag maintenance_mode true/false which will disable external access to Jenkins but leave it for your own external IP (external IP variable should be present, also add variable nginx_proxy true/false which add Nginx role) 
+ setup Nginx proxy for jenkins (default behavior to move jenkins to 80 port, add variable ssl_connect true, to include setup ssl and configure 301 redirect to 443)
+ setup ssl depend on flag true/false
----- 	All roles should have the possibility to be installed depend on the type of OS
+ Ubuntu
 +- Centos (setup all basik utils , but don't configure nginx for revers proxy)
Use facts to get type of OS
E)	Create jenkins-setup.yaml playbook all roles should be included
F)   Second run of the jenkins-setup.yaml playbook should have no yellow lines (changed)
