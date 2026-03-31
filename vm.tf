
resource "proxmox_vm_qemu" "training"{
  count = 2
  vmid  = var.vmids[count.index]
  name  = "sn2-steeve-training-${count.index + 1}"
  desc = "vm-terraform training"
  target_node = var.node_name[count.index]

  pool  = "SN2"

  cpu_type  = "x86-64-v2-AES"
  cores = 1
  memory = 1024

  os_type = "cloudinit"

  ciuser = "steeve"
  sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIISgkgG/k9t6mwuqs1Dj8EMcBGdjssLTQKpG4VwSzhoo jeffr@LAPTOP-2KUDLANL"

  full_clone = false
  clone = "deb-trixie-cloud-SN2-12T"

  serial {
    id  = 0
  }
  scsihw = "virtio-scsi-single"

  disks{
    ide{
      ide3{
        cloudinit{
          storage = "SN2-12T"
        }
      }
    }
    scsi{
    scsi0{
      disk{
        storage = "SN2-12T"
        size = 10
        format = "qcow2"
      }
    }
  }
}
  

  network{
    id    = 0
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${var.ips[count.index]},gw=172.16.255.254"

}