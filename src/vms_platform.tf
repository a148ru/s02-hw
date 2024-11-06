###cloud vars
variable "db_subnet_name" {
    type = string
    default = "db-develop"
}

variable "db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#variable "vpc_name" {
#  type        = string
#  default     = "develop"
#  description = "VPC network & subnet name"
#}


variable "vm_db_image" {
  type = string
  default = "ubuntu-2204-lts"
}

variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}
variable "vm_db_platform" {
  type = string
  default = "standard-v3"
}
variable "vm_db_cores" {
  type = number
  default = 2
}
variable "vm_db_memory" {
  type = number
  default = 2
}
variable "vm_db_core_fract" {
  type = number
  default = 20
} 

###ssh vars
#
#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMk9vrkXYEC0Sm0DBtMXuSTWSH771egCT/P35D2ll6f a148ru@polaris134"
#  description = "ssh-keygen -t ed25519"
#}
