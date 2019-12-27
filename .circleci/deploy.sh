sudo apt-get update &&
sudo apt-get install -y python python-dev python-pip python-virtualenv &&
sudo rm -rf /var/lib/apt/lists/* &&
sudo pip install awsebcli &&
sudo pip install --upgrade --user awsebcli



mkdir /home/circleci/.aws
touch /home/circleci/.aws/config
chmod 600 /home/circleci/.aws/config
echo "[profile user]" > /home/circleci/.aws/config
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/circleci/.aws/config
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/circleci/.aws/config
eb use env-dev --profile default
eb deploy --profile default

echo 'Deployment Succeed' >> /tmp/workspace/beanstalk-deploy-status.txt