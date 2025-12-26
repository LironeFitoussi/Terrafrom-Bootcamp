# Tuple Type Examples

This folder demonstrates tuple type variable definitions in Terraform and the importance of matching the exact number and types of elements.

## Files

1. **01-correct-tuple.tf** - Shows a correct `tuple` type definition
   - Variable: `kitty`
   - Type: `tuple([string, number, bool])` - expects exactly 3 elements
   - Default: `["cat", 7, true]` - provides exactly 3 elements with matching types
   - ✅ This is valid and will work correctly

2. **02-incorrect-tuple.tf** - Shows an incorrect `tuple` type definition
   - Variable: `kitty`
   - Type: `tuple([string, number, bool])` - expects exactly 3 elements
   - Default: `["cat", 7, true, "dog"]` - provides 4 elements (one too many)
   - ❌ This will cause an error

## Error Example

When running `terraform plan` with `02-incorrect-tuple.tf`, you will see:

```
Error: Invalid default value for variable

on variables.tf line 3, in variable "kitty":
3:   default = ["cat", 7, true, "dog"]

This default value is not compatible with the
variable's type constraint: tuple required.
```

## Key Points

- **Fixed length**: Tuples have a fixed number of elements that must match exactly
- **Ordered types**: Each position in the tuple has a specific type requirement
- **Type matching**: The types at each position must match the tuple definition
- **No extra elements**: You cannot have more or fewer elements than defined in the tuple type
- **Position matters**: The order of types in the tuple definition must match the order of values in the default

## Tuple vs List

- **List**: `list(string)` - can have any number of elements, all of the same type
- **Tuple**: `tuple([string, number, bool])` - must have exactly the specified number of elements, each with its specific type

## Example Structure

For `tuple([string, number, bool])`:
- Position 0: must be a `string`
- Position 1: must be a `number`
- Position 2: must be a `bool`

The default value must provide exactly these three elements in this order.

