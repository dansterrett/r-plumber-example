# This script will build the image and deploy it to AWS Elastic Container Register
# To run this shell script: `./deploy-to-aws-ecr.sh`

# Login
$(aws2 ecr get-login --no-include-email --region us-east-1)

# Build image
docker build -t dansterrett/r-plumber-example .

# Tag image to include repo name
docker tag dansterrett/r-plumber-example:latest 689967901690.dkr.ecr.us-east-1.amazonaws.com/dansterrett/r-plumber-example:latest

# Push to AWS ECR
docker push 689967901690.dkr.ecr.us-east-1.amazonaws.com/dansterrett/r-plumber-example:latest
