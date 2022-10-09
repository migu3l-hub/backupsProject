#!/usr/bin/expect -f

set usuario [lindex $argv 0]
set password [lindex $argv 1]
set dominio [lindex $argv 2]
set archivo [lindex $argv 3]


spawn ./scp.sh $usuario $dominio $archivo
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
  -re ".*sword.*" {
    exp_send "$password\r"
  }
}
interact