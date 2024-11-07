output "info" {
    # instance_name, external_ip, fqdn
    value = [
        [
            yandex_compute_instance.platform.name,
            yandex_compute_instance.platform.network_interface[0].nat_ip_address,
            yandex_compute_instance.platform.fqdn
        ],
        [
            yandex_compute_instance.db-platform.name,
            yandex_compute_instance.db-platform.network_interface[0].nat_ip_address,
            yandex_compute_instance.db-platform.fqdn
        ]
    ]
}