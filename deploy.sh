#!/bin/bash

# Build your Rust application using Cargo
cargo build --release

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Error: Rust compilation failed."
    exit 1
fi

# Copy the binary to the AWS server
echo "Copying binary to AWS server..."
scp -i $SSH_PRIVATE_KEY target/release/your_binary ec2-user@$EC2_HOST:$REMOTE_DIRECTORY

# SSH into the AWS server and execute the binary
echo "Executing binary on AWS server..."
ssh -i $SSH_PRIVATE_KEY $EC2_USER@$EC2_HOST << EOF
    cd $REMOTE_DIRECTORY
    chmod +x your_binary  # Make the binary executable
    ./your_binary  # Execute the binary
EOF

echo "Deployment complete!"
