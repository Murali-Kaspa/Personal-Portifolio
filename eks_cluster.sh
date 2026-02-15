#!/bin/bash

eksctl create cluster \
--name portfolio-cluster \
--region ap-south-1 \
--version 1.29 \
--zones ap-south-1a,ap-south-1b,ap-south-1c \
--nodegroup-name slaves \
--node-type t2.medium \
--nodes 3 \
--nodes-max 3 \
--nodes-min 1 \
--managed
