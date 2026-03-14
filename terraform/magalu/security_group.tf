resource "mgc_network_security_groups" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Security group for Minecraft server"
}

resource "mgc_network_security_groups_rules" "ssh" {
  description       = "Allow SSH"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.minecraft_sg.id
}

resource "mgc_network_security_groups_rules" "minecraft_port" {
  description       = "Allow Minecraft Java Edition"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 25565
  port_range_max    = 25565
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.minecraft_sg.id
}

resource "mgc_network_security_groups_rules" "icmp" {
  description       = "Allow ICMP (ping)"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.minecraft_sg.id
}
