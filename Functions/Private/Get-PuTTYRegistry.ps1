function Get-PuTTYRegistrySessions {
  <#
  .Synopsis
  Obtains a connection to the PuTTY registry key for the current user's hive.
  #>
  [CmdletBinding()]
  param (
  )

  $SessionRegPath = '{0}\Sessions' -f $Module.PrivateData['PuTTYRegPath']

  $RegCurrentUser = [RegistryKey]::OpenBaseKey([RegistryHive]::CurrentUser, [RegistryView]::Default)
  $RegCurrentUser.OpenSubKey($SessionRegPath)  
}