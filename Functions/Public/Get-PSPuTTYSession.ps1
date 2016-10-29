using namespace Microsoft.Win32
using namespace System.Web

function Get-PSPuTTYSession {
  <#
  .Synopsis
  Returns a list of configured PuTTY sessions.
  
  .Outputs
  [PSPuTTYSession]
  #>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false)]
    [string] $Name
  )

  $Command = $PSCmdlet.MyInvocation.MyCommand.Name
  $Module = $PSCmdlet.MyInvocation.MyCommand.Module

  ### Get a reference to the PuTTY Registry sessions subkey
  $PuTTYSessions = Get-PSPuTTYRegistrySessions

  ### List out the sessions under the PuTTY sessions subkey
  ### NOTE: Sessions are stored as URL-encoded names, and do not have spaces, even if the session name does have spaces.
  ###       The PSPuTTYSession data model has properties to store both the URL encoded name, and the URL decoded (natural) session name
  $KeyList = $PuTTYSessions.GetSubKeyNames()

  ### Empty array to hold a list of sessions
  $SessionList = @()

  foreach ($Key in $KeyList) {
    $KeyName = [System.Web.HttpUtility]::UrlDecode($Key) 
    Write-Verbose -Message ('Found PuTTY saved session: {0}, URL decoded: {1}' -f $Key, $KeyName)
    $SessionList += [PSPuTTYSession]::new($Key, $KeyName)
  }

  if ($PSBoundParameters.ContainsKey('Name')) {
    Write-Output -InputObject $SessionList.Where({ $PSItem.RealName -eq $Name })
  } else {
    Write-Output -InputObject $SessionList
  }
}