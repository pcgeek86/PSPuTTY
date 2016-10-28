class PSPuTTYSession {
  [string] $Name
  [string] $Hostname
  [int] $Port
  [string] $Theme
  [string] $RealName

  PSPuTTYSession (
    [string] $Name,
    [string] $Hostname,
    [int] $Port,
    [string] $Theme) {

    $this.Name = $Name 
    $this.Hostname = $Hostname 
    $this.Port = $Port 
    $this.Theme = $Theme
  }

  PSPuTTYSession ([string] $Name, [string] $RealName) {
    $this.Name = $Name
    $this.RealName = $RealName
  }

  ### Writes the session to the Windows Registry
  [void] Write() {
      ### TODO: Implement
  }
}