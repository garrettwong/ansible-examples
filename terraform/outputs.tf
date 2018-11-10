output "storage_bucket_url" {
 value = "${google_storage_bucket.ansible_bucket.url}"
}

output "storage_bucket_self_link" {
 value = "${google_storage_bucket.ansible_bucket.self_link}"
}
