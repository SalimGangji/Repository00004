new-alias -name "ll" -value "get-childitem"

#Windows
set-psreadlineoption -Colors @{"Command"=[ConsoleColor]::Yellow}

#Linux
set-psreadlineoption -Colors @{"Command"=[ConsoleColor]::DarkCyan}

set-psreadlineoption -Colors @{"Member"=[ConsoleColor]::Blue}
set-psreadlineoption -Colors @{"Number"=[ConsoleColor]::DarkBlue}
set-psreadlineoption -Colors @{"Parameter"=[ConsoleColor]::Gray}
set-psreadlineoption -Colors @{"Type"=[ConsoleColor]::DarkMagenta}
set-psreadlineoption -Colors @{"Comment"=[ConsoleColor]::Blue}
set-psreadlineoption -Colors @{"String"=[ConsoleColor]::Cyan}
get-psreadlineoption

#Windows
show-tmoutputcolor
