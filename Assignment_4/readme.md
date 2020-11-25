# CS344: Assignment 4 readme

## Group number : 2
### Tejas Khairnar               180101081
### Pooja Bhagat                 180101057
### Parth Bakare                 180101056
### Param Aryan Singh            180101055



There are **4** files which we need to run using **vdbench**. After creating ZFS and ext4 partitions, place 
**zfs_compression**, **ext4_compression**, **zfs_largefiles** and **ext4_largefiles** in the **vdbench** folder. Run the following commands one by one:

``` 
sudo ./vdbench -f zfs_compression
sudo ./vdbench -f ext4_compression
sudo ./vdbench -f zfs_largefiles
sudo ./vdbench -f ext4_largefiles
``` 