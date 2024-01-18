#Creating Load Balancer
resource "aws_lb" "Load_Balancer1" {
  name               = "terraform-project-LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mysg.id] #a different security group can be defined for load balancer too
  subnets            = [aws_subnet.sb1.id,aws_subnet.sb2.id]
}

resource "aws_lb_target_group" "target_group" {
  name     = "LbTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

#if the targets are not ready or not available, we cannot send traffic there. So we need health checks
  health_check {
    path = "/" #home path
    port = "traffic-port"
      }
}

resource "aws_lb_target_group_attachment" "TG_attachment1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "TG_attachment2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.Load_Balancer1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}