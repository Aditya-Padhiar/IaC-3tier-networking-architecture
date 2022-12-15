resource "aws_route53_record" "blue-r53" {
  zone_id = var.host_zone_id
  name    = var.hostname
  type    = "CNAME"
  ttl     = 5

  weighted_routing_policy {
    weight = 100
  }

  set_identifier = "${var.env}-${var.team}-${var.service_1}"
  records        = [var.record_1]
}

resource "aws_route53_record" "green-r53" {
  zone_id = var.host_zone_id
  name    = var.hostname
  type    = "CNAME"
  ttl     = 5

  weighted_routing_policy {
    weight = 0
  }

  set_identifier = "${var.env}-${var.team}-${var.service_2}"
  records        = [var.record_2]
}