# 🧾 Introduction to Infrastructure as Code (IaC)

## 💡 What is Infrastructure as Code?

**Infrastructure as Code (IaC)** is the practice of defining and managing infrastructure through machine-readable code, rather than manual processes. With IaC, you can:

* **Define** infrastructure resources (VMs, databases, networks)
* **Provision** them automatically
* **Configure**, **update**, or **destroy** them with version-controlled code

This approach replaces point-and-click provisioning through cloud consoles with codified automation, enabling **speed**, **consistency**, and **scalability** in infrastructure management.

---

## 🔁 IaC vs Manual Provisioning

Instead of manually provisioning resources via a cloud management console, IaC allows you to automate:

```sh
# Example: Shell Script (Complex & Hard to Maintain)
aws ec2 run-instances --image-id ami-xyz --count 1 --instance-type t2.micro

# Example: Terraform (Readable & Reusable)
resource "aws_instance" "example" {
  ami           = "ami-xyz"
  instance_type = "t2.micro"
}
```

While scripting achieves automation, it often requires strong programming skills and results in **hard-to-maintain** logic. IaC tools like **Terraform** and **Ansible** solve this with **human-readable**, **declarative** configuration syntax.

---

## 🛠️ Common IaC Tools & Categories

IaC tools fall into **three broad categories**, each serving a different purpose:

---

### 1. ⚙️ Configuration Management Tools

**Examples:** Ansible, Puppet, Chef, SaltStack
**Use Case:** Install and manage software on existing infrastructure.

**Key Features:**

* Structured, reusable code (e.g., **Ansible playbooks**)
* Designed to run across **multiple systems**
* **Version-controlled** and shareable
* Most importantly: **Idempotent**

  * Running the code multiple times doesn’t result in redundant changes
  * Only applies changes necessary to reach the desired state

---

### 2. 🧱 Server Templating Tools

**Examples:** Docker, Packer, Vagrant
**Use Case:** Create custom **VM or container images** pre-bundled with software and configurations.

**Benefits:**

* Eliminates the need for post-deployment software installation
* Promotes **Immutable Infrastructure**

  * Systems are not updated post-deployment
  * Changes require creating a **new version** of the image and re-deploying

**Real-World Examples:**

* **Docker images** on DockerHub
* **Custom AMIs** in AWS
* **VM templates** from platforms like osboxes.org

---

### 3. 🧩 Infrastructure Provisioning Tools

**Examples:** Terraform, AWS CloudFormation
**Use Case:** Provision entire infrastructure environments (VMs, networks, databases, etc.)

**Highlights:**

* Use **declarative language** to describe desired infrastructure state
* Provision resources such as:

  * Virtual machines
  * VPCs and subnets
  * Security groups
  * Databases and storage

**Tool Comparison:**

* **CloudFormation**: AWS-specific
* **Terraform**: **Cloud-agnostic**, supports multi-cloud through **provider plugins** (AWS, Azure, GCP, and more)

---

## 🧭 Summary

| Category                        | Tools                            | Purpose                                           |
| ------------------------------- | -------------------------------- | ------------------------------------------------- |
| **Configuration Mgmt**          | Ansible, Puppet, Chef, SaltStack | Software install/config on existing resources     |
| **Server Templating**           | Docker, Packer, Vagrant          | Build reusable OS images with pre-installed tools |
| **Infrastructure Provisioning** | Terraform, CloudFormation        | Define and deploy infrastructure as code          |

In the upcoming section, the course will dive deeper into **Terraform**, focusing on how it provisions infrastructure using a declarative and cloud-agnostic approach.