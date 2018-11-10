variable "gce_ssh_pub_key_file" {
  description = "ssh key"
  default = "/home/garrettwong/.ssh/ansible_ssh_key.pub"
}

variable "gce_ssh_user" {
  description = "ssh user"
  default = "garrettwong"
}
