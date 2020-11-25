# CS344: Assignment 4 

## Group number : 2

### Tejas Khairnar     &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;   180101081
### Pooja Bhagat      &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;          180101057
### Parth Bakare   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                180101056
### Param Aryan Singh       &nbsp;      180101055

<br>


There are **4** files which we need to run using **vdbench**. After creating ZFS and ext4 partitions, place 
**zfs_compression**, **ext4_compression**, **zfs_largefiles** and **ext4_largefiles** in the **vdbench** folder. Run the following commands one by one:

<br>

``` shell
sudo ./vdbench -f zfs_compression
sudo ./vdbench -f ext4_compression
sudo ./vdbench -f zfs_largefiles
sudo ./vdbench -f ext4_largefiles
``` 