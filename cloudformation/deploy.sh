#!/bin/sh

CFN_STACK_NAME=RaiseTech-cfn
CFN_PROFILE=raise_tech

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}" --template-file rt_vpc.yml \
--profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-sg" --template-file rt_sg.yml \
--profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-iam" --template-file rt_iam.yml \
--capabilities CAPABILITY_NAMED_IAM --profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-ec2" --template-file rt_ec2.yml \
--capabilities CAPABILITY_NAMED_IAM --profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-elb" --template-file rt_elb.yml \
--profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-s3" --template-file rt_s3.yml \
--profile ${CFN_PROFILE}

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-rds" --template-file rt_rds.yml \
--profile ${CFN_PROFILE}
