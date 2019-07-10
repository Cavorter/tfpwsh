# Get some arbitrary data from our external powershell script
data "external" "myscript" {
    program = ["powershell.exe","${path.module}/MyScript.ps1"]
}

# Use our returned data by, for example, writing it to a file
resource "local_file" "output_file" {
    filename = "${path.module}/output/file.txt"
    content = "${data.external.myscript.result.timestamp} - ${data.external.myscript.result.message}"
}

# If this were a module referenced by another Terraform project
# we would probably want to pass some of our data to them
output "timestamp" {
  value = "${data.external.myscript.result.timestamp}"
}

output "message" {
  value = "${data.external.myscript.result.message}"
}

