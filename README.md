# Services TCL v2.2 [Mon May 12 20:26:22 2003] 'damian'
### Written by damian / damian@damian.id.au
### 'The end before the new beginning.'

## Information [other information you may need to know]:
This readme tells you information about the script you are about
to load, there isn't much about how to actually go about loading
it up though. You should have at least basic eggdrop/TCL and IRC
knowledge before attempting to load up this TCL, it's not for the
stupid people.
All commands available to use on the bot are listed in here, if
they aren't check through the .etcl files in the archive.
Please read the Must-know information before asking in the
channel, or by email about this script.

## Must-know information

All of the information below is must-know stuff when using this TCL. Over
time this will definately get larger and larger, so keep track with it.

- The TCL has only been tested on eggdrop v1.4.3, v1.4.4, v1.4.5. I know it
  will not work on any version above 1.5.0, and it may not work on versions
  lower than 1.4.0. There is a stop feature in the TCL to prevent it from
  working on these versions and crashing your bot, so beware!

- If you get warnings about action_part, or anything similar chances are
  you loaded the TCL into an uncompatable version of eggdrop, see above! ^

- If people dont read this its their fault. Before you can use this script
  in any channels, you must add yourself. How do you do this? Use the
  'addme' command. The usage of it is simple (/msg botnick addme password
  channel). A more advanced help is below in the Commands section.

- These Services will not work like normal services. They are connected as
  a normal client to the server, therefore will work just as any other bot
  does.

- If you run this TCL on any other network than AustNet you may have
  problems with the Channel/Nickname/Memo Services options, as AustNet's
  are unique, and very different from other networks such as NewNet, EFnet
  Undernet, DALnet etc. So take care when using other networks, as the
  script may not function how you want it to.

- If you are planning to put this TCL on a website of your own, please keep
  the archive as-is. It's got everything the client will need to set up the
  eggdrop to work, if you remove anything you are just wasting peoples time.

- If you find any bugs in the script, or you think anything should be
  changed (this includes spelling mistakes and things) gimme a yell on
  AustNet or by Email. It all helps to get the script running it's best.

- TCL/Eggdrop gets confused when you use '\' in files, so use '/' instead
  to save time/trouble when setting up your files.

--

## Commands and extra information

This bit of information shows all of the channel/query/partyline commands,
how they are used, what they do, any additional information you may want to
know, and if they have switches (-switch) what the switch does.
This is how they all look:
-
### [command]: - [syntax]
             - [syntax]
    * [-switch] -> [explination]
  - [what its used for]
  * [additional information]
-

The syntax for all commands is located in the <command>.etcl file too. If the
command is '+command ..' with only the '+' at the front, it means it can only
be used in the channel. If it is /msg then it can be used in query, if there
is a '[<channel>]' after the command, it can also be used in the channel. If
the command is prefixed with a '.' then it is to be used in the partyline.

### 8ball:    - +8ball <question>
  - Just like a Magic 8ball

### Access:   - /msg botnick access [<channel>] [<wildcard match> <-online> <-userhost> <-lm> <-ls> <-host match> <-min level> <-max level>]
            - .access <#channel> [<wildcard match> <-online> <-userhost> <-lm> <-ls> <-host match> <-min level> <-max level>]
    * -online -> Displays if the user is online or offline
    * -userhost -> Displays a users userhost (identd@domain.com)
    * -lm -> Displays who last modified the user, and when it happened
    * -ls -> Displays when the user was last seen
    * -host <match> -> Matches the 'match' against the users userhost (identd@domain.com)
    * -min <level> -> Displays only users who have access above and equal to 'level'
    * -max <level> -> Displays only users who have access below and equal to 'level'
  - The access list of a channel database
  * The access command also shows if a user is suspended or not, with all information associated

### Addme:    - /msg botnick addme <password> <channel>
  - Add yourself to a channel (needed at startup)
  * The password in this is the 'set(adminpass)' you set in the configuration file

### Adduser:  - /msg botnick adduser [<channel>] <nickname> [<level> <-userhost host> <-aop on/off> <-aov 1/0> <-protect yes/on>
    * -userhost <host> -> Sets/adds this host as the users if they havent been added it sets as their only
    * -aop <..> -> Sets the AOP for the user on/off (1, on, yes = On || 0, off, no = Off)
    * -aov <..> -> Sets the AOV for the user on/off (1, on, yes = On || 0, off, no = Off)
    * -protect <..> -> Sets the Protect for the user on/off (1, on, yes = On || 0, off, no = Off)
  - Adds a user to the channel database
  * Unlike AustNet Services, the AOP/AOV/Protect doesnt change depending on the value, it is set default to your 'set(autoadd)' in the configuration

### Auth:     - /msg botnick auth <password>
            - /msg botnick id <password>
            - /msg botnick identify <password>
           -- SOCKET:
            - /botcommand <your handle> <your password> [<extra commands>]
            - ./botcommand <your nickname> <you handle> <your password>
  - Authenticate to the bot
  * All three of these commands are exactly the same

### Deauth:   - /msg botnick deauth <password>
            - /msg botnick unid <password>
            - /msg botnick unidentify <password>
  - Deauthenticate to the bot
  * All three of these commands are exactly the same

### Ban:      - /msg botnick ban [<channel>] <nickname/banmask> [<-noexpire> <-nokick> <-kickall> <-sticky> <-level level> <-banmask u|h|nu|uh|nh|nuh> <-days N> <-hours N> <-mins N> <-quick option>]
    * -noexpire -> Sets the ban to never expire
    * -nokick -> Doesnt kick the nickname if you specify one
    * -kickall -> Kicks all nicknames matching the banmask
    * -sticky -> Creates a 'sticky ban', it wont be removed from the channel until it expires
    * -level <level> -> Sets the ban so 'level' and higher levels can remove it, good for 200+ owners
    * -banmask <u|h|nu|uh|nh|nuh> -> Sets the banmask to whichever you specify (n = nickname, u = user [identd], h = host [domain])
    * -days <n> -> Sets the ban to expire in 'n' days
    * -hours <n> -> Sets the ban to expire in 'n' hours
    * -mins <n> -> Sets the ban to expire in 'n' minutes
    * -quick <option> -> Chooses an option from the quickban file
  - Bans a user or host in the channel you do it in
  * The -days|-hours|-mins can be used together and will add up to the appropriate value

### Clean:    - /msg botnick clean [<channel>]
  - Cleans the channel modes from the channel, and sets the modelock modes back if you are under the required access level

### Clist:    - /msg botnick clist <nickname> [<send to nickname>]
  - Sends a nickname a Channel List (a list of all the channels they have access in), 'send to nickname' is the nickname you send to, it will send to you if you dont specify
  * This command can only be used by 'special users'

### Commands: - /msg botnick commands [<channel>]
  - Lets you check what commands you can use in the channel

### Comset:   - /msg botnick comset [<channel>] <command> <value>
    * All of the 'command's used in here are the actual commands on the bot (most of the ones listed in this section)
  - Changes the channel command level, to disable specific level'd users to do specific commands (eg. set the op command to level 190, instead of 100)

### Del:      - /msg botnick del <all|new|old|n[,n,n,n]>
    * all -> Deletes all notes currently in your notebox
    * new -> Deletes all unread notes currently in your notebox
    * old -> Deletes all read notes currently in your notebox
  - Deletes messages stored by the note/memo service

### Delme:    - /msg botnick delme [<channel>]
  - Deletes your own access in a channel

### Deluser:  - /msg botnick deluser [<channel>] <nick1> [<nick2> <nick3> ..]
  - Deletes one or more users access in the channel

### Deop:     - /msg botnick deop [<channel>] [<nick1> <nick2> <nick3> ..]
  - Deops you or another user in the channel
  * If you dont specify anything after 'deop' it will deop you

### Devoice:  - /msg botnick devoice [<channel>] [<nick1> <nick2> <nick3> ...]
  - Devoices you or another user in the channel
  * If you dont specify anything after 'devoice' it will devoice you

### Fun:      - +fun <cleanoffice|milk|milo|squish|lamebot|opers|coffee|time|bonk|lix|moo|chocolate|icecream|droolz|shagz|d0nk|slobbers|bash> [<nickname>]
  - Just a small joke, try out the different options (cleanoffice, milk, milo etc.) to see what they do :)

### Info:     - /msg botnick info <nickname/channel>
  - Get the information of a 'ChanOP' channel or nickname that is on the Services TCL
  * Unlike other commands this can be used in the channel or query

### Invite:   - /msg botnick invite <channel>
  - Invites you to a channel, you cannot use this to invite others

### Kick:     - /msg botnick kick [<channel>] <nickname> [<message>]
  - Kicks a user the channel, with a message

### List:     - /msg botnick list <new|old|all[null]>
    * new -> Lists all unread notes currently in your notebox
    * old -> Lists all read notes currently in your notebox
    * all -> Lists all notes currently in your notebox
  - Lists the note/memos received by others using the Send command
  * If you don't specify an option, it will assume 'all' was chosen

### Listban:  - /msg botnick listban [<channel>] [<wildcard match> <-whoset> <-whenset> <-lastactive> <-reason> <-min N> <-max N>]
            - .listban <channel> [<wildcard match> <-whoset> <-whenset> <-lastactive> <-reason> <-min N> <-max N>]
    * -whoset     -> Displays who set the ban
    * -whenset    -> Displays when the ban was set
    * -lastactive -> Displays when the ban was last activated (this isnt very accurate..)
    * -reason     -> Displays the reason why the banmask was banned
    * -min <n>    -> Only displays bans that were set by someone with access over and the same as 'n'
    * -max <n>    -> Only displays bans that were set by someone with access under and the same as 'n'
  - Shows the list of bans current in the settings of the script for that channel
  * If the banlist user has been deleted the reasons may be wrong

### Mdeop:    - /msg botnick mdeop [<channel>]
  - Deops everyone in the channel apart from itself

### Mdevoice: - /msg botnick mdevoice [<channel>]
  - Devoices everyone in the channel

### Mimic:    - +mimic <nickname>
  - Says a silly quote that mimics the nickname
  * This command will mimic anyone who is listed in the set(mimic.file) file

### Op:       - /msg botnick op [<channel>] [<nick1> <nick2> <nick3> ...]
  - Ops you or another user in the channel
  * If you dont specify anything after 'op' it will op you

### Purge:    - /msg botnick purge
  - Purge's your note/memo messages to remove them completely from the bot, unretrievable

### Read:     - /msg botnick read <new|all|N[n,n,n]>
    * new -> Reads all unread notes currently in your notebox
    * all -> Reads all notes currently in your notebox
  - Reads note/memos sent to you by others using the Send command

### Resetdb:  - /msg botnick resetdb [<channel>] [<level>]
  - Resets the channel user database, if you specify a level it will only delete below that
  * Be careful with this, you could remove yourself :P

### Seek:     - /msg botnick seek [<channel>] [<-online>] <message>
    * -online -> Sends a list of people who are online in the channel to you without letting others know
  - Sends a message to everyone who is online in the channel saying the 'message'
  * If the 'nonote' is higher then your access in the channel, this wont send any messages to others

### Send:     - /msg botnick send <nick/chan[,nick/chan]> [-min N] [-max N] <message>
    * -min N -> Sends note to all users in the channel(s) with an access level above/including 'N'
    * -max N -> Sends note to all users in the channel(s) with an access level below/including 'N'
  - Sends a note/memo to the nick/chan you selected.

### Set:      - /msg botnick set [<channel>] <keeptopic|mode|nonote|oprestrict|restrict|mustid|tellpeak|tellset|telladd|telldel|nochanmsg|funmsg|url|log|owner|address> <newvalue>
    * keeptopic  -> The topic lock level
    * mode       -> The modelock feature (this is used like; set mode <level> <-mo+de-s>)
    * nonote     -> Restrict channel notes (Memo's, seeks)
    * oprestrict -> Restrict the people who are opd (this is used like; set oprestrict <level>) -- I have kept on/off in there for people who dont read this
    * restrict   -> Restrict the people who join the channel
    * mustid     -> When the bot is opd it will auto-auth (kinda) people who are op'd, deop'd in the channel (security relies on the same as the normal auth features)
    * tellpeak   -> Message the channel when the peak breaks
    * tellset    -> Notifies the owner(s) when someone uses set
    * telladd    -> Notifies the owner(s) when someone uses adduser
    * telldel    -> Notifies the owner(s) when someone uses deluser
    * tellsetu   -> Notifies the owner(s) when someone uses setuser
    * nochanmsg  -> Makes the channel users have to use /msg commands instead of +commands
    * funmsg     -> Turns fun messages on (similar to ChanOP on AustNet but turns +8ball, +fun and +mimic on)
    * url        -> Changes the channel URL
    * log        -> Only 200+ accessed users can use this, it sets the report log on and off
    * owner      -> Sets the channel owner(s) (seperate each by a space)
    * address    -> Sets the channel address (shown in info)
    * quota      -> Sets the quota on the channel (set to '0' for unlimited)
    * banquota   -> Sets the ban quota on the channel (set to '0' for unlimited)
  - Change the main settings of each individual channel
  * In the next version of Services all of these settings will be working, and more *should* be added

### Setfile:  - .setfile <8ball|mimic|topics|quickban> <add|del|list> [<nickname|acronym> <new setting>]
    * 8ball    -> Changes option in the $set(8ball.file) file, can only add/list
    * mimic    -> Changes option in the $set(mimic.file) file
    * topics   -> Changes option in the $set(topics.file) file, can only add/list
    * quickban -> Changes optoin in the $set(quickban.file) file
  - Manages the 8ball, topics, quickban and mimic files by adding, deleting and listing options.

### Setinfo:  - .setinfo <variable> <new setting>
  - Changes your $set(variable) variables from within the bot
  * Only bot owner can use this, and do so with extreme care

### Mainchan: - .mainchan <add|del|set|combine> <channel> [<option>]
    * add     -> Adds a mainchan to the bot and joins the channel
    * del     -> Removes a mainchan from the bot and parts the channel
    * set     -> Set <yes/on/1> makes the channel usable. Set <no/off/0> makes the channel unusable
    * combine -> Changes 'channel' into 'option' and moves access list, 'option' access list over-rules 'channel'
  - Toggles with the main channels and settings on the bot
  * Deleting a channel destroys the access list completely

### Homechan: - .homechan <channel>
  - Sets the homechan to 'channel'

### Setme:    - /msg botnick setme <email|pass|url|asl|usemsg|autoid|aov|aop|showemail|noteonadd|noteondel|noteonset|tellbyemail> <new value>
    * email       -> The email the bot sends emails to for settings lower, and to let others know it
    * pass        -> Your password, used for authentication
    * url         -> Your website URL, or anything else you want to put in here
    * asl         -> Your Age, Sex, Location. Someone just suggested I put it in :/
    * usemsg      -> Use PRIVMSG Interface as apposed to NOTICE Interface for messages
    * autoid      -> Auto Identify when you join a channel that hasn't got MustID set on it (not working yet)
    * aov         -> AutoVoice yourself in a channel without identifying on channels without MustID set on
    * aop         -> AutoOP yourself in a channel without identifying on channels without MustID set on
    * showemail   -> Show your email address when someone does '/msg botnick info' on you
    * noteonadd   -> Sends you a note (with built in note system) when you are added to a channel (not working yet)
    * noteondel   -> Sends you a note (with built in note system) when you are removed from a channel (not working yet)
    * noteonset   -> Sends you a note (with built in note system) when your access has changed, or you are suspended on a channel (not working yet)
    * tellbyemail -> Instead of sending notes (noteonadd, noteondel, noteonset, tellset, telladd etc.) via the note system, it will send an email every 24hrs containing all notes

### Setuser:  - /msg botnick setuser [<channel>] <nickname> <level|aop|aov|protect|suspend|nickname> <new value>
  - Changes the settings of a user (nickname is the nickname in ALL channels)
  * You must have more access then the user you are settings unless you are 'special'

### Topic:    - /msg botnick topic [<channel>] [<topic>]
  - Changes the topic in the channel to whatever you want

### Unban:    - /msg botnick unban [<channel>] <nickname|hostname|all|perms|sticky|me>
    * all -> Unbans all bans in the channel that arent sticky/perminant
    * perms -> Unbans all bans in the channel that are perminant
    * sticky -> Unbans all bans in the channel that are sticky
    * me -> Unbans all bans in the channel that match your current address
  - Unbans addresses in the channel

### Voice:    - /msg botnick voice [<channel>] [<nick1> <nick2> <nick3> ..]
  - Voices you or another user in the channel
  * If you dont specify anything after 'voice' it will voice you

--

If there is anything not in this list, or file that should be please tell me about
it ASAP so I can update. Also if there's any problems, email or drop by the channel.

- damian [2003]
