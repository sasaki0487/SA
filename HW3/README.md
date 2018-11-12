# zfs (**Remember to use snapshot!!!**)
## 1. Make zfs running 
  Add ``` zfs_enable="YES" ``` to ``` /etc/rc.conf ``` (This should have been done in HW1)
  
  Zfs will auto startup when booting
## 2. Create mirror storage pool "my pool"
  Add a disk to your virtual machine for mirroring (If you use virtual machine)
  
  **OR** 
  
  Use the partition of your current disk 
  
  You have to turn off your machine to add new disk
  
  I use a new disk and make two partition (4GB each) to use them as a mirror
  steps:
  ```
  sudo gpart create -s GPT ada1
  sudo gpart add -t freebsd-ufs -s 4G ada1
  sudo gpart add -t freebsd-ufs -s 4G ada1
  sudo zpool create mypool mirror /dev/adap1 /dev/adap2
  ```
  
  and then you will get a mirrored pool !!
