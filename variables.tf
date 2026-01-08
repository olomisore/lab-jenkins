# Proxmox API credentials
  variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  sensitive   = true
}

#pm_api_url = "https://100.123.73.123:8006/api2/json"


# variable "vm_name" {
#  description = "Name of the VM in Proxmox"
#  type        = string
#}

# variable "vmid" {
#  description = "Unique VM ID in Proxmox"
#  type        = number
# }

# variable "memory" {
#  description = "VM memory in MB"
#  type        = number
#  default     = 4096
# }

# variable "cores" {
#  description = "Number of CPU cores"
#  type        = number
#  default     = 2
# }
