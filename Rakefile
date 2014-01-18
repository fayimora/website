def build
  system "middleman build"
end

def git_initialize(repository)
  if File.exist?(".git")
    system "git pull origin master"
  else
    system "git clone https://github.com/fayimora/#{repository} ."
  end
end

desc "Build the website"
task :build do
  build
end

desc "Serve the site in dev mode"
task :serve do
  system "middleman server"
end

desc "Deploy the site to github pages"
task :deploy do
  require "highline/import"
  message = ask("Provide a deployment message: ") do |q|
    q.validate = /\w/
    q.responses[:not_valid] = "Can't be empty."
  end

  mkdir("../fayimora.com")
  Dir.chdir("../fayimora.com") do
    git_initialize("fayimora.github.io")

    unless build
      puts "The build failed, stopping deploy. Please fix build errors before re-deploying."
      exit 1
    end

    # build task always removes the CNAME file. This re-creates it
    File.open("CNAME", 'w') do |f|
      f.write "fayimora.com"
    end

    system "git add -A"
    system "git commit -m '#{message.gsub("'", "\\'")}'"
    system "git push origin master"
  end
end
