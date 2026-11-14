# Fix the invalid .phpp extension in WordPress's settings file.
# The typo makes PHP include a nonexistent file and Apache return HTTP 500.
exec { 'fix-wordpress-php-extension':
  command => "/bin/sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  path    => ['/bin', '/usr/bin'],
  onlyif  => "/bin/grep -q 'phpp' /var/www/html/wp-settings.php",
}
