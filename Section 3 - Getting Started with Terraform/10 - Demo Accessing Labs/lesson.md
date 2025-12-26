# 🔁 Updating & Destroying Infrastructure with Terraform

In this lecture, you will learn how to:

* **Update** an existing infrastructure resource (using the `local_file` example)
* Understand Terraform's behavior when changes require **resource replacement**
* Use the **`terraform destroy`** command to cleanly remove infrastructure

This continues from the previous exercise, where we created a file using the `local_file` resource.

---

## ✏️ Updating a Resource: Changing File Permissions

To update the existing `local_file` resource, we will **add a new argument** called `file_permission` to our configuration.

### ➕ The Change

We want to change the file's permission to `0700`, which grants **only the file owner** (user) read, write, and execute permissions. All access is removed for group and others.

```hcl
file_permission = "0700"
```

This change replaces the **default `0777`** permission (full access for all users) with a more secure setting.

---

## 📄 Running `terraform plan` After the Change

After updating the `.tf` file, you should run:

```bash
terraform plan
```

### 🔍 What You'll See in the Output:

* Terraform detects that the resource needs to be **replaced**, not updated in-place.
* The resource will be marked with:

  ```
  -/+ local_file.pet
  ```

#### Breakdown of Symbols:

* `-/+` (minus plus) means:

  * Terraform will **destroy** the existing resource.
  * Then it will **create** a new one with the updated configuration.

You will also see a line that includes:

```
forces replacement
```

This explicitly explains **why** the replacement is necessary — in this case, because of the `file_permission` change.

---

## 💡 Why Does Terraform Recreate Instead of Updating?

Terraform follows the principle of **immutable infrastructure**.

### Immutable Infrastructure:

* Instead of modifying a resource in-place, Terraform **destroys and recreates** it when certain changes occur.
* This ensures **clean, predictable, and consistent** states.
* Even **minor configuration changes** (like file permission) may trigger a full replacement.

> We briefly discussed this concept in earlier lectures when comparing IaC tool types. Tools like Terraform and Docker embrace immutability, unlike configuration management tools like Ansible.

---

## ✅ Applying the Update with `terraform apply`

To proceed with applying the planned change:

```bash
terraform apply
```

Terraform will:

* Show the same plan again
* Prompt:

  ```
  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes
  ```

Type:

```bash
yes
```

### Result:

* The **existing file is deleted**
* A **new file is created** with the updated `0700` permission

---

## 🗑️ Destroying Infrastructure with `terraform destroy`

To **fully delete** all resources managed by Terraform in the current configuration:

```bash
terraform destroy
```

### What Happens:

* Terraform reads your `.tfstate` file to determine which resources are tracked.

* It generates an **execution plan** showing resources to be deleted.

* The output uses the `-` symbol:

  ```
  - local_file.pet will be destroyed
  ```

* All arguments for the resource (like `filename`, `content`, and `file_permission`) are displayed for review.

### Final Confirmation:

You’ll again be prompted:

```bash
Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```

### Outcome:

Once confirmed, the file `/root/pets.txt` (or whatever path you specified) is deleted, and the resource is **removed from the Terraform state**.

---

## 🧠 Recap: Key Takeaways

| Task                       | Command                        | Notes                                          |
| -------------------------- | ------------------------------ | ---------------------------------------------- |
| **Update a resource**      | `terraform plan`               | Shows `-/+` and `forces replacement` if needed |
| **Apply the update**       | `terraform apply`              | Executes the change with confirmation          |
| **Destroy the resource**   | `terraform destroy`            | Deletes all tracked resources                  |
| **Immutability Principle** | Always replace certain changes | Ensures state consistency                      |

> Even **small updates** like changing permissions can lead to full replacement — that’s the core of Terraform's **immutable infrastructure** model.

---

## 🧪 What to Do Next

In the hands-on lab, you'll:

1. Modify your `.tf` file to include `file_permission = "0700"`.
2. Run `terraform plan` to preview the replacement.
3. Run `terraform apply` to recreate the file.
4. Finally, run `terraform destroy` to remove the resource entirely.

This will give you practical experience with **updating**, **replacing**, and **destroying** infrastructure using Terraform.