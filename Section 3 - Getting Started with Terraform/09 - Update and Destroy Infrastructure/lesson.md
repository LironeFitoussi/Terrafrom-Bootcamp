# 🔄 Updating and Destroying Infrastructure in Terraform

In this lecture, you’ll learn how to:

* **Update an existing resource** using Terraform
* Understand **how and why Terraform replaces** resources
* **Destroy infrastructure** cleanly and safely using built-in commands

This continues from the previous section where you created a local file using the `local_file` resource.

---

## ✏️ Updating a Resource (Changing File Permissions)

Let’s begin by making a **modification** to the previously created `local_file` resource.

### ➕ Change Introduced:

We will add a new argument to the configuration block:

```hcl
file_permission = "0700"
```

This changes the file’s permission mode from the **default `0777`** to **`0700`**, restricting access to **only the file’s owner** (no access for group or others).

### Updated Configuration Example:

```hcl
resource "local_file" "pet" {
  filename        = "/root/pets.txt"
  content         = "We love pets"
  file_permission = "0700"
}
```

---

## 🔍 Understanding the Impact via `terraform plan`

After updating the `.tf` file, run:

```bash
terraform plan
```

### 📄 Plan Output Observations:

* You’ll see the resource labeled with a **`-/+` (destroy and recreate)** symbol:

  ```hcl
  # local_file.pet must be replaced
  -/+ file_permission = "0777" => "0700" (forces replacement)
  ```

* The **`-/+`** prefix means:

  * The resource will be **destroyed first**
  * Then **recreated with new settings**

* The phrase **"forces replacement"** indicates that this specific change cannot be applied in-place.

### 🧠 Why does Terraform destroy and recreate?

* Some attributes (like `file_permission`) are considered **immutable** for that resource type.
* Terraform uses an **immutable infrastructure model**, meaning:

  * **Instead of updating in place**, resources are **fully replaced** to ensure a clean, consistent state.
* This concept was introduced earlier when comparing different IaC tools like Ansible vs. Terraform.

> Even though the change was minor, Terraform treats it as a full replacement to maintain **state consistency** and **predictability**.

---

## ✅ Applying the Update with `terraform apply`

Run the command:

```bash
terraform apply
```

You will see the **execution plan again**, including the note about replacement. Confirm the action by typing:

```text
yes
```

Terraform will:

* **Delete** the original file
* **Create** a new file with updated permissions (`0700`)

You can verify this by running:

```bash
ls -l /root/pets.txt
```

Expected output should show:

```bash
-rwx------ 1 root root ... /root/pets.txt
```

Only the file owner (`root`) has read, write, and execute permissions.

---

## 🗑️ Destroying Resources with `terraform destroy`

To **completely remove** infrastructure defined in your current configuration, use:

```bash
terraform destroy
```

### What Happens:

* Terraform reads the `.tfstate` file

* It generates a plan to **delete all managed resources**

* The CLI will show the resource marked with a **`-`** sign:

  ```hcl
  - local_file.pet will be destroyed
  ```

* All arguments (like `filename`, `content`, and `file_permission`) are shown as part of the destroy plan.

Confirm the destruction by typing:

```text
yes
```

### 📦 Final Result:

Terraform will **delete the file** located at `/root/pets.txt`, removing the resource from both your system and its internal state tracking.

---

## 🧠 Summary & Key Concepts

| Action                | Terraform Behavior                               |
| --------------------- | ------------------------------------------------ |
| **Minor update**      | May cause **full replacement** (immutable model) |
| `-/+` symbol          | Indicates **destroy-then-create** sequence       |
| `forces replacement`  | Shows which argument triggered the replacement   |
| **terraform destroy** | Cleanly removes all managed infrastructure       |

> 🔐 File permission change (`0700`) is treated as a significant update due to the **immutable nature** of the resource, even if the actual change is small.

---

## 🧪 Hands-On Practice

You should now:

1. Add `file_permission` to your existing config.
2. Run `terraform plan` to observe the replacement behavior.
3. Run `terraform apply` to implement the change.
4. Run `terraform destroy` to clean up the environment.

> These steps will help you gain confidence with Terraform’s resource lifecycle and how it treats infrastructure updates and teardown actions.