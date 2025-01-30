#!/bin/bash

# aws --profile abml ec2 run-instances --image-id ami-0d52744d6551d851e --count 1 --instance-type t2.micro --key-name grachev_key --security-group-ids sg-0731f9830f3a5ad6b --user-data file://init_script.sh --region ap-northeast-1
aws --profile abml ec2 run-instances --image-id ami-0d52744d6551d851e --count 1 --instance-type t2.micro --key-name grachev_key --security-group-ids sg-0731f9830f3a5ad6b --user-data file://reproduce.sh --region ap-northeast-1
