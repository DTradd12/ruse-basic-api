#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/myrepo/deploy.log
# nodejs-app is the same name as stored in pm2 process
echo 'cargo run' >> /home/ec2-user/myrepo/deploy.log
cargo run >> /home/ec2-user/myrepo/deploy.log