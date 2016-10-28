class PSPuTTYTheme {
    [string] $Name 
    [string] $Url

    [string] $Colour0
    [string] $Colour1
    [string] $Colour2
    [string] $Colour3
    [string] $Colour4
    [string] $Colour5
    [string] $Colour6
    [string] $Colour7
    [string] $Colour8
    [string] $Colour9
    [string] $Colour10
    [string] $Colour11
    [string] $Colour12
    [string] $Colour13
    [string] $Colour14
    [string] $Colour15
    [string] $Colour16
    [string] $Colour17
    [string] $Colour18
    [string] $Colour19
    [string] $Colour20
    [string] $Colour21

    PSPuTTYTheme ([object] $Theme) {
        try {
            
        }
        catch {
            Write-Error -Message 'Malformed theme file detected. Please ensure the format of the theme file is correct.'
        }
    }
}