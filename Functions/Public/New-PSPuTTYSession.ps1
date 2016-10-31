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
      , [Parameter(Mandatory = $false)]
        [string] $WindowTitle
      , [Parameter(Mandatory = $true)]
        [string] $TerminalType = 'putty-256color'
      , [Parameter(Mandatory = $true)]
        [string] $UserName
    )

    $PuTTYSessionsReg = Get-PSPuTTYRegistrySessions

    ### Create a new, in-memory PuTTY saved session
    $NewSession = [PSPuTTYSession]::new()

    if ($WindowTitle) { $NewSession.WinTitle = $WindowTitle }
    if ($Port) { $NewSession.PortNumber = $Port }
    if ($TerminalType) { $NewSession.TerminalType = $TerminalType }
    
    ### Write the new PuTTY session to the registry
    $NewSession.Write()
}