variable "project_id" {
  description = "The project id in which to deploy"
}

variable "region" {
  description = "The region in which to deploy the instances"
}

variable "zone" {
  description = "The zone in which to deploy the instances"
}

variable "gce_ssh_pub_key_file" {
  description = "ssh key"
  default     = "~/.ssh/ansible_ssh_key.pub"
}

variable "gce_ssh_user" {
  description = "ssh user"
  default     = "garrettwong"
}
