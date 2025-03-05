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
