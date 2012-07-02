desc "deploy code"
task :deploy do
  if system("git diff --exit-code")
    `git push heroku -f; growlnotify -m 'deployment complete'; say 'deployment complete'`
  else
    puts "Git not clean. Aborting."
    `growlnotify -m 'deployment failed'; say 'deployment failed'`
  end
end
