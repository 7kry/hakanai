require 'fileutils'

dir = File.absolute_path(File.dirname(File.dirname(__FILE__)))
working_directory dir

sockdir = File.join(dir, 'tmp', 'sockets')
FileUtils.mkdir_p sockdir
listen File.join(sockdir, 'unicorn.sock')
