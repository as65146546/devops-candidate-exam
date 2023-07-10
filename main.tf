resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a" 
}

resource "aws_route_table" "private_route_table" {
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.aws_nat_gateway.nat.id
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my-lambda-function"
  role          = data.aws_iam_role.lambda.arn
  filename      = "lambda_function.zip"  
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "My security group"
  vpc_id      = data.aws_vpc.vpc.id
  
}


