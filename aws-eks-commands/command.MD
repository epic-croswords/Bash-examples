# Refrance: https://docs.aws.amazon.com/cli/latest/ 
# Iam role
``` aws iam create-role \
    --role-name EKSClusterRole \
    --assume-role-policy-document file://EKSClusterRole.json 

aws iam create-role \
    --role-name EKSNodeGroupRole \
    --assume-role-policy-document file://EKSNodeGroupRole.json

# list iam roles
    aws iam list-roles
```
##############################################################################

# IAM policy's attach to role
aws iam attach-role-policy  \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy \
    --role-name EKSClusterRole

aws iam attach-role-policy  \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy \
    --role-name EKSNodeGroupRole

aws iam attach-role-policy  \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly \
    --role-name EKSNodeGroupRole

aws iam attach-role-policy  \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy \
    --role-name EKSNodeGroupRole


# check the polices attached to that role 
aws iam list-attached-role-policies --role-name EKSNodeGroupRol
aws iam list-attached-role-policies --role-name EKSNodeGroupRole

##################################################################################################

# eks node group (EC2)

aws eks create-nodegroup \
    --cluster-name Zomatodemo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup \
    --node-role EKSNodeGroupRole \
    --subnets "subnet-0e2907431c9988b72" "subnet-04ad87f71c6e5ab4d" "subnet-09d912bb63ef21b9a" \
    --scaling-config minSize=1,maxSize=3,desiredSize=1 \
    --region ap-south- \
    --instance-types 't2.micro' \
    --ami-type AL2_x86_64 \ 

# describe  eks node-group

aws eks describe-nodegroup \
    --cluster-name Zomatodemo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup


# delete eks cluster

aws eks delete-nodegroup \
    --cluster-name Zomatodemo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup


###############################################################################################


# EKS cluster create

aws eks create-cluster \
    --name Zomato-demo-cluster \
    --region ap-south-1 \
    --role-arn arn:aws:iam::900866925774:role/EKSClusterRole \
    --resources-vpc-config subnetIds=subnet-049162076a2fde04b,subnet-001b2b091c7fb10b8,securityGroupIds=sg-0bfbeaa33359645a9 \
    --kubernetes-version "1.28"

# Describe EKS cluster

aws eks describe-cluster \
    --cluster-name Zomato-demo-cluster

# Delete EKS cluster
aws eks delete-cluster \
    --name Zomato-demo-cluster
