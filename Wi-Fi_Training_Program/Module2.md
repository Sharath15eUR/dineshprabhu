# Module 2 - Assignment 

## Q1. Brief about SplitMAC Architecture and how it improves the APs Performance

**SplitMAC** is a Wi-Fi architecture approach, particularly in enterprise Wi-Fi systems, where the MAC layer functionality is split between the Access Point (AP) and the Wireless LAN Controller (WLC). The AP handles real-time MAC functions. The WLC takes care of higher-level MAC functions.

- **AP Responsibilities (Real-time MAC Functions):**
  - Beacon generation and transmission
  - Acknowledgment of frames
  - RTS/CTS handling
  - Encryption/decryption of data frames
  - Fragmentation and reassembly

- **WLC Responsibilities (Management MAC Functions):**
  - Client authentication and association
  - Roaming management and decision-making
  - Applying QoS and ACL policies
  - Radio Resource Management (RRM)
  - Load balancing
  - Firmware and configuration management

### SplitMAC improves AP performance by:
- Configuration, updates, and policy enforcement are done at the controller level, reducing overhead on the AP and simplifying network management.
- Improved Roaming as the WLC manages seamless handoffs between APs and therfore reducing packet loss and latency.
- SplitMAC allows better scalability in large deployments since APs remain lightweight and the controller can manage hundreds of APs efficiently.

---

## Q2. Describe about CAPWAP, explain the flow Between AP & Controller

- CAPWAP stands for Control And Provisioning of Wireless Access Points.
- It is a standardized protocol defined by the IETF (RFC 5415) that enables centralized control of wireless networks.
- It facilitates communication between Lightweight Access Points (LWAPs) and a Wireless LAN Controller (WLC).
- CAPWAP encapsulates both control and data messages between APs and controllers, allowing for centralized management and configuration of APs.
- Supports SplitMAC architecture.
- Separates Control Plane and Data Plane.
- Works over IP networks using UDP ports 5246 (Control) and 5247 (Data).

### Communication Flow (Step-by-step):
1. **AP Bootup:** Sends DHCP request to get IP address.
2. **Discovery Phase:**
   - AP sends CAPWAP Discovery Request (broadcast/multicast or directed)
   - WLC responds with Discovery Response
3. **Join Phase:**
   - AP sends CAPWAP Join Request to selected WLC
   - WLC authenticates and replies with Join Response, and the CAPWAP tunnel is established.
4. **Image Download:**
   - If the AP’s software version is not compatible, the WLC pushes the correct image to the AP.
5. **Configuration Phase:**
   - Once joined, the WLC pushes configuration settings (SSIDs, security policies, etc.) to the AP.
6. **Operational Phase:**
   - The AP is now operational.CAPWAP Data Tunnel carries user data from AP to WLC.

[AP] ---> Discovery Request ---> [WLC] <br>
[WLC] ---> Discovery Response ---> [AP] <br>
[AP] ---> Join Request ---> [WLC] <br>
[WLC] ---> Join Response ---> [AP] <br>
[WLC] ---> (optional) Image Download ---> [AP] <br>
[WLC] ---> Configuration Push ---> [AP] <br>
[AP] <--> Control & Data Tunnels <--> [WLC] <br>

---

## Q3. Where this CAPWAP fits in OSI model, what are the two tunnels in CAPWAP and its purpose

### OSI Layer Mapping:
- **Layer 2 (Data Link Layer):**
  - CAPWAP can operate using L2 tunneling when no IP infrastructure is present
- **Layer 3 (Network Layer):**
  - Most common; CAPWAP uses UDP over IP for communication

### Tunnel Types:
1. **Control Tunnel:**
   - Uses UDP port 5246
   - Exchanges management messages (AP join, config, keep-alives)
   - Encrypted with DTLS for security

2. **Data Tunnel:**
   - Uses UDP port 5247
   - Carries encapsulated 802.11 data frames from clients
   - Optional encryption based on deployment needs

### Purpose:
- Separate data from control traffic
- Improve scalability and troubleshooting
- Secure and centralized AP management

---

## Q4. Whats the difference between Lightweight APs vs Cloud-based APs

### Lightweight APs:
- Controlled by on-premises WLC
- Require constant CAPWAP tunnel to function
- Cannot function autonomously without WLC (except FlexConnect mode)
- Suitable for centralized campus deployments

### Cloud-based APs:
- Managed via cloud controller (Meraki, Aruba Central, etc.)
- APs connect to cloud using secure HTTPS tunnels
- Easier deployment in distributed environments
- Automatically receive updates and policies from the cloud
- Suitable for branch offices, retail chains, and SMBs

| Feature | Lightweight AP | Cloud-based AP |
|--------|----------------|----------------|
| Controller | On-premises | Cloud-hosted |
| Management | Centralized (local) | Centralized (cloud) |
| Scalability | Moderate | High |
| Deployment | IT-intensive | Plug-and-play |
| Updates | Manual or WLC-driven | Cloud-driven |
| Ideal For | Enterprises, campuses | Branches, SMBs |

---

## Q5. How the CAPWAP Tunnel is maintained between AP and Controller

- **Keepalive Messages:** Sent periodically (every 30 seconds by default) to maintain the control tunnel
- **DTLS Encryption:** Ensures control traffic integrity and confidentiality
- **WLC Monitoring:** Detects if an AP becomes unresponsive and takes recovery actions
- **Failover Capability:** If configured, AP can switch to a secondary WLC

### CAPWAP Session States:
1. **Discovery** – AP locates WLCs
2. **Join** – AP sends join request
3. **Configure** – WLC pushes config to AP
4. **Operational** – AP is active and forwarding traffic
5. **Image Download** – If AP needs a new image

---

## Q6. Whats the difference between Sniffer Mode and Monitor Mode, use case for each mode

| Mode | Function | Use Case |
|------|----------|----------|
| Sniffer Mode | Captures and forwards raw 802.11 frames to packet analyzer (e.g., Wireshark) | In-depth packet-level analysis |
| Monitor Mode | AP passively listens to RF spectrum on all channels | Detect rogue APs, RF analysis, WIDS/WIPS |

### Sniffer Mode:
- Needs a wired connection to send captured packets to analyzer
- Used for troubleshooting client connectivity or protocol issues

### Monitor Mode:
- AP does not serve clients
- Continuously scans environment for threats and interference
- Used in security audits and compliance

---

## Q7. If WLC deployed in WAN, which AP mode is best for local network and how?

### Best Mode: **FlexConnect (HREAP)**

### Features:
- Allows AP to locally switch client data traffic
- Control traffic still goes to WLC over WAN
- Supports backup RADIUS server for authentication
- Enables minimal downtime during WAN outages

### Behavior During WAN Failure:
- **Authentication:** Cached credentials can be used (if pre-auth is enabled)
- **Roaming:** Still possible between APs in the same FlexConnect group
- **Data Traffic:** Continues to be switched locally

---

## Q8. What are challenges if deploying autonomous APs (more than 50) in large network like university

- **Scalability Issues:** Hard to configure and manage each AP manually
- **Lack of Central Control:** No unified policy or firmware distribution
- **Inconsistent SSIDs and Security Policies:** Risk of misconfigurations
- **Roaming Problems:** No fast handoff or client load balancing
- **High Maintenance:** Firmware upgrades and troubleshooting are time-consuming
- **Monitoring Gaps:** No consolidated logging, alerts, or dashboard
- **Inefficient Spectrum Usage:** No coordinated channel and power adjustment

**Conclusion:** Autonomous APs are not ideal for large enterprise or campus networks. Controller-based or cloud-managed solutions provide better scalability and efficiency.

---

## Q9. What happens on wireless client connected to Lightweight AP in local mode if WLC goes down.

- **Client Sessions:** Existing sessions may remain active temporarily, but new sessions cannot be authenticated
- **New Associations:** Not possible without WLC (unless FlexConnect with local auth is enabled)
- **Management Tasks:** AP cannot receive config updates or be monitored
- **Data Traffic:** Will be dropped unless AP supports local switching (FlexConnect)

### Mitigation Strategies:
- Use **FlexConnect** mode with local authentication fallback
- Configure **secondary/backup WLCs** with priority
- Ensure APs are grouped into **FlexConnect groups** for roaming and resilience

---
