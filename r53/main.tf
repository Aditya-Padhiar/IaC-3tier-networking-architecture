module "r53" {
  source = "../modules/networking/r53"
  team = "devops"
  env = "dev"
  service_1 = "web_1"
  service_2 = "web_2"
  hostname = "architecture.oyorooms.ms"
  record_1 = "google.com"
  record_2 = "youtube.com"
  host_zone_id = "Z3C3N4ECRBLZZU"
}