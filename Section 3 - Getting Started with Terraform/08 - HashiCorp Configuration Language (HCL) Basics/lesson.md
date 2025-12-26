# 🧱 Understanding HCL & Creating Your First Resource in Terraform

This section introduces the **HashiCorp Configuration Language (HCL)** — the foundation of how infrastructure is defined in Terraform. You'll also learn how to write your **first `.tf` file**, use the core **Terraform CLI workflow**, and explore how to inspect and validate resources post-deployment.

---

## 📄 What is HCL (HashiCorp Configuration Language)?

**HCL** is a **simple, declarative, and human-readable language** used by Terraform to define infrastructure resources. Every `.tf` file you write contains:

* **Blocks**: Encapsulated sections enclosed in `{}` that declare infrastructure elements.
* **Arguments**: Configuration details expressed in `key = value` format within a block.

---

## 🧱 Anatomy of a Terraform Configuration Block

The most basic configuration block you'll use is the `resource` block.

Here’s a sample `resource` block for creating a **local file**:

```hcl
resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content  = "We love pets"
}
```

### 🔍 Breakdown of the Code

| Component      | Description                                                             |
| -------------- | ----------------------------------------------------------------------- |
| `resource`     | Declares that you're defining a Terraform-managed infrastructure object |
| `"local_file"` | Resource **type** → uses the `local` provider to create a `file`        |
| `"pet"`        | Logical **resource name** (can be any unique identifier)                |
| `{}`           | The block’s body contains **arguments** specific to this resource type  |
| `filename`     | Path to the file to be created                                          |
| `content`      | Contents to be written into the file                                    |

> ❗ Each **resource type** expects specific arguments. For `local_file`, `filename` is **mandatory**, while others (like `content`, `file_permission`, etc.) may be optional.

---

## 📁 Preparing Your Terraform Project

Let’s walk through creating the configuration and directory setup:

### 1. 🔧 Create the Directory and File

```bash
mkdir /root/terraform-local-file
cd /root/terraform-local-file
touch local.tf
```

Edit `local.tf` and add the resource block for the `local_file` resource.

---

## 🧪 Terraform CLI Workflow

Once the configuration is in place, follow the four-step **Terraform workflow**:

### 1. 🧰 `terraform init`

```bash
terraform init
```

* Initializes the working directory
* Downloads necessary **provider plugins** (in this case, the `local` provider)
* Output will confirm plugin installation:

  > *Terraform has installed a plugin called `local`*

---

### 2. 🗺️ `terraform plan`

```bash
terraform plan
```

* Generates an **execution plan** showing actions Terraform will take
* Does not change infrastructure
* Output uses symbols to indicate actions:

  * `+` → Resource will be **created**
  * `-` → Resource will be **destroyed**
  * `~` → Resource will be **updated in place**

#### Example Output:

```hcl
# local_file.pet will be created
+ filename = "/root/pets.txt"
+ content  = "We love pets"
```

> ⚠️ Terraform may also display **default arguments** not explicitly written in the file.

---

### 3. 🚀 `terraform apply`

```bash
terraform apply
```

* Re-displays the plan and prompts you for confirmation:

  ```text
  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes
  ```

* Once confirmed, Terraform **creates the file resource**.

---

### 4. 🔍 Verify the File

Check that the file was created and contains the correct data:

```bash
cat /root/pets.txt
```

You should see:

```
We love pets
```

---

### 5. 🧾 View Resource State with `terraform show`

```bash
terraform show
```

* Displays the **current state** of your infrastructure as tracked by Terraform
* Reads from the **state file** (by default: `terraform.tfstate`)
* Output includes all resource attributes, including those set by Terraform itself

---

## 🔍 Understanding Resource Type Naming

### 🧩 `"local_file"` — What Does It Mean?

Terraform resource types follow this naming pattern:

```hcl
<PROVIDER>_<RESOURCE_TYPE>
```

* `local_file`

  * `local` → Provider
  * `file` → Resource type
* `aws_instance`

  * `aws` → Provider
  * `instance` → EC2 instance

### 📚 How to Discover Other Resource Types and Arguments?

With **100+ providers**, each having many resource types and supported arguments, you should reference:

### 📖 [Terraform Registry Documentation](https://registry.terraform.io)

* Each **provider** has its own documentation page
* Lists **available resource types**
* Provides **required and optional arguments**
* Includes **code examples**

#### Example: Local Provider

* **Only** supports `local_file`
* `filename` → Required argument
* Other optional fields: `content`, `sensitive_content`, `file_permission`, etc.

---

## 🧠 Recap: Terraform Resource Creation Workflow

| Step                 | Action                                                       |
| -------------------- | ------------------------------------------------------------ |
| Write `.tf` file     | Define the infrastructure resource using HCL                 |
| `terraform init`     | Download provider plugin and initialize workspace            |
| `terraform plan`     | Preview the changes Terraform will make                      |
| `terraform apply`    | Execute the plan and provision resources                     |
| `terraform show`     | View the state of the infrastructure Terraform created       |
| `cat /root/pets.txt` | Validate the file was actually created with expected content |

---

## ✅ Summary

This section gave you a **hands-on introduction** to:

* Terraform’s **HCL syntax**
* How to define and use **resource blocks**
* The **Terraform CLI workflow** (`init → plan → apply → show`)
* Using **local_file** as a learning tool before moving on to complex cloud resources
* Relying on **official Terraform documentation** as your reference for resource types and arguments

> Next up: You'll explore cloud-based resources like AWS EC2, S3, and IAM through Terraform — now that you understand the fundamentals.
