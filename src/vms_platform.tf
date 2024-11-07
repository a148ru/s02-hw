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
