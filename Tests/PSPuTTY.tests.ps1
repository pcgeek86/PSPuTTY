<#
Assuming that this module is in your $env:PSModulePath, you can invoke this Pester test script:

  Set-Location -Path ('{0}\Tests' -f (Get-Module -Name PSPuTTY -ListAvailable).ModuleBase);
  ./PSPuTTY.tests.ps1
#>

$VerbosePreference = 'continue'
$ErrorActionPreference = 'stop'

describe -Name 'PSPuTTY PowerShell module' {
	$ModuleName = 'PSPuTTY'
	$ModulePath = Split-Path -Path $PSScriptRoot -Parent
	if (Get-Module -Name $ModuleName) {
		Remove-Module -Name $ModuleName
	}
	Import-Module -Name $ModulePath -Force
	Write-Verbose -Message ('Module path is: {0}' -f $ModulePath)

	context -Name 'Basic presence of core commands' {
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

		#it 'Should have a New-PSPuTTYSession command' {
		#	(Get-Command -Module $ModuleName -Name New-PSPuTTYSession).Count | Should be 1
		#}

		#it 'Should have a Remove-PSPuTTYSession command' {
		#	(Get-Command -Module $ModuleName -Name Remove-PSPuTTYSession).Count | Should be 1
		#}
	}

	context -Name 'Get-PSPuTTYTheme' {
		it 'Should not throw an error' {
			{ Get-PSPuTTYTheme } | Should not throw
		}
	}

	context -Name 'Get-PSPuTTYSession' {
		it 'Should not throw an error' {
			{ Get-PSPuTTYSession } | Should not throw
		}
	}

	context -Name 'Merge-PSPuTTYTheme' {
		it 'Should have four parameter sets' {
			(Get-Command -Module $ModuleName -Name Merge-PSPuTTYTheme).ParameterSets.Count | Should be 4
		}
	}

	#context -Name 'Remove-PSPuTTYSession' -Fixture {
	#	it 'Should require input parameters' {
	#		{ Start-Job -ScriptBlock { } } | Should throw
	#	}
	#}
}