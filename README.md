Using the above cloudformation template files we can provision the Test-Automation Framework in AWS Dev Tier.

Infrastructure_Automation.yml file is part of the Jenkins job: cloudformation-uitest.
It will create MongoDB instance and RDS instance and associate DNS entries in prod tier route 53.

cgw-automation-testing.json file is ECS cluster setup that is used for Test automation framework.
The jenkins job  will bring up an EC2 instance and add it to the cluster and wait for the services to come steady and live. 



