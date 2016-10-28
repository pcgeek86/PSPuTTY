class PSPuTTYSession {
  [string] $Name
  [string] $Hostname
  [int] $Port
  [string] $Theme

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

  ### Writes the session to the Windows Registry
  [void] Write() {
      
  }
}