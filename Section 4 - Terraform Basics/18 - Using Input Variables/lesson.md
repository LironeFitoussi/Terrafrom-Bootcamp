# 🧮 Using Variables in Terraform

This lecture introduces how to use **input variables** in Terraform to improve **reusability**, **flexibility**, and **maintainability** of your infrastructure code. Up to this point, values in your resource blocks (like `filename`, `content`, `prefix`, `length`) have been **hardcoded**, which is **not a best practice**.

---

## 📌 Why Avoid Hardcoding?

Hardcoded values reduce:

* **Code reusability**
* **Configurability**
* **Collaboration in team environments**

Instead, you should parameterize your code using **input variables**—just like in any scripting or programming language.

---

## 📂 Step 1: Create `variables.tf` File

Terraform variables are defined in a separate configuration file (by convention), typically named:

```bash
variables.tf
```

### ✍️ Variable Definition Syntax

Each variable is declared using the `variable` block:

```hcl
variable "filename" {
  default = "/root/pets.txt"
}

variable "content" {
  default = "We love pets"
}

variable "prefix" {
  default = "dog"
}

variable "length" {
  default = 2
}
```

### Components of a `variable` block

| Attribute  | Description                                                                    |
| ---------- | ------------------------------------------------------------------------------ |
| `variable` | Keyword used to declare a variable                                             |
| `"name"`   | Logical name for the variable (should match its usage in main config)          |
| `default`  | *(Optional)* Initial value for the variable if none is passed during execution |

These are **input variables**, meaning they **feed values into** Terraform configurations at runtime.

---

## 📄 Step 2: Use Variables in `main.tf`

In the `main.tf` file, instead of hardcoding values, reference variables using the syntax:

```
var.<variable_name>
```

### Updated Resource Example with Variables

```hcl
resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "my_pet" {
  prefix    = var.prefix
  separator = "-"
  length    = var.length
}
```

> 🔑 Note: When referencing a variable, you **do not** wrap it in quotes.

---

## ▶️ Execution Flow (with Variables)

After updating your configuration:

1. Run:

```bash
terraform init
```

(*Only needed if providers change*)

2. Preview the plan:

```bash
terraform plan
```

3. Apply the configuration:

```bash
terraform apply
```

Terraform will:

* Read values from `variables.tf`
* Replace all `var.<name>` references with the assigned defaults
* Provision resources as defined

---

## 🔁 Updating Resources via Variable Changes

To update the behavior or parameters of resources:

* **Only modify `variables.tf`**
* Leave `main.tf` unchanged

### Example:

```hcl
variable "content" {
  default = "My favorite pet is Mrs. Whiskers"
}

variable "length" {
  default = 2
}
```

When running `terraform apply` again, the output will show:

* **`local_file.pet`** resource will be **recreated** due to content change
* **`random_pet.my_pet`** will be **recreated** with a two-word name

---

## 🧾 Example: AWS EC2 Resource with Variables (Preview)

Here’s a preview of how input variables are used in a more complex resource such as an AWS EC2 instance:

```hcl
variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0c55b159cbfafe1f0"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
```

This illustrates that the same concepts apply regardless of provider complexity.

---

## ✅ Summary

| Topic                 | Explanation                                                        |
| --------------------- | ------------------------------------------------------------------ |
| Why use variables?    | Makes Terraform code **reusable**, **configurable**, and **clean** |
| Where to define them  | In a separate `variables.tf` file (recommended convention)         |
| How to reference them | `var.<name>` inside your `main.tf`                                 |
| Updating behavior     | Change values in `variables.tf`, no edits needed in main config    |
| Future use            | Input variables scale well for real-world deployments (e.g., AWS)  |

Variables are foundational in Infrastructure as Code. Mastering them prepares you to create **modular**, **parameterized**, and **production-ready** Terraform configurations.
