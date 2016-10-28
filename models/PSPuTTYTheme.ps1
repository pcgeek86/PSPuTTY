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
            $this.Name = $Theme.Name
            $this.Url = $Theme.Url
            
            $this.Colour0 = $Theme.Colors.Colour0
            $this.Colour1 = $Theme.Colors.Colour1
            $this.Colour2 = $Theme.Colors.Colour2
            $this.Colour3 = $Theme.Colors.Colour3
            $this.Colour4 = $Theme.Colors.Colour4
            $this.Colour5 = $Theme.Colors.Colour5
            $this.Colour6 = $Theme.Colors.Colour6
            $this.Colour7 = $Theme.Colors.Colour7
            $this.Colour8 = $Theme.Colors.Colour8
            $this.Colour9 = $Theme.Colors.Colour9
            $this.Colour10 = $Theme.Colors.Colour10
            $this.Colour11 = $Theme.Colors.Colour11
            $this.Colour12 = $Theme.Colors.Colour12
            $this.Colour13 = $Theme.Colors.Colour13
            $this.Colour14 = $Theme.Colors.Colour14
            $this.Colour15 = $Theme.Colors.Colour15
            $this.Colour16 = $Theme.Colors.Colour16
            $this.Colour17 = $Theme.Colors.Colour17
            $this.Colour18 = $Theme.Colors.Colour18
            $this.Colour19 = $Theme.Colors.Colour19
            $this.Colour20 = $Theme.Colors.Colour20
            $this.Colour21 = $Theme.Colors.Colour21
        }
        catch {
            Write-Error -Message 'Malformed theme file detected. Please ensure the format of the theme file is correct.'
        }
    }
}