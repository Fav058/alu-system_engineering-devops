# Raise the holberton user's open-file limits so login commands can open files.
exec { 'raise-holberton-nofile-limit':
  command => '/bin/sed -i -e "s/^holberton hard nofile 5$/holberton hard nofile 65536/" -e "s/^holberton soft nofile 4$/holberton soft nofile 65536/" /etc/security/limits.conf',
  unless  => '/bin/grep -q "^holberton hard nofile 65536$" /etc/security/limits.conf && /bin/grep -q "^holberton soft nofile 65536$" /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
}
