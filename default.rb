gem_group :development, :test do
  gem "standard"
end

gem "authentication-zero"

if YAML.load_file("config/database.yml", aliases: true).dig("test", "adapter") == "sqlite3"
  gem "litestack"
end

after_bundle do
  generate "litestack:install"
  generate "authentication"
  run "bundle install --quiet"
  rails_command "db:migrate"

  run "bundle exec standardrb --fix", abort_on_failure: false

  git :init
  git add: "."
  random_fun_emoji = %w[🌟 🧙‍♂️ 🍀 🔮 🏆 🌈 🛡️ 🧭 🦄 🌠 🎭 🧚 🏰 🗝️ 💫].sample
  commit_message = ENV.fetch("COMMIT_MESSAGE", "Blessings on your Rails Quest! #{random_fun_emoji}")
  git commit: "-a -m '#{commit_message}'"
end
