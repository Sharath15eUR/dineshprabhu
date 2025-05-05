## Module 4 - Assignment


### Q1. What is the significance of MAC layer and in which position it is placed in the OSI model

The MAC layer manages frame transmission, addressing, error detection, and medium access in wireless networks. It is placed at the second layer (Data Link Layer) of the OSI model, just above the Physical layer.

### Q2. Describe the frame format of the 802.11 MAC header and explain the purpose of each fields.

Frame Control (2 bytes): Contains protocol version, frame type (Data/Control/Management), and flags.

Duration/ID (2 bytes): Used for NAV (Network Allocation Vector) in medium reservation.

Address Fields (6 bytes each): Source, Destination, BSSID, etc., depending on frame type.

Sequence Control (2 bytes): Fragmentation & sequence numbering.

QoS Control (2 bytes, optional): For QoS prioritization.

Frame Body (Variable): Payload (Data/Management).

FCS (4 bytes): Frame Check Sequence for error detection.

### Q3. Please list all the MAC layer functionalities in all Management, Control and Data plane.

Management Plane: Scanning, Authentication, Association.

Control Plane: RTS/CTS, ACK, Power Save Polling.

Data Plane: Framing, Fragmentation, Encryption, Aggregation (A-MSDU/A-MPDU).

### Q4. Explain the scanning process and its types in detail

Passive Scanning: Client listens for Beacon frames from APs without transmitting.

Active Scanning: Client sends Probe Requests and receives Probe Responses from APs.

### Q5. Brief about the client association process.

Probe request  
probe response  
Authentication request  
Authentication response  
Association request  
Association response

### Q6. Explain each steps involved in EAPOL 4-way handshake and the purpose of each keys derived from the process

Message 1 (AP → Client): ANonce (for PTK derivation).

Message 2 (Client → AP): SNonce + MIC (verification).

Message 3 (AP → Client): GTK + Install PTK.

Message 4 (Client → AP): Confirmation.

### Q7. Describe the power saving scheme in MAC layer and explore on the types of Power saving mechanisms

Active Mode: Always awake.

Power Save Mode (PSM): Sleeps & wakes up for Beacon frames (DTIM).


### Q8. Describe the Medium Access Control methodologies

DCF (Distributed Coordination Function): CSMA/CA (default, contention-based).

PCF (Point Coordination Function): Polling-based (rarely used).

EDCA (Enhanced DCF): QoS prioritization (for WMM).

### Q9. Brief about the Block ACK mechanism and its advantages

Block ACK allows multiple frames to be acknowledged with a single BlockAck frame. Advantages: Reduces overhead, improves throughput, efficient for burst traffic.

### Q10. Explain about A-MSDU, A-MPDU and A-MSDU in A-MPDU

A-MSDU (Aggregated MAC Service Data Unit): Multiple Ethernet frames in one MAC frame (single header).

A-MPDU (Aggregated MAC Protocol Data Unit): Multiple MAC frames with individual headers & padding.

A-MSDU in A-MPDU: Combines both—A-MSDUs are aggregated inside an A-MPDU for higher efficiency.
