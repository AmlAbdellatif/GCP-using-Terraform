# GCP-using-Terraform
## The infrastrcuture
  ### 1-VPC: create vpc with 2 subnet 
            a)managment subnet with 
              - nat-getway
              - router
            b)restricted subnet without external ip for cluster
            c) firewall to allow sh on vpc
  ### 2-Private VM: to connect to the cluster
  ### 3-Cluster
  ### 4-Cluster-node
  ### 5-Service account for the cluster node
   
# Stpes:-
    ### 1- create the privous infratrcure using terraform
    ### 2- dockerize the  [DevOps-Challenge-Demo-Code](https://github.com/atefhares/DevOps-Challenge-Demo-Code)  project
    ### 3- upload the image to GCR in GCP
    ### 4- create  app.yml and config.yml files to create conatiner from my own private image
    ### 5- ssh to private vm and then log to my cluster 
    ### 6- install kubectl
    ### 7- apply the yml files 
    ### 8- run some commands to create image redis
        > 1-kubectl expose pod redis --name=<REDIS_HOST> --port=6379
          2-kubectl run redis --image=redis
          3- kubectl expose deployment  <PROJECT_APP> --type LoadBalancer --port 80 --target-port 8000
          
# Try my deployed demo from [HERE](34.136.160.160)

