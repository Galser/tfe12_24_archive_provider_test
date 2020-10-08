# tfe12_24_archive_provider_test
This is repository to test behavior of TF 0.12.24 with archive provider

## intro
There had reported following the following behaviour of the provider duyring the apply phase
inf TFE v202009-2 : 

```
Terraform v0.12.24
Initializing plugins and modules...
2020/10/08 06:54:24 [DEBUG] Using modified User-Agent: Terraform/0.12.24 TFE/v202009-2

Error: Could not satisfy plugin requirements

Plugin reinitialization required. Please run "terraform init".

Error: provider.archive: no suitable version installed
version requirements: "(any version)"
versions installed: none
```

## Test

Following code in [main.tf](main.tf) is defined : 

```
provider "archive" {}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello Archive"
  }
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "main.tf"
  output_path = "code_init.zip"
}
```

Next step is to create a workspace in the TFE and do **PLAN and APPLY**


