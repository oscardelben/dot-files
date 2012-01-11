tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text "cd ~/Developer/wildfire/account_management"
            write text "rails s -p 3001"
        end tell
    end tell
end tell

tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text "cd ~/Developer/wildfire/app_suite"
            write text "rails s"
        end tell
    end tell
end tell

tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text "cd ~/Developer/wildfire/app_suite"
            write text "QUEUE=* be rake environment resque:work"
        end tell
    end tell
end tell
