using namespace Microsoft.Win32

function Get-PSPuTTYRegistrySessions {
  <#
  .Synopsis
  Obtains a connection to the PuTTY registry key for the current user's hive.
  #>
  [CmdletBinding()]
  param (
  )

  $Command = $PSCmdlet.MyInvocation.MyCommand.Name
  $Module = $PSCmdlet.MyInvocation.MyCommand.Module

  ### Get the PuTTY registry path
  $SessionRegPath = '{0}\Sessions' -f $Module.PrivateData['PuTTYRegPath']

  ### Open the CurrentUser hive and the PuTTY subkey
  $RegCurrentUser = [RegistryKey]::OpenBaseKey([RegistryHive]::CurrentUser, [RegistryView]::Default)
  $RegCurrentUser.OpenSubKey($SessionRegPath, $true)
}