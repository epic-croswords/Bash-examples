# Refrance: https://docs.aws.amazon.com/cli/latest/ 
```
# Iam role
 aws iam create-role \
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
```
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
```
```
# check the polices attached to that role 
aws iam list-attached-role-policies --role-name EKSNodeGroupRole
aws iam list-attached-role-policies --role-name EKSClusterRole 

```
##################################################################################################

# eks node group (EC2)
```
aws eks create-nodegroup \
    --cluster-name Zomato-demo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup \
    --node-role arn:aws:iam::211125481124:role/EKSNodeGroupRole \
    --subnets "subnet-0fbc610fbefb0e635" "subnet-0390a8c068acf0eee" "subnet-030f37c4c7c8c0bee" \
    --scaling-config minSize=1,maxSize=3,desiredSize=1 \
    --region ap-south-1 \
    --instance-types "t2.micro" \
    --ami-type "AL2_x86_64"

# describe  eks node-group

aws eks describe-nodegroup \
    --cluster-name Zomato-demo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup


# delete eks cluster

aws eks delete-nodegroup \
    --cluster-name Zomatodemo-cluster \
    --nodegroup-name zomatodemo-eks-nodegroup

```
###############################################################################################

# EKS cluster create

```
aws eks create-cluster \
    --name Zomato-demo-cluster \
    --region ap-south-1 \
    --role-arn arn:aws:iam::211125481124:role/EKSClusterRole \
    --resources-vpc-config subnetIds=subnet-0390a8c068acf0eee,subnet-030f37c4c7c8c0bee,securityGroupIds=sg-0cc346d6d8fb8b543 \
    --kubernetes-version "1.28"

# Describe EKS cluster

aws eks describe-cluster \
    --name Zomato-demo-cluster

# Delete EKS cluster
aws eks delete-cluster \
    --name Zomato-demo-cluster
```

#####################################################################################

# setup ingress controller service ac
``
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://AWSLoadBalancerControllerIAMPolicy.json
``
# create iam role for 
``
aws iam create-role \
    --role-name AmazonEKSLoadBalancerControllerRole \
    --assume-role-policy-document file://iam_trust.json
``

# attach role policy to iam role arn
aws iam attach-role-policy \
    --role-name AmazonEKSLoadBalancerControllerRole \
    --policy-arn arn:aws:iam::aws:policy/AWSLoadBalancerControllerIAMPolicy

#  associate iam role with service account 
`` 
eksctl create iamserviceaccount \
  --cluster Zomato-demo-cluster \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::aws:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
``
######################################################################################

# IAM policies and three role's
role:AWSServiceRoleForAmazonEKS
 AmazonEKSServiceRolePolicy

AWSServiceRoleForAmazonEKSForFargate
 AmazonEKSForFargateServiceRolePolicy

AWSServiceRoleForAmazonEKSNodegroup
 AWSServiceRoleForAmazonEKSNodegroup
 
