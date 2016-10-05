UPDATED:
- Some of the procedures in the procedures.etcl have been modified for better, and faster, performance.
- OpRestrict now ignores bots (with flag +b on global/channel)
- When you remove a mainchan, it now removes all suspends, and bans associated with that channel.
- How +setuser suspend demodes users, it now demodes all users with the handle of the suspendee, instead of just the first.
- Some of the procedures to write to files, they now work quicker, and without as much cpu usage.
- How the suspension list, and banlist work. Hopefully this will remove the banlist being removed.
- How the adduser, deluser, auth, deauth scripts work, they now process the set(<command>.file) a lot quicker, and also enable multi-line scripts.
- Every bind has been changed to look neater, and work more efficiently.
- The procedures everywhere to compliment the new variables in the configuration file.
- Auto Identifying to Services now deals with all Services; NickOP, ChanOP, and NoteOP.
- When the check_settings procedure sets off, the script now checks if the NickOP password is set before authenticating to Services.
- +info <channel> no longer resets 'Manager Seen' if the manager does it.

CHANGED:
- Changed a couple of words; what messages are printed.
- When the bot checks the ban, and suspend lists. From starting the bot to connecting to the server.
- The Note/Memo scripts, you no longer put the 'note' infront of your commands.
- How the +clean command handles the access levels, will always put modes back now.
- How some of the procedures process data.

REMOVED:
- Disabled checking of access for the ChanOP, just a silly thing.
- Two lines I accidentally left in, which made the faggot 'm0rph' unable to recieve access in any channel.
- A couple of error checkers that have never returned an error.

ADDED:
- You cannot adduser, deluser, ban, kick, or deop the ChanOP (works by nickname).
- Bot Operators (with flags +m [200 operator]) can now set their level to anything in any channel.
- If someone sets the chanmode +k on a channel, the bot now writes the key to the bot chanfile, to join the channel.
- Added +mimic list, which lists all people in the mimic file. If there are too many, it doesn't roll over to another line.
- An option in the configuration file to see if you want the bot to print reports to the home channel or not.
- /msg host, to manage your hosts with add, del, and list.
- A backup bot plan to make it if you have a backup bot, the two bots won't fight. Instead, the backup won't responde to any channel-related commands.
- If you specify a wrong note with read (eg. /msg read beh!) it will now return an error.
- A 'setinfo' and 'setfile' command into the partyline to change the configuration variables and the mimic, topics, and quickban files.
- .mainchan del <channel> now removes the channel from the eggdrop as well as script.

FIXED:
- A bug in /msg op that didn't take any notice of oprestrict.
- When you op more then one person via message, it will now display 'OP[m]' instead of 'OP[c]' in the partyline.
- When a user with 150+ tries to setuser, they can no longer set another user to a level above their own.
- When a user authenticated and wasn't using their handle'd nickname, it came up with an error.
- With OpRestrict, when people authenticate, or +op, they would still have the mode changed.
- Bug in /msg op which didn't op 100 'operator access' if channels weren't added to the script.
- Mis-text in +set mode that didn't send people the level they set in the command.
- Bugs in +set that enabled users to set a mode, topiclock and other settings with points in them.
- Bug in a channel kick, reversed the process of bots (with flag +b on global/channel), and users with suspensions, and protection.
- Bug in /msg op that returned an error if a person with 'operator access' tried to op in a channel that wasn't a #chan.
- A giant bug in kick, ban, set that allowed users to use returns like \r\n in text to make the bot perform server commands.
- +info <nickname> now works in the channel.
- /msg invite actually invites you to the channel now, the whole command wasn't working.
- What some of the procedures/commands say when outputted to the user.
- /msg read n,n works with comma's now.
- on PART error for eggdrop v1.6.* resolved, now works on all versions.
- on PART didn't deauthenticate if there were no common channels left, it now does.
- on KICK didn't deauthenticate if there were no common channels left, it now does.
- on NOTC error for eggdrop v1.6.* resolved, now works on all versions.
