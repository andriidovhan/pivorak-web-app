SimpleCov.profiles.define 'pivorak_cov' do
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
  add_group 'Services', 'app/services'
  add_group 'Interactors', 'app/interactors'
  add_group 'Policies', 'app/policies'
end

SimpleCov.start 'pivorak_cov'
