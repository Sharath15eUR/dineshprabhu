### Environment Configuration:

- Ubuntu VM (as local machine) - dineshprabhu@192.168.1.10 
- Windows 11( as remote machine) - admin@192.168.1.6


## Q1. Consider a case, a folder has multiple files and how would copy it to destination machine path (Try using SCP, cp options in Linux)

### Using SCP to copy a folder from local machine onto the remote machine

```
dineshprabhu@ubuntu:~$ scp -r ~/linuxtraining/mod1 admin@192.168.1.6:C:/Users/admin/Downloads
admin@192.168.1.6's password: 
file1                                             100%    0     0.0KB/s   00:00    
file2                                             100%    0     0.0KB/s   00:00    
outputfile                                        100%  413   135.0KB/s   00:00    
fileB                                             100%    0     0.0KB/s   00:00    
file3                                             100%    0     0.0KB/s   00:00    
fileC                                             100%    0     0.0KB/s   00:00    
fileA                                             100%    0     0.0KB/s   00:00    
```
### Using SCP to copy a folder from remote machine onto the local machine

```
PS C:\Users\admin> scp -r C:/Users/admin/Downloads/mod1 dineshprabhu@ubuntu:~/Downloads
The authenticity of host 'ubuntu (2401:4900:8824:8868:9e2f:cd2a:a32d:e57f)' can't be established.
ED25519 key fingerprint is SHA256:KfyfWq7lb5jeK9fBaGPhqMeKgQtDSJ5PK38Xt0E/Sas.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
Warning: Permanently added 'ubuntu' (ED25519) to the list of known hosts.
dineshprabhu@ubuntu's password:
file3                                                                                 100%    0     0.0KB/s   00:00
fileA                                                                                 100%    0     0.0KB/s   00:00
fileB                                                                                 100%    0     0.0KB/s   00:00
fileC                                                                                 100%    0     0.0KB/s   00:00
outputfile                                                                            100%  413    13.4KB/s   00:00
file1                                                                                 100%    0     0.0KB/s   00:00
file2                                                                                 100%    0     0.0KB/s   00:00
```
### Using `cp` for Local Copies
```bash
cp -r /source_folder /destination_folder
```
### Q2. Host a FTP and SFTP server and try PUT and GET operations.
FTP stands for _**File Transfer Protocol**_ and SFTP stands for _**Secure File Transfer Protocol**_ which is a more secure method of performing the latter command which is used to transfer file over a network in a fast and secure manner.
In order to host a FTP server in Ubuntu, the `vsftpd` package needs to be installed and configured.

**Installation and Configuration Commands:**
```
sudo apt-get update
sudo apt-get install vsftpd
sudo service vsftpd status
sudo nano /etc/vsftpd.conf
->local_enable=YES
->write_enable=YES
->chroot_local_user=YES
->user_sub_token=$USER
->local_root=/home/$USER/ftp
->pasv_min_port=10000
->pasv_max_port=10100
->userlist_enable=YES
->userlist_file=/etc/vsftpd.userlist
->userlist_deny=NO
sudo adduser dinesh
sudo mkdir /home/dinesh/ftp
sudo chmod a-w /home/dinesh/ftp
sudo mkdir /home/dinesh/ftp/upload
sudo chown dinesh:dinesh /home/dinesh/ftp/upload
echo "My FTP Server" | sudo tee /home/dinesh/ftp/upload/demo.txt
sudo ls -la /home/dinesh/ftp
echo "dinesh" | sudo tee -a /etc/vsftpd.userlist
sudo systemctl restart vsftpd
```


We can access the server using the command `ftp <ip_address>`. Server can be accessed using normal linux commands.In order to get a file from the server, `get filename` is used which saves the file from the server to the present working directory

Alternatively, the server can also be accessed from Windows by connecting to `ftp://ip_address` from the File Explorer and files from Windows can be put into the server

## Q5. Understand what happens if a duplicate IPs configured in a network.
Duplicate IP address conflict is a condition where 2 devices have the same IP addresses assigned to them .

Duplicate IP conflicts arise in 2 situations mostly :
1. When two devices are statically (manually) assigned the same IP 
2. When the same IP which is manually assigned is also there in the DHCP pool, so when a device boots and gets the same IP from the DHCP pool duplicate IP conflict occurs

WHAT HAPPENS IN THOSE SITUATIONS?
1. The devices might have network connectivity issues and the network traffic will get disturbed and the routers will disable one of the devices  
2. In OS like Windows,Linux or MacOS, if there are duplicate IP detections, they pop an error stating “has detected an IP address conflict”.
3. It also causes a ARP table instability. Since ARP maps IP Addresses to MAC address, conflicting devices keep updating their MAC in the ARP table causing incorrect data routing. And thus this can lead to sending packets to a wrong device or dropped packets.

Some ways to detect and prevent duplicate IP addresses are:  
1. Admins can check ARP tables to identify duplicate entries.  
2. DHCP server logs can also detect conflicts.  
3. Re-assigning a unique IP to static IP devices is also one solution.
4. In larger networks, Dynamic ARP Inspection (DAI) can be enabled to prevent unauthorized ARP modifications, reducing the risk of conflicts and spoofing attacks.

## Q6. Understand how to access remote system using (VNC viewer, Anydesk,Teamviewer)

## VNC Viewer: 
- Used to connect to remote system
- On the remote computer, install the VNC server and on the local device install the VNC Viewer. 
- Setup the VNC server on the remote computer by providing password for access. 
- Connect using your RealVNC account and select the remote computer to connect. Use the password to authenticate. 
- It has a criteria that it should be connected to a same lan or wifi network
- But it is less secure since no encryption is done only the password is there to protect data.

## Anydesk:
- Download and install Anydesk on both the computers.  
- Share the access code shown on the remote computer to the local computer user.   
- Enter the access code on the local machine and accept the connection request on the remote computer to establish control of the remote computer.  
- No need of common LAN, works on internet
- It uses AES(more secured than VNC)

## Teamviewer:
- Install Teamviewer on both the remote and local devices.  
- Share the iD and the password of the remote device to the local machine user.  
- Enter the ID and authenticate using the password to establish control and start the session.  
  
## Remote Desktop Connection:  
- Built in tool in some windows edition
- Very much secured and configured
- Need a common lan or wifi

## Q7. Check if default gateway is reachable or not and understand about default gateways
Default Gateway: <br>
The default gateway is the router or network device that connects your computer to other networks, including the internet.
It acts as a bridge between your local network (LAN) and the outside world (WAN/Internet).

## Q10. Explain how DHCP server assigns IP addresses to devices in your network
A DHCP server automatically assigns IP addresses and other network configurations to devices over a network. This eliminates the need for a manual IP assignment and ensure there is no conflicts regarding the same. 
Whenever a device wants to connect to a network , it undergoes DORA process to get IP address using DHCP :

DORA PROCESS :

1. DISCOVER -  if a client device has no IP address yet , it sends a DHCP discover message as a broadcast to find a DHCP server.This message is sent to all available DHCP servers in the network.

2. OFFER -  dhcp server responds with a ip address along with subnet mask ,duration of ip that device can hold (lease time) , gateway ip through DHCPOFFER message.

3. REQUEST - the device will accept the ip provided from the dhcp server, and it will notify all the other dhcp servers taht this particular ip is assigned to that device .Other dhcp servers will not use that to another device untill this device duration ends through DHCPREQUEST message.

4. ACKNOWLEDGMENT -  The DHCP confirms the assignment by sending a DHCP acknowledgement message.

The assigned IP is temporary and has a lease time. Befire it expires the client sends a DHCP request again to renew the lease.If the lease expires without renewal, the IP is returned to the pool for other devices.

