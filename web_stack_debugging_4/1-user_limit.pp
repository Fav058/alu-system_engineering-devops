exec { 'raise-holberton-nofile-limit':
  command => "sed -i -e 's/holberton hard nofile 5/holberton hard nofile 65536/' -e 's/holberton soft nofile 4/holberton soft nofile 65536/' /etc/security/limits.conf",
  unless  => "grep -q 'holberton hard nofile 65536' /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin'],
}
