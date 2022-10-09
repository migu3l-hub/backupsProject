#!/usr/bin/expect -f

set usuario [lindex $argv 0]
set dominio [lindex $argv 1]
set archivo [lindex $argv 2]

echo $usuario >> $log
echo $domino >> $log
echo $archivo >> $log

spawn bash -c "scp $archivo $usuario@$dominio:/home/$usuario"
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
  -re ".*sword.*" {
    exp_send "Manchas123\r"
  }
}
interact