set cd_cmd to "cd ~/Developer/Fructus"

tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text cd_cmd
            write text "spork"
        end tell
    end tell
end tell

tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text cd_cmd
            write text "rails s -p 3002"
        end tell
    end tell
end tell

tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text cd_cmd
        end tell
    end tell
end tell
