terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
 #source = "bpg/proxmox"
      #version = "0.89.1"
    }
  }
}

provider "proxmox" {
  ### for telmate configurations
  pm_api_url = "https://100.123.73.123:8006/api2/json"
  pm_api_token_id = "Terraform@pam!terraform"
  pm_api_token_secret = "ccbe9edb-7349-4572-a05d-405521b5474f"
  pm_tls_insecure = true
 
  ### for bpg configurations
  #endpoint = "https://100.123.73.123:8006/api2/json"
  #api_token = {
   #id = "Terraform@pam!terraform"
   #secret = "ccbe9edb-7349-4572-a05d-405521b5474f"
  #}
 
  #insecure = true
}


resource "proxmox_vm_qemu" "windows-desktop2" {
  # name = vm name
  name         = "windows-desktop2"
  description = "Managed by Terraform"
  tags        = "terraform,windows-workstation"
  target_node = "lab"
  memory = 8192  
  bios         = "ovmf"
  scsihw       = "virtio-scsi-pci"
 
  ### or for a ISO image
  # iso         = "ISO file name"

  ### or for a Clone VM operation
  clone 		= "Windows11Template"
  full_clone 	= "true"
  

  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
 
 
  ### system specs
   cpu {
	cores = 8
	}

    #boot = "order=scsi0"
	boot = "order=ide0"
	hotplug = "disk,network,usb"
   
   disk {
	slot = "ide0"
	size = "120G"
	type = "disk"
	storage = "local-lvm"
	#discard = "on" for ssd
	}

   network {
	id = 0
	model = "e1000"
	bridge = "vmbr1"
	#firewall = false
	# link_down = fales
	}
	ipconfig0 = "ip=192.168.3.12/24,gw=192.168.3.1"
}
