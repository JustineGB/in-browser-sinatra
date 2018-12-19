require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride  #this is telling the app to use the Sinatra middleware (use Put, Patch, or Delete)
use UsersController
use WinesController

run ApplicationController
