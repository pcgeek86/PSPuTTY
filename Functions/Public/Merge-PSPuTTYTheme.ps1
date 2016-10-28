function Merge-PSPuTTYTheme {
    <#
    .Synopsis
    Configures a PuTTY saved session with the specified theme.

    .Parameter SessionName
    The name of the PuTTY saved session that will have its theme updated.

    .Parameter ThemeName
    The name of the PuTTY theme that will be configured on the saved session.

    .Parameter Session
    The PSPuTTYSession object that will be updated with a new theme.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionName')]
        [string] $SessionName
      , [Parameter(Mandatory = $true, ParameterSetName = 'SessionObject')]
        [PSPuTTYSession] $Session
      , [Parameter(Mandatory = $true)]
        [string] $ThemeName
    )

    
}