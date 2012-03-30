# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'shell' do
  watch(/(.*).pp$/) {|m| `echo #{m[0]}; puppet-lint #{m[0]} --no-80chars-check --with-filename` }
end

