# Set a high open-file limit for the holberton user at login.
file { '/etc/security/limits.d/99-holberton-nofile.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "# Raise holberton's per-user open-file limit.\nholberton soft nofile 65536\nholberton hard nofile 65536\n",
}
