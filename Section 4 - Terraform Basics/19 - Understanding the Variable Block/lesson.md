# 🧮 Terraform Variable Types — Comprehensive Overview

This lecture provides a deep dive into the **`variable` block** in Terraform, focusing on the different **types**, **structure**, and **validation mechanisms** available to manage inputs effectively.

---

## 🧾 Parameters in a `variable` Block

Each `variable` block in Terraform can use the following parameters:

| Parameter     | Required | Description                                                  |
| ------------- | -------- | ------------------------------------------------------------ |
| `default`     | No       | Provides a default value if none is passed during execution  |
| `type`        | No       | Constrains the type of the variable; ensures type safety     |
| `description` | No       | Optional description to document the purpose of the variable |

Although only the variable name is mandatory, using `type` and `description` is considered **best practice**.

---

## 🔤 Basic Variable Types

Terraform supports **primitive** data types:

### 1. `string`

* Accepts alphanumeric input (`"my_value"`)
* Default type when using text

```hcl
variable "greeting" {
  type        = string
  default     = "Hello"
  description = "A greeting message"
}
```

### 2. `number`

* Can be positive or negative

```hcl
variable "port" {
  type    = number
  default = 8080
}
```

### 3. `bool`

* Accepts `true` or `false`

```hcl
variable "enabled" {
  type    = bool
  default = true
}
```

If `type` is not defined, Terraform assumes **type = any** (flexible but riskier).

---

## 📋 Complex Variable Types

### 1. **`list`**

A `list` is an **ordered collection** of values accessed by index (starting at `0`).

```hcl
variable "prefixes" {
  type    = list(string)
  default = ["Mr", "Mrs", "Sir"]
}
```

You can access values using:

```hcl
var.prefixes[0]  # "Mr"
var.prefixes[1]  # "Mrs"
```

---

### 2. **`map`**

A `map` is a **collection of key-value pairs**.

```hcl
variable "file_content" {
  type = map(string)
  default = {
    statement1 = "Hello"
    statement2 = "My favorite pet is Whiskers"
  }
}
```

Access values using keys:

```hcl
var.file_content["statement2"]  # "My favorite pet is Whiskers"
```

---

### 3. **`set`**

Like a list, but **no duplicate values allowed**.

✅ Valid:

```hcl
variable "pet_names" {
  type    = set(string)
  default = ["Bella", "Rocky", "Luna"]
}
```

❌ Invalid (will throw an error due to duplicate):

```hcl
default = ["Bella", "Bella"]
```

---

## 🔐 Enforcing Type Constraints

You can constrain complex variable types more strictly:

### List of Numbers:

```hcl
variable "numbers" {
  type    = list(number)
  default = [1, 2, 3]
}
```

### Invalid Example:

```hcl
default = ["one", "two", "three"]
```

Terraform will throw a type mismatch error:

```
Invalid value for variable: a number is required, not a string.
```

Same rules apply to **maps**, **sets**, and **other composite types**.

---

## 🧱 `object` Type

Objects let you create **structured, grouped data** using key-value pairs of multiple types.

### Example:

```hcl
variable "bella" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(string)
    favorite_pet = bool
  })
  default = {
    name         = "Bella"
    color        = "Brown"
    age          = 7
    food         = ["fish", "chicken", "turkey"]
    favorite_pet = true
  }
}
```

This is useful for modeling structured resources like user profiles, VM specs, or in this case — pet metadata.

---

## 🔢 `tuple` Type

A `tuple` is like a list, but:

* Elements can have **different types**
* **Exact number of elements and their types** must be defined

### Example:

```hcl
variable "pet_tuple" {
  type = tuple([string, number, bool])
  default = ["cat", 7, true]
}
```

### Valid:

```hcl
["cat", 7, true]
```

### Invalid:

```hcl
["cat", 7, true, "dog"]   # Too many elements
["cat", "seven", true]    # Wrong type for second element
```

Terraform will return a **type constraint mismatch error**.

---

## ✅ Summary

| Variable Type | Description                               | Key Feature                                 |
| ------------- | ----------------------------------------- | ------------------------------------------- |
| `string`      | Textual value                             | Default type for plain text                 |
| `number`      | Numeric input                             | Integer or float                            |
| `bool`        | `true` or `false`                         | Often used for flags or toggles             |
| `list`        | Ordered collection                        | Index-based access                          |
| `map`         | Key-value collection                      | Key-based access                            |
| `set`         | Unordered collection, no duplicates       | Duplicate elements are rejected             |
| `object`      | Structured input combining multiple types | Useful for grouped configuration            |
| `tuple`       | Fixed-length, multi-type list             | Each element must match declared type order |

Using type constraints and structured variables allows for **strong validation**, **cleaner configurations**, and **better reusability** across environments and modules.
