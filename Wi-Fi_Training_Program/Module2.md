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

- CAPWAP fits at OSI Layer 3 and 4.
- CAPWAP uses IP addressing to allow communication between APs and WLCs across subnets or different networks.Thus, Layer 3 operation ensures that CAPWAP traffic can be routed over the internet, VPNs, or private WANs.
- In layer 4 because it provides UDP transport + DTLS encryption for security.
- It uses two tunnels:
    a. Control Tunnel (UDP port 5246): For AP-WLC communication and management.
    b. Data Tunnel (UDP port 5247): For forwarding client data traffic.
    
---

## Q4. Whats the difference between Lightweight APs and Cloud-based APs

Lightweight Access Points (APs) and Cloud-based Access Points are both types of wireless APs used in enterprise networks. The differences between them are: 

### Lightweight APs:
- Controlled by a centralized Wireless LAN Controller.
- Security, configuration, firmware updates resides in the controller. The AP just forwards data and control messages.
- Requires on-premise hardware controller for deployment.
- Highly scalable, but complex.
- Internet connectivity not required for management.
- Typically used in large enterprise environments with many APs and a need for centralized control.

### Cloud-based APs:
- Managed via cloud controller (Meraki, Aruba Central, etc.)
- APs connect to and get configurations from the cloud. No on-premise controller needed.
- No need for physical controllers.
- Very scalable and simple.
- Requires internet for full functionality.
- Ideal for distributed networks or organizations with multiple remote locations.

---

## Q5. How the CAPWAP Tunnel is maintained between AP and Controller

CAPWAP is responsible for managing communication between an Access Point (AP) and a Wireless LAN Controller (WLC). After the AP successfully connects to the controller, a secure tunnel is established to carry both control and data traffic.

- The tunnel is secured using DTLS, ensuring that all control messages are encrypted for safety.
- To maintain the connection, the AP and WLC exchange regular keep-alive messages.
- If these messages stop, the WLC assumes the AP has disconnected and may release resources or attempt to re-establish the connection.
- The tunnel remains active even when configuration changes occur or users roam between different APs, eliminating the need for constant re-authentication.
- CAPWAP sets up two separate tunnels—one for control traffic and another for data which improves management and helps maintain network stability.

---

## Q6. Whats the difference between Sniffer Mode and Monitor Mode, use case for each mode

### Monitor Mode:
- Listens to all wireless traffic on a channel.
- Can be enabled directly on a wireless interface.
- AP does not serve clients, only listens.
- Commonly used with tools like Wireshark.

### Sniffer Mode:
- Captures wireless traffic for analysis.
- Requires connection to a Wireless LAN Controller.
- AP Acts like a client capturing packets.
- Often used with controllers (e.g. Cisco WLC).

| Mode | Function | Use Case |
|------|----------|----------|
| Sniffer Mode | Captures and forwards raw 802.11 frames to packet analyzer (e.g., Wireshark) | In-depth packet-level analysis |
| Monitor Mode | AP passively listens to RF spectrum on all channels | Detect rogue APs, RF analysis, WIDS/WIPS |

---

## Q7. If WLC deployed in WAN, which AP mode is best for local network and how?

- If the WLC is deployed over a WAN, the best AP mode to use for the local network is FlexConnect Mode.
- FlexConnect allows an AP to maintain local switching and limited autonomy even when the WLC is located remotely.

### Local switching:
- The AP can switch client traffic locally, directly into the local VLAN, instead of tunneling it back to the WLC over the WAN.
- This greatly reduces WAN bandwidth usage, especially for data-heavy applications.

### Continuous operation:
- If the WAN connection to the WLC fails, the AP can continue to maintain wireless service for clients.
- This is called " FlexConnect standalone operation".

### Centralised anagement:
- While data stays local, control and configuration are still managed centrally through the WLC.
- This provides a balance of central control and local efficiency.

---

## Q8. What are challenges if deploying autonomous APs (more than 50) in large network like university

### Poor management capablity:
- Each AP must be configured, monitored, and updated manually.
- Tedious and time-consuming to manage settings across 50+ devices.
For example: If you need to change the SSID or security settings, you'd have to log into every AP individually.

### Configuration mismatches:
- Risk of configuration mismatches between APs (e.g., SSIDs, VLANs, security) which can lead to user confusion, roaming issues, or security gaps.

### Scalability Issues:
- As the number of APs grows, the complexity and chance of mismanagement increases.
- Autonomous mode is not designed for large, dynamic environments.

### Issues in roaming:
- Without coordination, APs can't manage fast or seamless client roaming.
- Users may experience disconnections or lag when moving between lecture halls or buildings.
For example: A student walking from the library to a classroom may get dropped and need to reconnect manually.

**Conclusion:** Autonomous APs are not ideal for large enterprise or campus networks. Controller-based or cloud-managed solutions provide better scalability and efficiency.

---

## Q9. What happens on wireless client connected to Lightweight AP in local mode if WLC goes down.

- New Client Connections Fail.
- Existing Clients Stay Connected temporarily, since the AP relies on the WLC for client session management and switching, this is not guaranteed to last long.
- Roaming between APs breaks because coordination as it is handled by the WLC.
- Monitoring, logging, and troubleshooting data from the AP also stop reporting to the central system.
- AP May Reboot or Restart Discovery when it couldn't find out the WLC in a set time.
- Also the central services like DHCP etc. fail if the issues persists.

---
