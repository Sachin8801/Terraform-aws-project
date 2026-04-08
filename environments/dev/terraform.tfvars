region        = "ap-south-1"

app_name      = "bank"
environment   = "dev"

cidr_block    = "10.0.0.0/16"
azs           = ["ap-south-1a", "ap-south-1b"]

instance_type = "t3.micro"
ami           = "ami-0f5ee92e2d63afc18"  # Ubuntu (ap-south-1)