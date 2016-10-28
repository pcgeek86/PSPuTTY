using namespace Microsoft.Win32
using namespace System.Web

function Get-PSPuTTYSession {
  <#
  .Synopsis
  Returns a list of configured PuTTY sessions.
  #>
  [CmdletBinding()]
  param (
    [string] $Name
  )

  Add-Type -AssemblyName System.Web
  $Command = $PSCmdlet.MyInvocation.MyCommand.Name
  $Module = $PSCmdlet.MyInvocation.MyCommand.Module
  $SessionRegPath = '{0}\Sessions' -f $Module.PrivateData['PuTTYRegPath']

  $RegCurrentUser = [RegistryKey]::OpenBaseKey([RegistryHive]::CurrentUser, [RegistryView]::Default)
  $PuTTYSessions = $RegCurrentUser.OpenSubKey($SessionRegPath)
  $KeyList = $PuTTYSessions.GetSubKeyNames()

  foreach ($Key in $KeyList) {
    $KeyName = [HttpUtility]::UrlDecode($Key); 
    Write-Verbose -Message ('Found PuTTY saved session: {0}, URL decoded: {1}' -f $Key, $KeyName)
    [PSPuTTYSession]::new($Key, $KeyName)
  }
}