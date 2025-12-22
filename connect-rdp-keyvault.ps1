# Connect to Remote Desktop using Key Vault credentials
param(
    [string]$ComputerName = "AW_KILLER",
    [string]$KeyVaultName = "hhrcpakv01",
    [string]$MeshnetIP = "10.5.0.2"  # Update with your Meshnet IP
)

Write-Host "🔐 Connecting to RDP via Key Vault credentials..." -ForegroundColor Cyan

# Retrieve password from Key Vault
$secretName = "RDP-PASSWORD-$ComputerName"
$password = az keyvault secret show --vault-name $KeyVaultName --name $secretName --query value -o tsv

if ($password) {
    # Use Meshnet IP if available, otherwise use computer name
    $target = if (Test-Connection -ComputerName $MeshnetIP -Count 1 -Quiet) { $MeshnetIP } else { $ComputerName }
    
    Write-Host "✅ Connecting to: $target" -ForegroundColor Green
    
    # Create credential
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential ($env:USERNAME, $securePassword)
    
    # Launch Remote Desktop
    cmdkey /generic:$target /user:$env:USERNAME /pass:$password | Out-Null
    mstsc /v:$target
    
    # Clean up credential
    Start-Sleep -Seconds 5
    cmdkey /delete:$target | Out-Null
}
else {
    Write-Host "❌ Failed to retrieve password from Key Vault" -ForegroundColor Red
}
