Using the above cloudformation template files we can provision a part of Test-Automation Framework in AWS account B.
It will create MongoDB instance and RDS instance and associate DNS entries in Account A route 53.

2nd cloudformation template file is ECS cluster setup that is used for Test automation framework. Which I have not specified here as it will be different based on microservices used in each organization. 

The jenkins job  will bring up an EC2 instance and add it to the cluster and wait for the services to come steady and live. 

UITeststartCluster.sh will change ECS cloudformation's AVGMAXsize to 1 from 0

UITeststopCluster.sh will change ECS cloudformation's AVGMAXsize to 0 from 1
