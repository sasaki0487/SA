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
## 3. Create and set datasets
  Create three public,upload,and hidden three datasets under mypool
  ```
  sudo zfs create mypool/public
  sudo zfs create mypool/upload
  sudo zfs create mypool/hidden
  ```
  
  You can use ``` zfs list ``` to check you datasets
  
  Then change the setting of you datasets (Steps of the three are the same , I'll only type once)
  ```
  # set the mountpoint of dataset
  sudo zfs set mountpoint=/home/ftp/public mypool/public
  # set compression of dataset , you can change gzip to gzip1,gzip2,...,gzip9 to modify the compression level
  sudo zfs set compression=gzip mypool/public
  ```
  
  Use ``` zfs get ${the status you want to check} ${the dataset you want to check} ``` to check dataset status
