# Azure Resource Creation Showcase with VMSS, Load Balancer, and Nginx
I'm an IT Remote Technician (Level 2) with over 4 years of experience supporting end users and a variety of devices — from networking equipment to endpoint devices — primarily in Microsoft environments.

I've been expanding my skill set into the cloud space, particularly Azure, as I prepare to transition into a Cloud Support or Cloud Engineer role. To boost my knowledge, I’ve completed full-time training with an official instructor for the AZ-104 certification, and I’m currently studying for the exam.

This repository showcases various Azure resources I can create and manage. Some setups are simple, while others, like this one, involve more advanced configurations.

## 🔧 **Tools & Technologies**
- Microsoft Azure
- Azure Portal
- Azure CLI
- Azure Resource Groups
- Virtual Machine Scale Sets (VMSS)
- Load Balancer (Azure LB)
- Nginx Web Server
- Azure Monitor
- Network Security Groups (NSG)
- Azure Storage Accounts
- SSH Key Authentication
- Git / GitHub

---

## 📁 | Resource                          | Description                                                                 |

| Virtual Machine Scale Set (VMSS)   | A set of auto-scalable VMs with integrated load balancing and health probes |
| Load Balancer                      | Public LB with backend pool connected to VMSS instances for traffic routing |
| Nginx Web Server                   | Installed on VMSS instances to serve content and verify functionality       |
| Application Health Monitoring      | Health checks using HTTP probes to ensure only healthy VMs serve traffic   |
| Resource Group                     | Organized container of all Azure resources involved in the project         |


---

The setup includes:
- **VMSS**: Scalable virtual machine instances that automatically scale based on traffic.
- **Load Balancer**: Distributes traffic across VMSS instances to ensure high availability.
- **Nginx Web Server**: Installed automatically on all VMSS instances using a custom script to serve content.
- **Health Probes**: Monitors the status of the VMSS instances. Traffic is routed only to healthy instances.
- **Resource Group**: All resources are logically grouped in a single Azure resource group for easy management.

The VMSS instances are connected to a public IP through a Load Balancer. A health probe is set up to monitor HTTP traffic to ensure the instances are healthy before allowing traffic.

The configuration includes:
1. **VMSS Setup**:
   - Ubuntu 22.04 image
   - 1 vCPU, 3.5 GB RAM (Standard DS1 v2)
   - Auto-scaling based on traffic
   - Networking and public IPs connected through Load Balancer

2. **Nginx Installation**:
   - Installed via a custom script during VM provisioning
   - Displays the hostname to verify Nginx is correctly configured
   - HTTP service listens on port 80

3. **Load Balancer**:
   - A public Azure Load Balancer with a frontend IP (external traffic)
   - Backend pool connected to VMSS instances
   - Health probe set to check the availability of port 80 on the instances

The Nginx installation is fully automated using a simple bash script that runs at VM startup, ensuring all VM instances in the scale set serve traffic.

1. **Health Probe**: 
   - An HTTP probe was created to check port 80 of each VMSS instance.
   - Only healthy instances are included in the backend pool to receive traffic.

2. **Load Balancer**:
   - A rule was set to forward HTTP traffic (port 80) from the frontend IP to the backend VMSS instances.
   - The Load Balancer ensures that traffic is evenly distributed across healthy instances.


To test the setup, navigate to the public IP address of the Load Balancer in your web browser. You should see the default Nginx welcome page indicating that the server is properly configured and working.

You can also test it via `curl`:

```bash
curl http://<Load_Balancer_Public_IP>



### **Screenshots**

1. **Architecture Diagram**: ![image](https://github.com/user-attachments/assets/c6e0dc66-6a28-4373-a62b-9acd41edc6f9)]
)
.
2. **VMSS Overview**: ![image](https://github.com/user-attachments/assets/0da9f411-1e49-4469-bc18-2d891d90b980)
)
.
3. **Load Balancer Configuration**: ![image](https://github.com/user-attachments/assets/dc903242-682f-4b93-a2da-2ade65e11f0a)

.
4. **Health Probe Settings**: ![image](https://github.com/user-attachments/assets/04eb6eab-1d6b-457f-9337-6da28ad5f711)

.
5. **Testing the Setup**: ![image](https://github.com/user-attachments/assets/ee8e72ad-fd0e-4dfa-9ab9-fda1986d3a90)
.


To replicate the setup:
1. Clone this repository.
2. Follow the instructions in the `README` to deploy the resources in Azure.
3. Use the provided bash script to install Nginx automatically on all VMSS instances.
4. Test the Load Balancer to ensure traffic routing is working as expected.






