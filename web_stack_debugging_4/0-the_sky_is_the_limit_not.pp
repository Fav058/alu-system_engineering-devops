# Raise Nginx file-descriptor and connection limits to handle concurrent requests.
exec { 'increase-nginx-worker-connections':
  command => '/bin/sed -i "s/worker_connections [0-9][0-9]*;/worker_connections 4096;/" /etc/nginx/nginx.conf',
  unless  => '/bin/grep -q "worker_connections 4096;" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

exec { 'increase-nginx-file-descriptor-limit':
  command => '/bin/sed -i "/^worker_processes/a worker_rlimit_nofile 65535;" /etc/nginx/nginx.conf',
  unless  => '/bin/grep -q "^worker_rlimit_nofile 65535;" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
