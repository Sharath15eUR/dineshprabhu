# Module 1 - Assignment 

## Q1. In which OSI layer the Wi-Fi standard/protocol fits?

Wi-Fi, which is defined by the **IEEE 802.11 standard**, primarily operates at **two layers** of the OSI (Open Systems Interconnection) model:

### **1. Physical Layer (Layer 1)**
At this layer, Wi-Fi is responsible for transmitting raw data over radio waves. The key functions include:
- **Modulation and Encoding** – Converts digital data into radio signals for wireless transmission.
- **Frequency Bands** – Operates in **2.4 GHz, 5 GHz, and 6 GHz** frequency ranges.
- **Signal Strength and Interference Handling** – Manages transmission power and interference from other wireless devices.
- **Wireless Transmission Techniques** – Uses technologies like **OFDM (Orthogonal Frequency-Division Multiplexing)** and **DSSS (Direct Sequence Spread Spectrum)** for reliable data transfer.

### **2. Data Link Layer (Layer 2)**
Wi-Fi functions at the **Data Link Layer**, specifically in the **MAC (Medium Access Control) sublayer**. The key responsibilities here include:
- **Media Access Control** – Uses **CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)** to manage access to the shared wireless medium and prevent data collisions.
- **Frame Formation and Transmission** – Divides data into frames and ensures they are correctly sent and received.
- **Error Detection and Retransmission** – Implements **ACK (Acknowledgment) frames** and **Automatic Repeat reQuest (ARQ)** for error control.
- **Security Mechanisms** – Supports encryption and authentication methods like **WPA2, WPA3, and WEP**.


While Wi-Fi primarily operates at **Layers 1 and 2**, it also enables higher-layer protocols such as:
- **IP (Internet Protocol) at Layer 3** – Facilitates routing over wireless networks.
- **TCP/UDP (Transport Layer) at Layer 4** – Manages reliable/unreliable communication over Wi-Fi.

---

## Q2. Can you share the Wi-Fi devices that you are using day to day life, share that device's wireless capability/properties after connecting to the network. Match your device to corresponding Wi-Fi Generations based on properties

#### Wi-Fi devices that I am using in my day-to-day life are laptop and smartphone.

| Device               | Wireless Adapter/Chipset  | Frequency Band | Wi-Fi Standard       | Max Speed (Mbps) | Wi-Fi Generation |
|----------------------|-------------------------|---------------|----------------------|------------------|-----------------|
| **Laptop (Dynabook Satellite Pro C40-H X0303)**     | Intel(R) Wi-Fi 6 AX201       | 2.4 GHz, 5 GHz | 802.11a/b/g/n/ac/ax  | Up to 9.6 Gbps   | Wi-Fi 6         |
| **Smartphone (Redmi Note 10S)**    | 802.11ac | 2.4 GHz, 5 GHz | 802.11ac | Up to 400 Mbps | Wi-Fi 5 |

---

## Q3. What is BSS and ESS?

| Feature          | **BSS (Basic Service Set)**                          | **ESS (Extended Service Set)**                     |
|-----------------|----------------------------------------------------|--------------------------------------------------|
| **Definition**  | A single access point (AP) and its connected devices. | Multiple BSS units connected to form a larger network. |
| **Number of APs** | One AP                                            | Multiple APs                                   |
| **Coverage Area** | Small (Limited to the range of a single AP)       | Large (Covers multiple APs' combined range)    |
| **Roaming Support** | Not supported (devices stay within one AP range) | Supported (seamless transition between APs)    |
| **Communication** | Devices communicate directly with a single AP.    | Devices can switch between APs while staying connected. |
| **Network Type** | Used in home Wi-Fi, small office networks.         | Used in large enterprises, universities, airports, etc. |
| **Identifier**   | Identified by a **BSSID** (AP’s MAC address).      | Uses multiple **BSSIDs** under a common **SSID**. |
| **Example**      | A home Wi-Fi router with connected devices.        | A campus Wi-Fi network with multiple APs providing continuous coverage. |


- **BSS** is a single access point and its connected devices, suitable for small networks.  
- **ESS** is a group of multiple BSS units, providing larger coverage and seamless connectivity.  

---

## Q4. What are the basic functionalities of Wi-Fi Accesspoint?

A **Wi-Fi Access Point (AP)** is a networking device that allows wireless devices to connect to a wired network. It serves as a **bridge** between wired Ethernet networks and wireless clients, enabling seamless communication.

### **Basic Functionalities of a Wi-Fi Access Point**

| Functionality        | Description |
|----------------------|-------------|
| **Wireless Signal Transmission** | Transmits and receives Wi-Fi signals, allowing wireless devices to connect to the network. |
| **SSID Broadcasting** | Advertises the **Service Set Identifier (SSID)**, allowing users to discover and connect to the network. |
| **Authentication & Security** | Supports security protocols such as **WPA2, WPA3**, and **802.1X authentication** to prevent unauthorized access. |
| **Traffic Management** | Manages data flow between connected devices and the wired network to optimize performance. |
| **Multiple Device Connectivity** | Supports multiple wireless clients simultaneously using **MIMO (Multiple-Input Multiple-Output)** technology. |
| **Frequency Band Support** | Operates on **2.4 GHz, 5 GHz, and 6 GHz** bands depending on the Wi-Fi standard (Wi-Fi 4, 5, 6, 6E). |
| **Roaming Support** | In an **Extended Service Set (ESS)**, allows devices to switch between APs without disconnecting. |
| **QoS (Quality of Service)** | Prioritizes certain types of traffic (e.g., video streaming, VoIP) for better performance. |
| **Wired Network Integration** | Connects to a router or switch via **Ethernet** to enable internet and network access. |
| **Power over Ethernet (PoE) Support** | Some APs can receive power through **Ethernet cables**, eliminating the need for a separate power source. |
| **Guest Network Creation** | Allows setting up a separate network for guests to improve security and limit access. |
| **Mesh Networking** | Some APs support **mesh Wi-Fi**, allowing multiple APs to extend network coverage seamlessly. |

---

## Q5. Difference between Bridge mode and Repeater mode

Both **Bridge Mode** and **Repeater Mode** are used to extend network connectivity, but they function differently.

### **Key Differences:**

| Feature           | **Bridge Mode**                                         | **Repeater Mode**                                    |
|------------------|------------------------------------------------------|--------------------------------------------------|
| **Purpose**     | Connects two separate networks.                        | Extends the range of an existing Wi-Fi network. |
| **Operation**   | Works at **Layer 2 (Data Link Layer)**.                 | Works at **Layer 1 (Physical Layer)**.          |
| **Network Type** | Connects **two different networks**.                   | Extends **one single network**.                 |
| **IP Addressing** | Networks retain their **own IP ranges**.             | All devices stay in the **same IP range**.      |
| **Performance**  | No signal loss; provides **direct network bridging**. | May reduce speed due to **retransmission delays**. |
| **Usage**       | Used in enterprises, industrial setups.                | Used in homes, small offices to eliminate Wi-Fi dead zones. |
| **Example**      | Connecting two office networks in different buildings. | Using a repeater to boost Wi-Fi in a large home. |


- **Bridge Mode** is for connecting **two separate networks** efficiently.  
- **Repeater Mode** is for **extending Wi-Fi coverage** by amplifying and retransmitting signals.  

---
## Q6. What are the differences between 802.11a and 802.11b?

| Feature               | 802.11a                                     | 802.11b                                     |
|----------------------|------------------------------------------|------------------------------------------|
| **Release Year**     | 1999                                     | 1999                                     |
| **Frequency Band**   | 5 GHz                                    | 2.4 GHz                                  |
| **Max Data Rate**    | Up to 54 Mbps                            | Up to 11 Mbps                            |
| **Channel Bandwidth**| 20 MHz                                   | 22 MHz                                   |
| **Modulation**       | OFDM (Orthogonal Frequency Division Multiplexing) | DSSS (Direct Sequence Spread Spectrum) |
| **Range**           | Shorter due to high frequency            | Longer due to lower frequency           |
| **Interference**    | Less interference, as fewer devices use 5 GHz | More interference due to congestion in 2.4 GHz |
| **Wall Penetration** | Poorer (struggles with obstacles)       | Better (penetrates walls more effectively) |
| **Power Consumption**| Higher due to complex modulation        | Lower, making it more energy-efficient |
| **Network Type**     | Used mainly in enterprise and business environments | Used widely for residential and consumer devices |
| **Adoption**        | Less popular due to high cost and short range | Widely adopted for early Wi-Fi networks |
| **Compatibility**    | Not compatible with 802.11b/g           | Backward compatible with 802.11g |
| **Use Cases**       | Business, high-speed applications       | Home networks, IoT, and low-speed internet |
---

## Q7. Configure your modem/hotspot to operate only in 2.4Ghz and connect your laptop/Wi-Fi device , and capture the capability/properties in your Wi-Fi device. Repeat the same in 5Ghz and tabulate all the differences you observed during this

Connect the laptop to 2.4 Ghz and run `netsh wlan show interfaces` in the cmd. Repeat the 
same after connecting it to 5 Ghz. The differences observed during the execution of 
commands are as follows: 

| Feature               | 2.4 GHz                                     | 5 GHz                                     |
|----------------------|------------------------------------------|------------------------------------------|
| **Radio Type**     | 802.11n                                    | 802.11ac                                     |
| **Band**   | 2.4 GHz                                    | 5 GHz                                  |
| **Channel**    | 1                            | 40                            |
| **Recieve Rate (Mbps)**| 144.4                                   | 526.5                                  |
| **Transmit Rate (Mbps)**       | 130 | 180 |

---

## Q8: What is the Difference Between IEEE and WFA?

### **1. IEEE (Institute of Electrical and Electronics Engineers)**
- **Definition:**  
  - A **professional organization** that develops global **technical standards** for various industries, including networking and telecommunications.
- **Role in Wi-Fi:**  
  - Defines the **802.11 standards** (Wi-Fi protocols) such as **802.11a, 802.11b, 802.11n, 802.11ax (Wi-Fi 6)**.
  - Focuses on **technical specifications, protocols, and interoperability**.
- **Example Contribution:**  
  - IEEE **802.3 (Ethernet)**, IEEE **802.11 (Wi-Fi)**, IEEE **802.1x (Authentication protocol)**.

---

### **2. WFA (Wi-Fi Alliance)**
- **Definition:**  
  - A **non-profit industry consortium** that **certifies** Wi-Fi products for compatibility, performance, and security.
- **Role in Wi-Fi:**  
  - Ensures devices from different manufacturers **work together seamlessly**.
  - Develops **Wi-Fi branding** (e.g., **Wi-Fi 4, Wi-Fi 5, Wi-Fi 6**).
  - Introduces **security and performance enhancements** (e.g., WPA2, WPA3).
- **Example Contribution:**  
  - **Wi-Fi CERTIFIED™ program**, **Wi-Fi Direct**, **Passpoint**, **WPA3 security standard**.

---

### **Key Differences:**

| Feature            | **IEEE (Institute of Electrical and Electronics Engineers)** | **WFA (Wi-Fi Alliance)** |
|-------------------|-------------------------------------------------------------|--------------------------|
| **Purpose**      | Develops **technical standards** for networking and communication. | **Certifies** Wi-Fi products for interoperability. |
| **Focus Area**   | Defines **Wi-Fi protocols (802.11 standards)**. | Ensures **Wi-Fi devices are compatible and secure**. |
| **Membership**   | Open to researchers, engineers, and industry professionals. | Includes **companies** like Intel, Cisco, Qualcomm, etc. |
| **Wi-Fi Involvement** | Creates the **802.11 Wi-Fi standards**. | **Certifies** Wi-Fi products and introduces Wi-Fi branding. |
| **Security Role** | Defines authentication mechanisms like **802.1x**. | Develops **Wi-Fi security protocols (e.g., WPA2, WPA3)**. |
| **Branding**     | No branding – just technical standards. | Creates **Wi-Fi branding (Wi-Fi 4, 5, 6, etc.)**. |
| **Example Contribution** | **802.11ax (Wi-Fi 6)** standard definition. | **Wi-Fi 6 certification program**, **WPA3 encryption**. |

---

## Q9. List down the type of Wi-Fi internet connectivity backhaul, share your home/college's wireless internet connectivity backhaul name and its properties

A **backhaul** is the network connection that links the **Wi-Fi access points (APs)** to the main internet service provider (ISP) or core network. The backhaul can be wired (fiber, Ethernet) 
or wireless (Wi-Fi, satellite, cellular).

### **Types of Wi-Fi Backhaul Connections**

| Backhaul Type        | Description |
|----------------------|-------------|
| **Fiber Optic Backhaul** | Uses **fiber-optic cables** for high-speed, low-latency internet connectivity. Common in **enterprise networks and 5G backhaul**. |
| **Ethernet Backhaul** | Connects Wi-Fi access points via **wired Ethernet cables** for stable, high-speed connections. Used in **homes, offices, and businesses**. |
| **Wireless Backhaul (PtP/PtMP)** | Uses **microwave, millimeter-wave, or Wi-Fi links** to connect APs without physical cables. Used in **rural and large outdoor deployments**. |
| **Cellular (4G/5G) Backhaul** | Uses **LTE/5G networks** to provide Wi-Fi connectivity where wired connections are unavailable. Common in **remote areas and mobile hotspots**. |
| **Satellite Backhaul** | Provides internet via satellites, useful for **rural and remote locations** with no wired infrastructure. Higher latency compared to fiber. |
| **Power Line Communication (PLC) Backhaul** | Uses **electrical power lines** for network data transmission. Less common but useful in **industrial environments**. |

---

### **College Wi-Fi Backhaul**

**Backhaul Type:** Ethernet <br>
**Provider:** BSNL <br>
**Speed:** 100-500 Mbps <br>
**Latency:** 5-10 ms <br>

---

## Q10. List down the Wi-Fi topologies and use cases of each one.
 
Wi-Fi topology refers to the **network structure** and how devices connect to each other and the internet.  

### **Types of Wi-Fi Topologies and Their Use Cases**  

| **Wi-Fi Topology**   | **Description** | **Use Cases** |
|----------------------|----------------|---------------|
| **Infrastructure Mode** | Devices connect to a **central Access Point (AP)**, which manages communication and connects to the internet. | - Home and office Wi-Fi networks.<br>- Public Wi-Fi (cafes, airports). |
| **Ad-hoc Mode (Peer-to-Peer)** | Devices communicate **directly** with each other **without** an access point. | - Temporary networks (file sharing, gaming).<br>- Device-to-device communication. |
| **Mesh Wi-Fi** | Multiple access points (APs) work together to create a **seamless network**, improving coverage and reliability. | - Large homes and offices.<br>- Smart city and IoT deployments.<br>- Campus-wide Wi-Fi. |
| **Workgroup Bridge Mode** |  Workgroup Bridge Mode allows a Wi-Fi device to bridge its wired clients to a remote network or access point wirelessly, useful for connecting distant wired devices.  | Commonly used in scenarios where running Ethernet cables is impractical, like point-to-point links between buildings.  |
| **Hotspot (Tethering)** | A mobile device or router shares its **internet connection** over Wi-Fi. | - Mobile hotspots.<br>- Temporary Wi-Fi access for travel. |
| **Bridge Mode** | Bridge Mode involves connecting two separate network segments or LANs wirelessly.  | - Expanding Wi-Fi in large buildings.<br>- Campus and warehouse networks. |
| **Extender/Repeater Mode** | Wi-Fi extenders **boost** existing signals to reach dead zones. | - Homes with weak Wi-Fi spots.<br>- Extending Wi-Fi in offices. |

--- 
