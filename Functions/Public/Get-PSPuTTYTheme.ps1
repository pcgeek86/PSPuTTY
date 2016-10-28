function Get-PSPuTTYTheme {
  <#
  .Synopsis
  Returns a list of supported PuTTY themes that are distributed with this PowerShell module.
  #>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false)]
    [string] $Name
  )

  $Command = $PSCmdlet.MyInvocation.MyCommand.Name
  $Module = $PSCmdlet.MyInvocation.MyCommand.Module

  Write-Verbose -Message ('{0}: {1}' -f $Command, ($Module | ConvertTo-Json -Depth 1))
  $ThemeFileList = Get-ChildItem -Path ('{0}\Themes' -f $Module.ModuleBase)
  $ThemeList = @()

  foreach ($ThemeFile in $ThemeFileList) {
    Write-Verbose -Message ('{0}: Processing file: {1}' -f $Command, $ThemeFile.FullName)
    $ThemeJson = Get-Content -Path $ThemeFile.FullName -Raw | ConvertFrom-Json
    $ThemeList += [PSPuTTYTheme]::new($ThemeJson)
  }

  if ($PSBoundParameters.ContainsKey($Name)) {
    Write-Output -InputObject $ThemeList.Where({ $PSItem.Name -like $Name })
  } else {
    Write-Output -InputObject $ThemeList
  }
}