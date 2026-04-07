region        = "ap-south-1"

app_name      = "bank"
environment   = "dev"

cidr_block    = "10.0.0.0/16"
azs           = ["ap-south-1a", "ap-south-1b"]

instance_type = "t2.micro"
ami           = "ami-0c02fb55956c7d316"

enable_rds    = false