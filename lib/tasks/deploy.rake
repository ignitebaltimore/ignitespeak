desc "deploy code"
task :deploy do
  if system("git diff --exit-code")
     `git push heroku production:master -f; say 'deployment complete'`
  else
    puts "Git not clean. Aborting."
    `say 'deployment failed'`
  end
end
