namespace :devise do 
  desc 'generate devise views'
  task :views => :environment do
    system('rails generate devise:views')
  end

end