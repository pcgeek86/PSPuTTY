$ScriptBlock = {
  <#
  .SYNOPSIS
  Auto-complete the -Name parameter value for PSPuTTY sessions.

  .NOTES
  Created by Trevor Sullivan, Founder of Art of Shell <trevor@artofshell.com>
  https://trevorsullivan.net https://artofshell.com
  #>
  param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

  $ItemList = Get-PSPuTTYTheme | Where-Object { $PSItem.Name -match $wordToComplete } | ForEach-Object {
    $CompletionText = '''{0}''' -f $PSItem.Name
    $ToolTip = 'PuTTY session: {0}.' -f $PSItem.Name
    $ListItemText = '{0}' -f $PSItem.Name
    $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue

    New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
}

  return $ItemList
}

$ArgumentCompleter = @{
        CommandName = @(
            'Merge-PSPuTTYTheme'
            );
        ParameterName = 'ThemeName';
        ScriptBlock = $ScriptBlock
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter

$ArgumentCompleter = @{
        CommandName = @(
            'Get-PSPuTTYTheme'
            );
        ParameterName = 'Name';
        ScriptBlock = $ScriptBlock
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter