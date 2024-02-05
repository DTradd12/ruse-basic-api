#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/rust-basic-api/deploy.log

echo 'cd /home/ec2-user/rust-basic-api/' >> /home/ec2-user/rust-basic-api/deploy.log
cd /home/ec2-user/rust-basic-api/ >> /home/ec2-user/rust-basic-api/deploy.log

echo 'cargo build' >> /home/ec2-user/rust-basic-api/deploy.log
cargo build  >> /home/ec2-user/rust-basic-api/deploy.log