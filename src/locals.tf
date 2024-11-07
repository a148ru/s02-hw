locals {
    web_name = "netology-${var.env}-${var.platform.3}-${var.role[0]}"
    db_name = "netology-${var.env}-${var.platform.3}-${var.role[1]}"
    vms_ssh_root_key = {
        serial_port = ({
            stat = var.serial_enable
        }),
        ssh = ({
            key = "${var.user_name}:${var.vms_ssh_root_key}"
        })
        }
}
