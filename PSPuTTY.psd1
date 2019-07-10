# Module manifest for module 'AzureExt'
# Generated by: Trevor Sullivan

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PSPuTTY.psm1';

# Version number of this module.
ModuleVersion = '0.1.1';

# ID used to uniquely identify this module
GUID = '09f9c88b-06ab-46d1-9661-f29d0bf30f1e';

# Author of this module
Author = 'Trevor Sullivan <trevor@artofshell.com>';

# Company or vendor of this module
CompanyName = 'Art of Shell';

# Copyright statement for this module
Copyright = '(c) Art of Shell LLC 2016. All rights reserved.';

# Description of the functionality provided by this module
Description = 'This PowerShell module enables you to switch between color themes for your saved PuTTY sessions easily.';

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0';

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @('');

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @(
  'System.Web'
  )

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @(
    )

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = @(
    'Invoke-PSPuTTYSession'
    #'New-PSPuTTYSession'
    'Get-PSPuTTYSession'
    'Get-PSPuTTYTheme'
    'Merge-PSPuTTYTheme'
    #'Remove-PSPuTTYSession'
    );

# Cmdlets to export from this module
#CmdletsToExport = '';

# Variables to export from this module
#VariablesToExport = '';

# Aliases to export from this module
AliasesToExport = @(

    );

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
	)

# Private data to pass to the module specified in RootModule/ModuleToProcess
PrivateData = @{
    PSData = @{
        ### A PowerShell [string[]] array with a list of tags.
        Tags = @('PuTTY', 'Linux', 'terminal');
        
        ### The PowerShell project's website URI
        ProjectUri = 'https://github.com/pcgeek86/PSPuTTY';

        ### The URI to the file that will be used as the PowerShell module's icon.
        # IconUri = '';

        ### The URI to the license file for the PowerShell module.
        LicenseUri = 'https://trevorsullivan.net/trevor-license.txt';

        ### The URI to the release notes for the current version of the PowerShell module.
        ReleaseNotes = '
        0.1 - <Release notes>
        '
    }
}

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


