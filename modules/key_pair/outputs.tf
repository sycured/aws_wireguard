output "name" {
  description = "The key pair name."
  value       = concat(aws_key_pair.this.*.key_name, [""])[0]
}

output "id" {
  description = "The key pair ID."
  value       = concat(aws_key_pair.this.*.key_pair_id, [""])[0]
}

output "fingerprint" {
  description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
  value       = concat(aws_key_pair.this.*.fingerprint, [""])[0]
}