# Terraform template to accept large text input and concatenate it 3 times

# Input variable to accept large text data
variable "large_text_input" {
  description = "Large text data that will be concatenated 3 times"
  type        = string
  default     = ""
}

# Local value to concatenate the input text 3 times
locals {
  concatenated_text = "${var.large_text_input}${var.large_text_input}${var.large_text_input}"
}

# Output variable with the concatenated text
output "concatenated_output" {
  description = "The input text concatenated 3 times"
  value       = local.concatenated_text
}