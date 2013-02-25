#!/usr/bin/env rake

namespace :app do  
	
  desc "Creating the rails project directory"
  task :setup => ".template.rb" do 
    sh "rails new task_manager -m '.template.rb' "
  end	


  desc "Generate the template for the script"
  file ".template.rb" do |f|
    sh "
    echo \"
      gem_group :assets do
        gem('bootstrap-sass', :version => '~> 2.2.2.0')
      end
    \" > '.template.rb'
    "
  end
end

task :default => "app:setup"
