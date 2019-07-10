# How to Reference a Module in a Sibling Folder

## The Problem

In an ideal world any modules you need to reference will be published to a local nuget repo where they can be installed and referenced fairly easily. However there may be times that for whatever reason publishing the module is not practical and either the complexity of the logic is sufficient or you wish to re-use the logic in other non-terraform portions of the project.

In those cases it may seem relatively simple: Reference the PSD1 file using a relative path in the script executed by the data resource. Something like:

```powershell
Import-Module -Path $PSScriptRoot\..\module\MyModule.psd1 -Force
```

Unfortunately Terraform does not execute scripts in the same directory where the source files are located, but instead runs them in a temporary working directory that may exist on a completely different disk.

## The Solution

