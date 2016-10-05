; botcommand.mrc,v 0.2 [Sat Aug 04 16:43:26 2001] by 'Cyborg-'
; This file is to use socket commands with the 'Services TCL' created
; by me (Cyborg-), it can be found at http://www.testikles.org in the
; 'Testikles`' section.
; The botcommand feature was derived from 'Mp3Songs Secuirt Scripts'
; by Conqueror (the script that runs DVD in #Mp3Songs on irc.austnet.org)
; His idea was to make authentication to a bot more secure, I took it
; one step further and added the listban and access commands to it to make
; the process run faster then the help queue built into eggdrop.
; This script is very simple to use, all you need to do is change the two
; '""'s below (4th line of the alias) to your ip/hostname and port, eg;
; -> sockopen botcommand blueelf.testikles.org 55543
; it's as simple as that, to run the command use it like this;
; -> /botcommand <handle> <password> [<command>]
; eg, to auth -> /botcommand Cyborg- 595823qluwnnr
; eg, to listban -> /botcommand Cyborg- 595823qluwnnr listban #Warez * -reason
; eg, to access -> /botcommand Cyborg- 595823qluwnnr access #Warez * -lm
; Everything that is recieved from the bot will be put into the window '@botcommand'
; not come up in the active window (stops floods where you dont want it..)
; Have fun with it, any bugs or anything report to me at email:damian@testikles.org

alias botcommand {
  if ($2 == $null) { echo -a * Usage: /botcommand <handle> <password> [<command>] | return }
  window @BOTCOMMAND
  if ($sock(botcommand,1) != $null) {
    echo @BOTCOMMAND * A connection is already open...
    return
  }
  echo @BOTCOMMAND Connecting to the bot specified.
  sockopen botcommand "" ""
  set %botcommand.info $me $1-
}
on *:SOCKOPEN:botcommand:{
  if ($sockerr > 0) { echo @BOTCOMMAND ERROR: Could not establish a connection. | unset %botcommand.* }
}
on *:SOCKCLOSE:botcommand:{
  unset %botcommand.*
}
on *:SOCKREAD:botcommand:{
  if ($sockerr > 0) { return }
  :next
  sockread -f %botcommand
  tokenize 32 %botcommand
  if ($sockbr == 0) { return }
  elseif ($1 == 001) {
    echo @BOTCOMMAND Sending authentication strings...
    sockwrite -n $sockname %botcommand.info
  }
  elseif ($1 == 002) {
    echo @BOTCOMMAND ERROR: $2-
  }
  else {
    if ($3 == NickName) && ($4 == Level) && ($5 == AOP) && ($6 == AOV) && ($strip($7) == Prot) { echo @BOTCOMMAND       NickName          Level  AOP   AOV   Prot }
    elseif ($strip($1) isnum) && ($4 isnum) && ($len($5) <= 3) && ($len($6) <= 3) && ($len($7) <= 3) { echo @BOTCOMMAND $1 $str( ,$calc(5 - $len($1)))  $+ $3 $str( ,$calc(16 - $len($3))) $4 $str( ,$calc(5 - $len($4))) $5 $str( ,$calc(4 - $len($5))) $6 $str( ,$calc(4 - $len($6))) $7 $str( ,$calc(4 - $len($7))) $8- }
    elseif ($1 == LS) { echo @BOTCOMMAND   LS   $+ $2- }
    elseif ($1 == LM) { echo @BOTCOMMAND   LM   $+ $2- }
    elseif ($strip($1) isnum) && ($4 isnum) && ($5 != $null) { echo @BOTCOMMAND $1 $str( ,$calc(5 - $len($1)))  $+ $3 $str( ,$calc(34 - $len($3))) $4 $str( ,$calc(4 - $len($4))) $5- }
    elseif (($3 == Ban) && ($4 == mask) && ($5 == Level) && ($6 == Expires)) { echo @BOTCOMMAND       Ban mask                            Level Expires }
    elseif (($1 == SETBY) || ($1 == SETON)) { echo @BOTCOMMAND   $+ $1 $2- }
    else { echo @BOTCOMMAND $1- }
  }
  goto next
}
