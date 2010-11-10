# These rake tasks were taken directly from stylesheet_by_browser plugin by
# Patrick Espake (mailto:patrickespake@gmail.com)

namespace :active_stylesheets do
  dest = "#{RAILS_ROOT}/public/stylesheets"
  source = "#{RAILS_ROOT}/vendor/plugins/active_stylesheets/public/stylesheets"
  
  desc "Install the active_stylesheets stylesheets into the public/stylesheets directory of this application."
  task :install do
    require 'fileutils'

    begin
      puts "Installing active_stylesheets to #{dest}..."
      FileUtils.cp_r "#{source}/.", dest
      puts "Successfully installed active_stylesheets."
    rescue
      puts "ERROR: Problem installing active_stylesheets. Please manually copy."
      puts "#{source}"
      puts "to"
      puts "#{dest}"
    end
  end

  desc "Uninstall the active_stylesheets stylesheets into the public/stylesheets directory of this application."
  task :uninstall do
    require 'fileutils'

    begin
      puts "Uninstalling active_stylesheets to #{dest}..."
      
      Dir.foreach(source) do |entry|
        if entry != "." and entry != ".."
          file = "#{dest}/#{entry}"
          
          if File.exists?(file)
            begin
              FileUtils.rm "#{dest}/#{entry}"
              puts "#{file} file removed..."
            rescue
              puts "ERROR: Problem removing file: #{file}. Please manually remove."
            end
          end
        end
      end

      puts "Successfully uninstalled active_stylesheets."
    rescue
      puts "ERROR: Problem uninstalling active_stylesheets. Please manually remove stylesheets files into the public/stylesheets directory of this application."
    end
  end
end