# Text Concatenation Terraform Module

This Terraform template accepts large text data as input and concatenates it 3 times, returning the result as an output variable.

## Features

- Accepts large text input via variable
- Concatenates the input text 3 times
- Returns the concatenated result as output

## Usage

### 1. Initialize Terraform

```bash
cd terraform-sample/text-concatenation-module
terraform init
```

### 2. Provide Input Text

Create a `terraform.tfvars` file with your large text input:

```hcl
large_text_input = <<-EOT
Your large text content goes here.
This can be multiple lines.
The text will be concatenated 3 times.
EOT
```

Or use the example file:

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your text
```

### 3. Apply the Template

```bash
terraform apply
```

### 4. View the Output

After applying, the concatenated text will be displayed in the output:

```bash
terraform output concatenated_output
```

## Alternative: Pass Input via Command Line

You can also pass the input text directly via command line:

```bash
terraform apply -var='large_text_input=Your text here'
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| large_text_input | Large text data that will be concatenated 3 times | string | "" | no |

## Outputs

| Name | Description |
|------|-------------|
| concatenated_output | The input text concatenated 3 times |

## Example

Input:
```
Hello World!
```

Output:
```
Hello World!Hello World!Hello World!