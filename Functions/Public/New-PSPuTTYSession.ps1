function New-PSPuTTYSession {
    <#
    .Synopsis
    Creates a new PuTTY saved session.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Name        
      , [Parameter(Mandatory = $true)]
        [string] $Hostname
      , [Parameter(Mandatory = $true)]
        [int] $Port
      , [Parameter(Mandatory = $true)]
        [string] $ThemeName
    )
}