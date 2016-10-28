describe -Name 'PSPuTTY PowerShell module' {
    $ModuleName = 'PSPuTTY'
    $ModulePath = Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent
    if (Get-Module -Name $ModuleName) {
        Remove-Module -Name $ModuleName
    }
    Import-Module -Name $ModuleName -Force

    it 'Should have a Get-PSPuTTYSession command' {
        (Get-Command -Module $ModuleName -Name Get-PSPuTTYSession).Count | Should be 1
    }

    it 'Should have a Get-PSPuTTYTheme command' {
        (Get-Command -Module $ModuleName -Name Get-PSPuTTYTheme).Count | Should be 1
    }

    it 'Should have a Merge-PSPuTTYTheme command' {
        (Get-Command -Module $ModuleName -Name Merge-PSPuTTYTheme).Count | Should be 1
    }

    it 'Should have a Invoke-PSPuTTYSession command' {
        (Get-Command -Module $ModuleName -Name Invoke-PSPuTTYSession).Count | Should be 1
    }

    it 'Should have a New-PSPuTTYSession command' {
        (Get-Command -Module $ModuleName -Name New-PSPuTTYSession).Count | Should be 1
    }

}