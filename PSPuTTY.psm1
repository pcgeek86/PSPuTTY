$PSPuTTY = $ExecutionContext.SessionState.Module
$PSPuTTY.PrivateData['PuTTYRegPath'] = 'Software\SimonTatham\PuTTY' 
Write-Verbose -Message ('Module path is: {0}' -f $PSPuTTY.ModulePath)

#region Aliases
### This section contains aliases that will be exported from the module.

### Import all aliases from the Aliases folder.
$AliasFileList = Get-ChildItem -Path $PSScriptRoot\Aliases\*Aliases.json -ErrorAction Ignore;
foreach ($AliasFile in $AliasFileList){
	$AliasJson = ConvertFrom-Json -InputObject (Get-Content -Path $AliasFile -Raw);
    foreach ($Alias in $AliasJson.Aliases) {
        ### Validate that each alias has a name and value defined. The description is optional.
        if ($Alias.Name -and $Alias.Value) {
            $NewAlias = @{
                Name = $Alias.Name;
                Value = $Alias.Value;
                Description = $Alias.Description;
            }
            New-Alias @NewAlias;
        } else {
            Write-Warning -Message ('Alias skipped in file {0}' -f $AliasFile.Name);
        }
    }
}
#endregion

#region Classes
$ClassList = Get-ChildItem -Path $PSScriptRoot\Models;
foreach ($Class in $ClassList) {
    Write-Verbose -Message ('Importing class file: {0}' -f $Class.FullName);
	. $Class.FullName;
}
#endregion

#region Functions

#region Public Functions
$FunctionList = Get-ChildItem -Path $PSScriptRoot\Functions\Public;
foreach ($Function in $FunctionList) {
    Write-Verbose -Message ('Importing function file: {0}' -f $Function.FullName);
	. $Function.FullName;
}
#endregion Public Functions

#region Private Functions
$FunctionList = Get-ChildItem -Path $PSScriptRoot\Functions\Private;
foreach ($Function in $FunctionList) {
    Write-Verbose -Message ('Importing function file: {0}' -f $Function.FullName);
	. $Function.FullName;
}
#endregion Private Functions

#endregion Functions

#region Import Argument Completers
$CompleterScriptList = Get-ChildItem -Path $PSScriptRoot\Completers\*.ps1;

foreach ($CompleterScript in $CompleterScriptList) {
    Write-Verbose -Message ('Import argument completer script: {0}' -f $CompleterScript.FullName);
    & $CompleterScript.FullName;
}
Write-Verbose -Message 'Finished importing argument completer scripts.';
#endregion

#region Format Data
$FormatFileList = Get-ChildItem -Path "$PSScriptRoot\Format Types\*" -Filter *format.ps1xml;
foreach ($FormatFile in $FormatFileList) {
    Update-FormatData -PrependPath $FormatFile.FullName;
    Write-Verbose -Message ('Added format file: {0}' -f $FormatFile.Name);
}
#endregion

