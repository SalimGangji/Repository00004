new-alias -name "ll" -value "get-childitem"

#[System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)

if($IsWindows){
    #Windows
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
get-psreadlineoption

if($IsWindows){
    #Windows
    show-tmoutputcolor
}
