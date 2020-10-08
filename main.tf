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
