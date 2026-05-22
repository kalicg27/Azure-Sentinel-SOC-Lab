# Azure-Sentinel-SOC-Lab
In this project I am demonstrating my skills as SOV analyst Level 1
The lab environment transitions from standard log management to programmatic security analytics:
*   **Centralized SIEM:** Microsoft Sentinel handling structured cloud telemetry ingestion.
*   **High-Fidelity Endpoint Auditing:** Customized **Sysmon** deployment mapped directly to kernel event handles for deep visibility into memory architecture, process creation, and network telemetry.
*   **Infrastructure Management:** Managed completely as configuration-as-code using exported JSON infrastructure manifests.

---

## 📂 Repository Blueprint & Components
*   **`🏗️ architecture/`**: Contains network topology specifications, engineering design diagrams, and raw screenshot evidence.
*   **`⚙️ configurations/`**: Houses the custom XML rulesets for system security configuration along with the master `.json` deployment configurations.
*   **`☣️ attacks/`**: Documented attack frameworks, simulation stagers, and PowerShell execution transcripts targeting system resources.
*   **`🔍 detections/`**: Custom Microsoft Sentinel analytics definitions (`.json` templates) and raw threat-hunting engines written in advanced KQL (`.kql`).
*   **`⚡ automation-soar/`**: Deployment files for cloud-native Security Orchestration, Automation, and Response playbooks.

---

## 🎯 Threat Profiles & MITRE ATT&CK Mapping
The analytical core of this portfolio focuses on hunting, catching, and containing highly dangerous **Credential Access (TA0006)** and **Defense Evasion (TA0005)** techniques:
*   **T1003.001 - LSASS Memory Dumping:** Tracking unauthorized handle requests, `procdump`, and Mimikatz bypasses against the Windows security subsystem.
*   **T1555 - Credentials from Password Stores:** Monitoring access to DPAPI vaults and local browser credentials data paths.
*   **T1059.001 - PowerShell Execution:** Profiling obfuscated script blocks, execution policy bypass variations, and anomalous memory-loaded stagers.

---

## 📊 Live Metrics & Security Operations Engineering

### Visual 1: Unified Cloud Security Engineering Center
Custom event logs and telemetry structures flowing from the multi-platform node topology into a single centralized Log Analytics console.
![Unified Workspace](architecture/screenshots/dashboard-pie.png)

### Visual 2: Incident Correlation & Attack Vector Analysis
A view inside an active threat investigation tree, showing how Sentinel links the adversary's originating vector to compromised endpoint properties during execution.
![Incident Correlation Map](architecture/screenshots/incident-graph.png)

---

## 🏆 Engineering Deliverables & Metrics
*   **Infrastructure Automation:** Whole-lab infrastructure exported into fully modifiable deployment profiles.
*   **Noise Optimization:** Built custom baseline rulesets minimizing high-volume corporate infrastructure false-positives while maintaining zero-day detection capabilities.
*   **Automated Containment:** Programmatic logic blocks configured to completely sever network transport paths for compromised targets when malicious behavior is verified.
