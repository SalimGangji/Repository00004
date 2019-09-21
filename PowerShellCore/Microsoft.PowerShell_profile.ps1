new-alias -name "ll" -value "get-childitem"

set-psreadlineoption -Colors @{"Command"=[ConsoleColor]::Yellow}
set-psreadlineoption -Colors @{"Member"=[ConsoleColor]::Blue}
set-psreadlineoption -Colors @{"Number"=[ConsoleColor]::DarkBlue}
set-psreadlineoption -Colors @{"Parameter"=[ConsoleColor]::Gray}
set-psreadlineoption -Colors @{"Type"=[ConsoleColor]::DarkMagenta}
set-psreadlineoption -Colors @{"Comment"=[ConsoleColor]::Blue}
set-psreadlineoption -Colors @{"String"=[ConsoleColor]::Cyan}
set-psreadlineoption

show-tmoutputcolor