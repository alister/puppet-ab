# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard 'puppet-lint' do
  watch(/(.*).pp/) {|m| `echo #{m[0]}; \
	puppet-lint #{m[0]} --no-80chars-check --with-filename` }
end
