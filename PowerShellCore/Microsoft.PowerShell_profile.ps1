new-alias -name "ll" -value "get-childitem"

#[System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)

#https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7
# ContinuationPrompt: The color of the continuation prompt.
# Emphasis: The emphasis color. For example, the matching text when searching history.
# Error: The error color. For example, in the prompt.
# Selection: The color to highlight the menu selection or selected text.
# Default: The default token color.
# Comment: The comment token color.
# Keyword: The keyword token color.
# String: The string token color.
# Operator: The operator token color.
# Variable: The variable token color.
# Command: The command token color.
# Parameter: The parameter token color.
# Type: The type token color.
# Number: The number token color.
# Member: The member name token color.

if($IsWindows){
    #Windows
        
    #Variables for work laptop L084790
    if( $env:COMPUTERNAME -imatch "L084790" ) {
        $everything = "C:\Master_Folder\Everything"
        $active = "$everything\active"
        $repos = "$everything\repos"
        $desktop="$env:userprofile\Desktop"
    }

    #show-tmoutputcolor
    set-psreadlineoption -Colors @{"Command"=[ConsoleColor]::Yellow};
    set-psreadlineoption -Colors @{"String"=[ConsoleColor]::Cyan};
}
else {
    #Linux
    set-psreadlineoption -Colors @{"Command"=[ConsoleColor]::DarkCyan};
    set-psreadlineoption -Colors @{"String"=[ConsoleColor]::Red}
}

set-psreadlineoption -Colors @{"Member"=[ConsoleColor]::Blue}
set-psreadlineoption -Colors @{"Number"=[ConsoleColor]::DarkBlue}
set-psreadlineoption -Colors @{"Parameter"=[ConsoleColor]::Gray}
set-psreadlineoption -Colors @{"Type"=[ConsoleColor]::DarkMagenta}
set-psreadlineoption -Colors @{"Comment"=[ConsoleColor]::Blue}
#get-psreadlineoption
