

# attribute reference

output  "Public_IP" {
 value = aws_instance.os1.public_ip
}




output  "OS_state" {
 value = aws_instance.os1.instance_state
}

output "OS_AZ_name" {
 value = aws_instance.os1.availability_zone
}