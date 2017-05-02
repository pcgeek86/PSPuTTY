# PSPuTTY PowerShell Module

The PSPuTTY PowerShell module makes it easy to manage your PuTTY sessions from a PowerShell command prompt.

## Change Your PuTTY Color Theme

You can use PSPuTTY to easily change the color scheme of your PuTTY saved sessions.
The `Merge-PSPuTTYTheme` command will merge the specified theme with the specified PuTTY saved session.

```PowerShell
# Get a list of supported themes in this module
Get-PSPuTTYTheme 

# Merge the theme with an existing PuTTY saved session 
Merge-PSPuTTYTheme -SessionName 'AWS Ubuntu 16 Large' -ThemeName 'Birds of Paradise'
```

## Create a new PuTTY Session

If you want to create or import an array of PuTTY sessions, you can use `PSPuTTY` to achieve this.
Using the simple `New-PSPuTTYSession` command, you can create a new saved session and easily access it from PuTTY at any time.

```PowerShell
New-PSPuTTYSession -Name 'Google Cloud - VM' -Hostname myvm.googlecloud.com -Port 22 -Theme Chalkboard 
```

## Invoke a PuTTY Session 

When you launch PuTTY, you most likley fire up the main user interface, and then choose a saved session, right?
Now, you can easily invoke a PuTTY session directly from PowerShell, without having use the mouse at all!

The `Invoke-PSPuTTYSession` provides Intellisense / auto-completion for your PuTTY saved sessions, making it significantly easier for you to connect to the session you want to!

```PowerShell
Invoke-PSPuTTYSession -Name 'AWS Ubuntu'
```

## Remove a PuTTY Session

You can automate the cleanup of your PuTTY saved sessions by using the `Remove-PSPuTTYSession` command.
When you specify one or more sessions that you want to delete, you'll be prompted with Intellisense / auto-completion for the saved session names.

```PowerShell
Remove-PSPuTTYSession -Name Session1, Session2
```

## Themes

Some of the color themes for PuTTY, that are included in this PowerShell module, were not developed by this project.
Rather, the color themes are primarily taken from, what is presumed to be the original creator, a Russian website called http://putty.org.ru.
Each of the theme files has a `URL` property that indicates where the theme was taken from.

## Video

Here's a [YouTube video](https://www.youtube.com/watch?v=AeIDPMJxGHI) that briefly introduces the PowerShell module, and a couple of its useful commands.

# Known Issues

As of right now, this module is in early preview. There are a few, primary commands that are currently functional:

- Merge-PSPuTTYTheme - Updates the theme for a PuTTY saved session 
- Get-PSPuTTYTheme - List out the PuTTY themes that are supported 
- Get-PSPuTTYSession - List out the PuTTY saved session configurations
- Invoke-PSPuTTYSession - Kick off a new PuTTY session, with the specified saved session name

These following commands currently **DO NOT** work, until they're implemented:

- New-PSPuTTYSession - Create a new PuTTY saved session
- Remove-PSPuTTYSession - Delete a PuTTY saved session
- Export-PSPuTTYSession - Export one or more PuTTY saved sessions to a file
- Import-PSPuTTYSession - Import one or more PuTTY saved sessions from a file 

# Glossary

- PuTTY Saved Session - A pre-configure PuTTY session that appears in the **Saved Sessions** list in the PuTTY GUI 
- PuTTY Theme - A properly formatted JSON file in the `./themes` directory

# Contributors

This PowerShell module wouldn't be possible without the contributors listed below.

- [Trevor Sullivan](https://trevorsullivan.net) (Colorado, United States of America)
- [Joshua King](http://king.geek.nz/) (New Zealand)
