function Invoke-PSPuTTYSession {
  <#
  .Synopsis
  Invokes a new PuTTY session, with the specified saved session name.
  #>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true)]
    [string] $Name
  )

  Write-Verbose -Message ('Launching new PuTTY session named {0}' -f $Name)
  Start-Process -FilePath putty.exe -ArgumentList ('-load "{0}"' -f $Name) -NoNewWindow
}