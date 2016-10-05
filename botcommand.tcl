
#!/bin/sh
# botcommand,v 0.2 [Sat Aug 04 16:43:26 2001] by 'Cyborg-'
# This file is to use socket commands with the 'Services TCL' created
# by me (Cyborg-), it can be found at http://www.testikles.org in the
# 'Testikles`' section.
# The botcommand feature was derived from 'Mp3Songs Secuirt Scripts'
# by Conqueror (the script that runs DVD in #Mp3Songs on irc.austnet.org)
# His idea was to make authentication to a bot more secure, with the bot
# TCL I took this one step further and added the listban and access
# commands to it to make the process run faster then the help queue buils
# into eggdrop, unfortunately I haven't worked out how to make the nix
# version of this botcommand file to make it work properly yet.
#-
# This script is very simple to use, all you need to do is change the two
# '""'s below to your ip/hostname and port, eg;
# -> set bcom(hostname) blueelf.testikles.org
# -> set bcom(port) 55543
# it's as simple as that, to run the command use it like this;
# -> /botcommand <handle> <password>
# eg, to auth -> /botcommand Cyborg- 595823qluwnnr
# Have fun with it, any bugs or anything report to me at email:damian@testikles.org

# Thanks for this file go to ]-[unter on AustNet (irc.austnet.org) for supplying me
# with the basis I needed to connect to a socket in *proper* TCL. If it wasn't for
# his knowledge all you nix users wouldnt be able to authenticate!

#\
exec tclsh8.0 "$0" {"$@"}

set bcom(hostname) ""
set bcom(port) ""

proc connect {getdata} {
  global bcom closed
  if {[catch {socket $bcom(hostname) $bcom(port)} sock]} {
    puts stderr "ERROR: Could not establish a connection."
    return
  }
  fconfigure $sock -buffering none -blocking 0
  fconfigure stdout -buffering none
  fileevent $sock readable [list fromServer $sock $getdata]
  fileevent stdin readable [list toServer $sock]
  vwait closed($sock)
  unset closed($sock)
}

proc initEvents {sock} {
  puts -nonewline [read $sock 4096]
  fileevent $sock readable [list fromServer $sock]
  fileevent stdin readable [list toServer $sock]
}

proc fromServer {sock getdata} {
  set data .
  while {[string length $data]} {
    set data [read $sock 4096]
    if {[eof $sock]} {
      disconnect $sock
      return
    }
    if {[string length $data]} {
      if {[lindex $data 0] == "001"} {
        puts $sock $getdata
        puts stdout "Sending authentication strings..."
      } elseif {[lindex $data 0] == "002"} {
        puts stderr "ERROR: [lrange $data 1 end]"
      } else {
        puts stdout $data
      }
    }
  }
}

proc disconnect {sock} {
  global closed
  close $sock
  set closed($sock) 1
}
puts stdout $argv
if {[llength $argv] < 3} {
  puts stderr "* Usage: ./botcommand <nickname> <handle> <password>"
} else {
  puts stdout "Connecting to $bcom(hostname):$bcom(port)..."
  eval connect {"[lrange $argv 0 3] #[lrange $argv 4 end]"}
}

exit