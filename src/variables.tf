###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = map(string)
  default     = {
    a="ru-central1-a",
    b="ru-central1-b",
    c="ru-central1-c"
    }
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = map(list(string))
  default     = {
    a=["10.0.1.0/24"],
    b=["10.0.2.0/24"],
    c=["10.0.3.0/24"]
  }
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "image" {
  type = map(string)
  default = {
    web="ubuntu-2004-lts",
    db="ubuntu-2204-lts"
    }
}

variable "env" {
  type = string
  default = "develop"
}

variable "role" {
  type = list(string)
  default = [
    "web",
    "db"
    ]
}

variable "platform" {
  type = map(string)
  default = {
    1 = "standard-v1"
    2 = "standard-v2"
    3 = "standard-v3"
  }
}


variable vm_param {
  type = map(any)
  default = {
    web = ({
      cores = 2,
      memory = 1,
      core_fract = 20
    }),
    db = ({
      cores = 2,
      memory = 2,
      core_fract = 20
    })
  }
}


#variable "vm_web_cores" {
#  type = number
#  default = 2
#}
#variable "vm_web_memory" {
#  type = number
#  default = 1
#}
#variable "vm_web_core_fract" {
#  type = number
#  default = 20
#} 

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  # default     = ""
  description = "ssh-keygen -t ed25519"
}

variable "serial_enable" {
  type = number
  default = 1
  description = "Serial port, default = enable (1)"
}

variable "user_name" {
  type = string
  default = "ubuntu"
}

