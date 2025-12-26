# 📁 Terraform Configuration Directory & File Naming Conventions

This lecture introduces how Terraform handles configuration files and how to structure them effectively within a configuration directory. It also covers **file detection**, **multi-file setups**, and **common naming conventions** used in real-world Terraform projects.

---

## 📂 What Is the Configuration Directory?

The **configuration directory** is the folder where your Terraform `.tf` files reside. Terraform looks for configuration files in the **current working directory** when commands like `terraform init`, `terraform plan`, and `terraform apply` are executed.

In the example used so far, the working directory is:

```
/root/terraform-local-file
```

This directory currently contains:

```
local.tf
```

This file defines a resource using the `local_file` provider to create a file named `pets.txt`.

---

## 📄 Using Multiple `.tf` Files in a Directory

Terraform automatically processes **all files** ending in `.tf` within the current directory.

### Example:

Add a new file named `cat.tf`:

```hcl
resource "local_file" "cat" {
  filename = "/root/cat.txt"
  content  = "This is a cat file"
}
```

This defines **another resource block**, similar to the one in `local.tf`, but with a different filename and content. Terraform **combines** all `.tf` files in the directory when applying a configuration — there’s **no functional difference** between defining resources in one file or splitting them across several files.

---

## 📚 Common File Naming Conventions

In more structured projects, Terraform configurations are split into **logical files** for better readability and maintenance. These are some widely used conventions:

| File Name          | Purpose                                                                 |
| ------------------ | ----------------------------------------------------------------------- |
| `main.tf`          | Contains the **main resource blocks** and core infrastructure           |
| `variables.tf`     | Declares all **input variables** with optional defaults                 |
| `outputs.tf`       | Defines **output values** to expose after `terraform apply`             |
| `providers.tf`     | Specifies **provider blocks** and required provider versions            |
| `terraform.tfvars` | (Optional) Provides **values for variables** declared in `variables.tf` |

Using this approach:

* Keeps config **modular and organized**
* Makes collaboration easier
* Aligns with **Terraform best practices**

> Despite different filenames, all `.tf` files in the directory are **merged by Terraform** during execution as if they are a single file.

---

## ✅ Summary

| Concept                   | Description                                             |
| ------------------------- | ------------------------------------------------------- |
| Configuration Directory   | The folder where `.tf` files live                       |
| `.tf` Files               | All are evaluated by Terraform when applying config     |
| Multiple File Support     | Yes — multiple `.tf` files allowed and treated as one   |
| Common Naming Conventions | `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf` |
| Example Extension         | Adding `cat.tf` defines a new `local_file` resource     |

All `.tf` files in a directory work **together** to define infrastructure. Whether you use one large file or many smaller ones depends on your preferences and project complexity.
