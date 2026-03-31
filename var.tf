variable "node_name" {
 description = "Proxmox nodes names"
 type = list(string)
 default = [
  "hv-epyc-02",
  "hv-r630-02",
  "hv-r630-01"
 ]
}

variable "vmids" {
  description = "VMIDs"
  type = list(string)
  default = [ 
    "20004",
    "20005"
   ]
}

variable "ips" {
  description = "IPs"
  type = list(string)
  default = [ 
    "172.16.220.4/16",
    "172.16.220.5/16"
   ]
}




