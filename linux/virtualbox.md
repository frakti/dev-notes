# Installing Guest Addons (RHEL-based systems) 

```bash
  mount -r /dev/cdrom /media/cdrom
  su - 
  yum update kernel*
  reboot
  yum install gcc kernel-devel kernel-headers dkms make bzip2 perl
  KERN_DIR=/usr/src/kernels/`uname -r`
  export KERN_DIR
  /media/cdrom/VBoxLinuxAdditions.run
  reboot
```
  
# Expanding size of the disk
### Resources
  * [GParted Live ISO](http://gparted.sourceforge.net/download.php)

### Steps
```bash
  VBoxManage clonehd --format VDI box-disk1.wmdk disk.vdi
  VboxManage modifyhd disk.vdi --resize 10240 # In MB
  # Attach *.vdi HD as SATA controller
  # Mount GParted Live ISO
  # launch VM and extend disk using GPareted, then do reboot
  lvm vgdisplay | grep Free
  # => Free  PE / Size       122880 / 480.00 GiB
  lvm lvdisplay /dev/VolGroup/lv_root | grep Current
  # => Current LE             3978
  lvm lvresize -l 126858 /dev/VolGroup/lv_root # sum above values
  resize2fs /dev/VolGroup/lv_root 
  lsblk
  # Check
  fallocate -l 480G /test_file
```
  
  
  
