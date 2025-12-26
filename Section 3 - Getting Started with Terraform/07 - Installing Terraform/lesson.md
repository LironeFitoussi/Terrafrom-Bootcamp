# ⚙️ Installing Terraform & Understanding Resources

## 📥 How to Install Terraform

**Terraform** is lightweight and easy to install. It’s distributed as a **single binary executable** and works across all major operating systems.

### ✅ Installation Steps:

1. Visit the official website: [www.terraform.io](https://www.terraform.io)

2. Navigate to the **Downloads** section.

3. Download the Terraform binary for your OS:

   * Windows
   * macOS
   * Linux distributions

4. **Add the binary to your system PATH** to access it from the command line.

5. Verify the installation:

   ```bash
   terraform version
   ```

> 🔢 This course uses **Terraform version 0.13** running on a **Linux environment**. Examples and labs are based on this setup.

---

## 📝 Writing Terraform Configuration Files

Terraform uses **configuration files** written in **HCL (HashiCorp Configuration Language)** to define infrastructure.

* File extension: `.tf`
* Can be created using any text editor:

  * Windows: Notepad, Notepad++
  * Linux/macOS: Vim, Emacs
  * IDEs: VS Code (recommended with Terraform plugin)

---

## 🧱 What is a Resource?

In Terraform, a **resource** is a fundamental building block — it represents **an infrastructure object** that Terraform manages.

### 🌐 Examples of Resources:

* **Local resources**:

  * Local files (for practice and learning)
* **AWS**:

  * EC2 instances
  * S3 buckets
  * DynamoDB tables
  * IAM users, groups, and policies
* **Google Cloud (GCP)**:

  * Compute Engine instances
  * App Engine services
* **Azure**:

  * Databases
  * Azure Active Directory users or groups

> Terraform supports **hundreds of resource types** across cloud and on-prem platforms.

---

## 👶 Starting with Simple Resources

To help beginners grasp the fundamentals, this course starts with two **easy-to-understand resource types**:

1. **`local_file`** – creates or manages a file on the local machine.
2. **`random_pet`** – a special resource that generates random names (useful for testing).

These simpler resources are perfect for:

* Learning the **resource lifecycle**
* Understanding **HCL structure**
* Practicing **init / plan / apply** phases

> Once you master these basics, you’ll confidently move on to **real-world infrastructure provisioning** using Terraform in later sections.

---

### 🧠 Key Takeaway

Start simple. Learn the core concepts (syntax, lifecycle, state). Then scale up to real cloud infrastructure with ease.
