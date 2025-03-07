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

## Q3. Explore with Wireshark/TCP-dump/cisco packet tracer tools and learn about packets filters
```
dineshprabhu@ubuntu:~$ sudo tcpdump -i enp0s3
[sudo] password for dineshprabhu: 
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
17:12:49.751854 IP6 ubuntu.37026 > whatsapp-cdn6-shv-02-tir3.fbcdn.net.https: Flags [P.], seq 3420881801:3420881870, ack 70729111, win 65535, length 69
17:12:49.752528 IP6 whatsapp-cdn6-shv-02-tir3.fbcdn.net.https > ubuntu.37026: Flags [.], ack 69, win 65535, length 0
17:12:49.792816 IP ubuntu.57104 > 10.0.2.3.domain: 20591+ [1au] PTR? 7.6.1.0.0.0.0.0.c.0.0.b.e.c.a.f.d.c.1.0.4.8.2.f.0.8.8.2.3.0.a.2.ip6.arpa. (101)
17:12:49.849058 IP 10.0.2.3.domain > ubuntu.57104: 20591 1/0/1 PTR whatsapp-cdn6-shv-02-tir3.fbcdn.net. (150)
17:12:49.851059 IP ubuntu.54338 > 10.0.2.3.domain: 30942+ [1au] PTR? 1.9.a.1.b.7.1.2.9.1.2.a.2.d.7.2.6.c.7.a.7.2.8.8.0.0.9.4.1.0.4.2.ip6.arpa. (101)
17:12:49.884102 IP 10.0.2.3.domain > ubuntu.54338: 30942 NXDomain 0/0/1 (101)
17:12:49.884495 IP ubuntu.54338 > 10.0.2.3.domain: 30942+ PTR? 1.9.a.1.b.7.1.2.9.1.2.a.2.d.7.2.6.c.7.a.7.2.8.8.0.0.9.4.1.0.4.2.ip6.arpa. (90)
17:12:49.911961 IP 10.0.2.3.domain > ubuntu.54338: 30942 NXDomain 0/0/0 (90)
17:12:49.914167 IP ubuntu.54820 > 10.0.2.3.domain: 18052+ [1au] PTR? 3.2.0.10.in-addr.arpa. (50)
17:12:49.951576 IP 10.0.2.3.domain > ubuntu.54820: 18052 NXDomain 0/1/1 (127)
17:12:49.952633 IP ubuntu.54820 > 10.0.2.3.domain: 18052+ PTR? 3.2.0.10.in-addr.arpa. (39)
17:12:49.980821 IP 10.0.2.3.domain > ubuntu.54820: 18052 NXDomain 0/1/0 (116)
17:12:49.982743 IP ubuntu.57459 > 10.0.2.3.domain: 62535+ [1au] PTR? 15.2.0.10.in-addr.arpa. (51)
17:12:49.985207 IP6 whatsapp-cdn6-shv-02-tir3.fbcdn.net.https > ubuntu.37026: Flags [P.], seq 1:72, ack 69, win 65535, length 71
17:12:49.985286 IP6 ubuntu.37026 > whatsapp-cdn6-shv-02-tir3.fbcdn.net.https: Flags [.], ack 72, win 65535, length 0
17:12:50.010551 IP 10.0.2.3.domain > ubuntu.57459: 62535 NXDomain 0/1/1 (128)
17:12:50.011187 IP ubuntu.57459 > 10.0.2.3.domain: 62535+ PTR? 15.2.0.10.in-addr.arpa. (40)
17:12:50.039631 IP 10.0.2.3.domain > ubuntu.57459: 62535 NXDomain 0/1/0 (117)
17:12:51.749165 IP ubuntu.34870 > 166.188.117.34.bc.googleusercontent.com.https: Flags [P.], seq 1579480755:1579480794, ack 103232941, win 63301, length 39
17:12:51.749807 IP 166.188.117.34.bc.googleusercontent.com.https > ubuntu.34870: Flags [.], ack 39, win 65535, length 0
17:12:51.750239 IP ubuntu.34870 > 166.188.117.34.bc.googleusercontent.com.https: Flags [P.], seq 39:63, ack 1, win 63301, length 24
17:12:51.750500 IP ubuntu.34870 > 166.188.117.34.bc.googleusercontent.com.https: Flags [F.], seq 63, ack 1, win 63301, length 0
17:12:51.750910 IP 166.188.117.34.bc.googleusercontent.com.https > ubuntu.34870: Flags [.], ack 63, win 65535, length 0
17:12:51.750911 IP 166.188.117.34.bc.googleusercontent.com.https > ubuntu.34870: Flags [.], ack 64, win 65535, length 0
17:12:51.774651 IP 166.188.117.34.bc.googleusercontent.com.https > ubuntu.34870: Flags [F.], seq 1, ack 64, win 65535, length 0
17:12:51.774709 IP ubuntu.34870 > 166.188.117.34.bc.googleusercontent.com.https: Flags [.], ack 2, win 63301, length 0
17:12:51.805991 IP ubuntu.46788 > 10.0.2.3.domain: 18769+ [1au] PTR? 166.188.117.34.in-addr.arpa. (56)
17:12:52.215118 IP 10.0.2.3.domain > ubuntu.46788: 18769 1/0/1 PTR 166.188.117.34.bc.googleusercontent.com. (109)
^C
28 packets captured
28 packets received by filter
0 packets dropped by kernel
```


## Q4. Understand linux utility commands like - ping, arp (Understand each params from ifconfig output)

ping:
```
dineshprabhu@ubuntu:~$ ping embedur.ai
PING embedur.ai (162.159.136.54) 56(84) bytes of data.
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=1 ttl=255 time=27.8 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=2 ttl=255 time=24.9 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=3 ttl=255 time=30.2 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=4 ttl=255 time=25.2 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=5 ttl=255 time=23.6 ms
^C
--- embedur.ai ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4060ms
rtt min/avg/max/mdev = 23.591/26.329/30.183/2.354 ms
dineshprabhu@ubuntu:~$ ping -c 4 embedur.ai
PING embedur.ai (162.159.137.54) 56(84) bytes of data.
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=1 ttl=255 time=27.0 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=2 ttl=255 time=27.2 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=3 ttl=255 time=35.0 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=4 ttl=255 time=35.3 ms

--- embedur.ai ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3045ms
rtt min/avg/max/mdev = 27.049/31.123/35.280/4.017 ms
dineshprabhu@ubuntu:~$ ping -i 2 embedur.ai
PING embedur.ai (162.159.137.54) 56(84) bytes of data.
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=1 ttl=255 time=30.0 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=2 ttl=255 time=29.2 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=3 ttl=255 time=28.6 ms
64 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=4 ttl=255 time=28.8 ms

--- embedur.ai ping statistics ---
^C4 packets transmitted, 4 received, 0% packet loss, time 6155ms
rtt min/avg/max/mdev = 28.572/29.141/29.953/0.523 ms
dineshprabhu@ubuntu:~$ ping -w 10 embedur.ai
PING embedur.ai (162.159.136.54) 56(84) bytes of data.
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=1 ttl=255 time=25.3 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=2 ttl=255 time=25.6 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=3 ttl=255 time=27.3 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=4 ttl=255 time=25.2 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=5 ttl=255 time=24.1 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=6 ttl=255 time=23.2 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=7 ttl=255 time=23.5 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=8 ttl=255 time=23.9 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=9 ttl=255 time=23.1 ms
64 bytes from 162.159.136.54 (162.159.136.54): icmp_seq=10 ttl=255 time=98.6 ms

--- embedur.ai ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9156ms
rtt min/avg/max/mdev = 23.144/31.980/98.594/22.238 ms
dineshprabhu@ubuntu:~$ ping -s 128 embedur.ai
PING embedur.ai (162.159.137.54) 128(156) bytes of data.
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=1 ttl=255 time=27.7 ms
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=2 ttl=255 time=28.9 ms
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=3 ttl=255 time=29.2 ms
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=4 ttl=255 time=30.0 ms
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=5 ttl=255 time=27.8 ms
136 bytes from 162.159.137.54 (162.159.137.54): icmp_seq=6 ttl=255 time=31.2 ms
^C
--- embedur.ai ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5185ms
rtt min/avg/max/mdev = 27.690/29.129/31.236/1.239 ms
```

arp:
```
dineshprabhu@ubuntu:~$ arp -a
_gateway (10.0.2.2) at 52:55:0a:00:02:02 [ether] on enp0s3
? (10.0.2.3) at 52:55:0a:00:02:03 [ether] on enp0s3
dineshprabhu@ubuntu:~$ arp -n
Address                  HWtype  HWaddress           Flags Mask            Iface
10.0.2.2                 ether   52:55:0a:00:02:02   C                     enp0s3
10.0.2.3                 ether   52:55:0a:00:02:03   C                     enp0s3
```
ifconfig:
```
dineshprabhu@ubuntu:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 2401:4900:8827:a7c6:27d2:a219:217b:1a91  prefixlen 64  scopeid 0x0<global>
        inet6 fd00::22e1:a406:ddad:68df  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::aadd:c79a:288e:f3c7  prefixlen 64  scopeid 0x20<link>
        inet6 fd00::baa0:d2a0:5a27:bcf7  prefixlen 64  scopeid 0x0<global>
        inet6 2401:4900:8827:a7c6:f87a:91eb:1ada:3db1  prefixlen 64  scopeid 0x0<global>
        ether 08:00:27:60:5d:41  txqueuelen 1000  (Ethernet)
        RX packets 41517  bytes 53275193 (53.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14563  bytes 1767469 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2378  bytes 415199 (415.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2378  bytes 415199 (415.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```


## Q5. Understand what happens if a duplicate IPs configured in a network.
Duplicate IP address conflict is a condition where 2 devices have the same IP addresses assigned to them .

Duplicate IP conflicts arise in 2 situations mostly :
1. When two devices are statically (manually) assigned the same IP 
2. When the same IP which is manually assigned is also there in the DHCP pool, so when a device boots and gets the same IP from the DHCP pool duplicate IP conflict occurs

- The devices might have network connectivity issues and the network traffic will get disturbed and the routers will disable one of the devices  
- In OS like Windows,Linux or MacOS, if there are duplicate IP detections, they pop an error stating “has detected an IP address conflict”.
- It also causes a ARP table instability. Since ARP maps IP Addresses to MAC address, conflicting devices keep updating their MAC in the ARP table causing incorrect data routing. And thus this can lead to sending packets to a wrong device or dropped packets.

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

## Q8) Check iwconfig/ifconfig to understand in detail about network interfaces (check about interface speed, MTU and other parameters)

ifconfig:
```dineshprabhu@ubuntu:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 2401:4900:8827:a7c6:27d2:a219:217b:1a91  prefixlen 64  scopeid 0x0<global>
        inet6 fd00::22e1:a406:ddad:68df  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::aadd:c79a:288e:f3c7  prefixlen 64  scopeid 0x20<link>
        inet6 fd00::baa0:d2a0:5a27:bcf7  prefixlen 64  scopeid 0x0<global>
        inet6 2401:4900:8827:a7c6:f87a:91eb:1ada:3db1  prefixlen 64  scopeid 0x0<global>
        ether 08:00:27:60:5d:41  txqueuelen 1000  (Ethernet)
        RX packets 41517  bytes 53275193 (53.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14563  bytes 1767469 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2378  bytes 415199 (415.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2378  bytes 415199 (415.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

iwconfig:
```
dineshprabhu@ubuntu:~$ iwconfig
lo        no wireless extensions.

enp0s3    no wireless extensions.
```

## Q10. Explain how DHCP server assigns IP addresses to devices in your network
A DHCP server automatically assigns IP addresses and other network configurations to devices over a network. This eliminates the need for a manual IP assignment and ensure there is no conflicts regarding the same. 
Whenever a device wants to connect to a network , it undergoes DORA process to get IP address using DHCP :

DORA PROCESS :

1. DISCOVER -  if a client device has no IP address yet , it sends a DHCP discover message as a broadcast to find a DHCP server.This message is sent to all available DHCP servers in the network.

2. OFFER -  dhcp server responds with a ip address along with subnet mask ,duration of ip that device can hold (lease time) , gateway ip through DHCPOFFER message.

3. REQUEST - the device will accept the ip provided from the dhcp server, and it will notify all the other dhcp servers taht this particular ip is assigned to that device .Other dhcp servers will not use that to another device untill this device duration ends through DHCPREQUEST message.

4. ACKNOWLEDGMENT -  The DHCP confirms the assignment by sending a DHCP acknowledgement message.

The assigned IP is temporary and has a lease time. Befire it expires the client sends a DHCP request again to renew the lease.If the lease expires without renewal, the IP is returned to the pool for other devices.

