# Suppress all warnings
$WarningPreference = "SilentlyContinue"

# Trap all errors and provide a non-0 exit code
trap {
    # Write the most recent error to StdErr
    Write-Error $Error[0]

    # Return a non-0 exit code to the calling process with the error
    exit 1
}

# Prepare a return object
$result = @{}

# Process some data
$result.timestamp = ( Get-Date ).DateTime
$result.message = "Is this thing on?"

# Write json output
$jsonOutput = $result | ConvertTo-Json -Compress
$jsonOutput | Write-Output