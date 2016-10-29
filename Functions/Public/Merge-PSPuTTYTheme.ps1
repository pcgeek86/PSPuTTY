using namespace System.Web

function Merge-PSPuTTYTheme {
    <#
    .Synopsis
    Configures a PuTTY saved session with the specified theme.

    .Parameter SessionName
    The name of the PuTTY saved session that will have its theme updated.
    
    NOTE: The session name will be URL-encoded, to conform to the stored value in the registry. Make sure that you do not use the URL-encoded name of the session.
          Rather, use the "friendly name" of the session, that appears in the PuTTY Saved Session list.

    .Parameter ThemeName
    The name of the PuTTY theme that will be configured on the saved session.

    .Parameter Session
    The PSPuTTYSession object that will be updated with a new theme.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionNameThemeName')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionNameThemeObject')]
        [string] $SessionName
      , [Parameter(Mandatory = $true, ParameterSetName = 'SessionObjectThemeName')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionObjectThemeObject')]
        [PSPuTTYSession] $Session
      , [Parameter(Mandatory = $true, ParameterSetName = 'SessionObjectThemeName')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionNameThemeName')]
        [string] $ThemeName
      , [Parameter(Mandatory = $true, ParameterSetName = 'SessionNameThemeObject')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SessionObjectThemeObject')]
        [PSPuTTYTheme] $Theme
    )

    Write-Verbose -Message
    Write-Verbose -Message ('Using parameter set: {0}' -f $PSCmdlet.ParameterSetName)

    ### If the user specifies a session name, then we need to URL encode it
    if ($PSCmdlet.ParameterSetName -match 'SessionName') {
      Write-Verbose -Message 'Caller specified session name. Obtaining session object.'
      $Session = Get-PSPuTTYSession -Name $SessionName
    }

    if ($PSCmdlet.ParameterSetName -match 'ThemeName') {
      Write-Verbose -Message 'Caller specified theme name. Obtaining theme object.'
      $Theme = Get-PSPuTTYTheme -Name $ThemeName
    }

    Write-Verbose -Message ($Session)
    Write-Verbose -Message ('Opening PuTTY session subkey: {0}' -f $Session.Name)
    $PuTTYSessionReg = (Get-PSPuTTYRegistrySessions).OpenSubkey($Session.Name, $true)

    $SessionKey = $PuTTYSessionReg.OpenSubkey($Session.Name)
    foreach ($Number in 0..21) {
      Write-Verbose -Message ('Setting Colour{0} to {1}' -f $Number, $Theme."Colour$Number")
      $PuTTYSessionReg.SetValue("Colour$Number", $Theme."Colour$Number", [Microsoft.Win32.RegistryValueKind]::String)
    }

    $PuTTYSessionReg.SetValue('TerminalType', 'putty-256color')
}