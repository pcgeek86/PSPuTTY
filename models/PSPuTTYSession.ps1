class PSPuTTYSession {
  [string] $Name          ### The name of the PuTTY saved session (URL-encoded).
  [string] $Hostname      ### The hostname or IP address of the host that the PuTTY saved session will connect to.
  [int] $Port             ### The TCP port that the PuTTY session will connect to
  [string] $ThemeName     ### The name of the PuTTY theme that will be associated with this PuTTY saved session.
  [string] $RealName      ### The user-friendly name (not URL encoded) of the PuTTY saved session

  ### Constructore intended for creating a new session with a particular theme.
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

  ### Constructor intended for creating and writing new saved sessions.
  PSPuTTYSession ([string] $RealName) {

  }

  ### Writes the session to the Windows Registry
  [void] Write() {
      ### TODO: Implement

  }
}