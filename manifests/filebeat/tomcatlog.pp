class beats::filebeat::tomcatlog(
                                  $paths          = [ '/opt/tomcat-8080/logs/catalina.out' ],
                                  $scan_frequency = '10s',
                                  $log_pattern    = '^[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2} [[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}',
                                ) inherits beats::filebeat {
  validate_array($paths)

  concat::fragment { 'filebeat tomcatlog config':
    target  => '/etc/filebeat/filebeat.yml',
    order   => '05',
    content => template("${module_name}/filebeat/filebeat_tomcat.erb"),
  }

}
