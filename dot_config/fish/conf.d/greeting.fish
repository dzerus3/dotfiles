function fish_greeting
    if type -q fortune; and type -q lolcat
        fortune | lolcat
    else if type -q fortune
        fortune
    end
end
