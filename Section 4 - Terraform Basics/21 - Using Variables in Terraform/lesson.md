# 🧩 Multiple Ways to Pass Input Variables in Terraform

This lecture explores the **different methods** for supplying values to **input variables** in Terraform. Until now, default values were provided directly inside the `variable` blocks. But default values are **just one of several options** available to assign values at runtime.

---

## ✅ 1. **Default Values (Basic Method)**

A default value is declared inside the `variable` block itself:

```hcl
variable "filename" {
  type    = string
  default = "/root/pets.txt"
}
```

If no value is provided elsewhere, Terraform will use this default.

---

## 🧑‍💻 2. **Prompting via Interactive Input**

If no default is set and no external value is passed, Terraform will **prompt the user** to supply a value interactively when running:

```bash
terraform apply
```

Terminal Output:

```
var.filename
  Enter a value:
```

This happens because the variable block is defined without a `default`:

```hcl
variable "filename" {
  type = string
}
```

---

## 💡 3. **Passing Variables via `-var` Flag**

Variables can be passed directly via the command line:

```bash
terraform apply -var="filename=/root/pets.txt" -var="length=2"
```

* You can pass multiple variables using multiple `-var` flags.
* This method **overrides all other sources**, except inline `-var-file`.

---

## 🌍 4. **Using Environment Variables**

Terraform reads environment variables prefixed with `TF_VAR_`:

```bash
export TF_VAR_filename="/root/pets.txt"
export TF_VAR_length=2
```

These environment variables will be picked up during `terraform apply`.

---

## 📁 5. **Variable Definition Files (`.tfvars`)**

Create a separate file to hold variable values:

**Example: `terraform.tfvars`**

```hcl
filename = "/root/pets.txt"
length   = 2
```

You can also use a JSON version:

**Example: `terraform.tfvars.json`**

```json
{
  "filename": "/root/pets.txt",
  "length": 2
}
```

### Auto-loading Rules:

Terraform will automatically load any file that meets one of the following patterns:

* `terraform.tfvars`
* `terraform.tfvars.json`
* `*.auto.tfvars`
* `*.auto.tfvars.json`

If the file is named **something else**, like `custom.tfvars`, you must reference it explicitly:

```bash
terraform apply -var-file="custom.tfvars"
```

---

## 🧮 Variable Precedence Order

When multiple sources define the **same variable**, Terraform uses the following **order of precedence** (from lowest to highest):

| Priority | Source                                | Notes                                       |
| -------- | ------------------------------------- | ------------------------------------------- |
| 1️⃣      | Environment variables (`TF_VAR_...`)  | Loaded first                                |
| 2️⃣      | `terraform.tfvars` / `.tfvars.json`   | Auto-loaded by Terraform                    |
| 3️⃣      | `*.auto.tfvars` / `.auto.tfvars.json` | Auto-loaded alphabetically                  |
| 4️⃣      | `-var` or `-var-file` flags           | Highest priority, overrides everything else |

### Example:

Assume the following values are defined for the same variable `filename`:

| Source                               | Value             |
| ------------------------------------ | ----------------- |
| `TF_VAR_filename`                    | `/root/cats.txt`  |
| `terraform.tfvars`                   | `/root/pets.txt`  |
| `variable.auto.tfvars`               | `/root/mypet.txt` |
| `-var="filename=/root/best-pet.txt"` | **(Used in CLI)** |

📌 **Result:** Terraform uses `/root/best-pet.txt` because it comes from the **highest-priority** source: the `-var` flag.

---

## 🔁 Summary

| Method                         | Description                         | Auto-loaded? | Overridable? |
| ------------------------------ | ----------------------------------- | ------------ | ------------ |
| `default` in variable block    | Base-level fallback                 | ✅            | ✅            |
| Prompting (interactive input)  | CLI prompts if no value is supplied | ✅            | ✅            |
| `-var` flag                    | Inline CLI assignment               | ❌            | ❌ (highest)  |
| `TF_VAR_` environment variable | Environment-level default           | ✅            | ✅            |
| `.tfvars` / `.auto.tfvars`     | Variable definition files           | ✅            | ✅            |
| `-var-file`                    | Custom var file with explicit flag  | ❌            | ❌ (highest)  |

Using **variable precedence and input methods** gives you flexibility to design **modular**, **reusable**, and **environment-specific** configurations.
