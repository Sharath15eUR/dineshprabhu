## Module 6 - Assignment

### 1. **Pillars of Wi-Fi Security**
- **Authentication**: Verifies that devices are who they claim to be.
- **Encryption**: Protects data confidentiality during transmission.
- **Integrity**: Ensures that data is not tampered with during transmission.

---

### 2. **Authentication vs Encryption in Wi-Fi Security**
- **Authentication**: Confirms the identity of the devices trying to connect.
- **Encryption**: Encodes the data transmitted between the devices and AP to prevent eavesdropping.

---

### 3. **Differences between WEP, WPA, WPA2, and WPA3**
| Standard | Features | Security Level |
|----------|----------|----------------|
| WEP | RC4 encryption, static keys | Very Low |
| WPA | TKIP, dynamic key generation | Moderate |
| WPA2 | AES encryption, CCMP | High |
| WPA3 | SAE authentication, 192-bit encryption | Very High |

---

### 4. **Why WEP is Considered Insecure**
- Uses static keys.
- Weak RC4 encryption algorithm.
- Vulnerable to key recovery attacks within minutes.
- Lacks strong integrity protection.

---

### 5. **Why WPA2 was Introduced**
- To address vulnerabilities in WEP and WPA.
- Implements robust encryption using AES.
- Provides better integrity checks with CCMP.
- Ensures stronger network security standards for both home and enterprise networks.

---

### 6. **Role of Pairwise Master Key (PMK) in the 4-Way Handshake**
- The PMK is derived during authentication (e.g., PSK or 802.1X).
- It is used to generate temporal encryption keys.
- Ensures secure derivation of session keys without exposing the passphrase.

---

### 7. **How 4-Way Handshake Ensures Mutual Authentication**
- Both client and AP prove possession of PMK without sharing it.
- Exchange of nonce values and cryptographic validation.
- Protects against man-in-the-middle attacks.

---

### 8. **Effect of Wrong Passphrase during 4-Way Handshake**
- The client and AP will fail to derive matching encryption keys.
- The handshake fails.
- Device cannot establish a secure connection.

---

### 9. **Problem Solved by 802.1X in a Network**
- Provides port-based network access control.
- Enforces authentication before granting network access.
- Prevents unauthorized devices from accessing sensitive networks.

---

### 10. **How 802.1X Enhances Security over Wireless Networks**
- Uses EAP (Extensible Authentication Protocol) for strong authentication.
- Dynamically generates encryption keys.
- Reduces risk of unauthorized access.
- Integrates with RADIUS servers for enterprise-grade identity management.

---
