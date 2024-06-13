provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

# Create VPC in us-east-1
module "vpc_us_east_1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  providers = {
    aws = aws.us_east_1
  }

  name = "vpc-us-east-1"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# Create VPC in us-east-2
module "vpc_us_east_2" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  providers = {
    aws = aws.us_east_2
  }

  name = "vpc-us-east-2"
  cidr = "10.1.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.3.0/24", "10.1.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# Launch EC2 instance in us-east-1
resource "aws_instance" "harish1" {
  provider = aws.us_east_1

  ami           = "ami-04b70fa74e45c3917"  
  instance_type = "t2.small"
  subnet_id     = module.vpc_us_east_1.public_subnets[0]

  tags = {
    Name = "Harish-example2"
  }
}

# Launch EC2 instance in us-east-2
resource "aws_instance" "harish2" {
  provider = aws.us_east_2

  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.small"
  subnet_id     = module.vpc_us_east_2.public_subnets[0]

  tags = {
    Name = "HarishInstance2"
  }
}

