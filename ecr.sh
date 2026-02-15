#!/bin/bash
set -x
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION="ap-south-1"
REPO="personal-portfolio"

aws ecr get-login-password --region ${REGION} \
	| docker login --username AWS \
	--password-stdin ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com
docker tag personal-portfolio:1.0 \
       	${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO}:1.0

docker push ${ACCOUNT_ID}.dkr.ecr.ap-south-1.amazonaws.com/${REPO}:1.0

