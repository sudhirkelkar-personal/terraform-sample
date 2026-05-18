# Text Concatenation Terraform Module for IBM CAM

This Terraform template accepts large text data as input and concatenates it 3 times, returning the result as an output variable. It is designed to work with IBM Cloud Automation Manager (CAM).

## Features

- Accepts large text input via variable
- Concatenates the input text 3 times
- Returns the concatenated result as output
- Includes CAM metadata for proper UI integration

## Files

- **main.tf** - Main Terraform configuration with variables and outputs
- **camvariables.json** - CAM metadata file that defines input/output parameters for the CAM UI
- **terraform.tfvars.example** - Example configuration file

## Usage in IBM CAM

### 1. Import Template into CAM

1. Log into IBM Cloud Automation Manager
2. Navigate to **Library** > **Templates**
3. Click **Create Template** or **Import Template**
4. Provide the Git repository URL or upload the template files
5. CAM will automatically detect the `camvariables.json` file

### 2. Create a Service

1. Go to **Library** > **Services**
2. Click **Create Service**
3. Select this template
4. You should now see the input parameter:
   - **Large Text Input** - Text area to enter your large text data

### 3. Deploy the Service

1. Fill in the **Large Text Input** field with your text
2. Click **Deploy**
3. After deployment, view the output:
   - **Concatenated Output** - Shows the input text concatenated 3 times

## CAM Variables Configuration

The `camvariables.json` file defines:

### Input Parameters
- **large_text_input**: String input for large text data
  - Group: Text Input Configuration
  - Type: String
  - Required: No (has default empty value)
  - Secured: No

### Output Parameters
- **concatenated_output**: The concatenated result
  - Group: Text Output Results
  - Type: String

## Local Testing (Without CAM)

### 1. Initialize Terraform

```bash
cd terraform-sample/text-concatenation-module
terraform init
```

### 2. Provide Input Text

Create a `terraform.tfvars` file:

```hcl
large_text_input = <<-EOT
Your large text content goes here.
This can be multiple lines.
The text will be concatenated 3 times.
EOT
```

### 3. Apply the Template

```bash
terraform apply
```

### 4. View the Output

```bash
terraform output concatenated_output
```

## Alternative: Pass Input via Command Line

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
```

## Troubleshooting

### Input/Output Parameters Not Showing in CAM

If parameters are not visible in CAM:

1. Ensure `camvariables.json` is in the same directory as `main.tf`
2. Verify the JSON syntax is valid
3. Re-import the template in CAM
4. Check CAM logs for any parsing errors

### Template Import Issues

- Make sure all files are in the same directory
- Verify Git repository permissions if importing from Git
- Check that the template follows CAM naming conventions