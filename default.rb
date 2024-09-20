gem_group :development do
  # Linting/formatting
  gem "standard"
  gem "rails_best_practices"

  # Generate a diagram of all the models in the app by running:
  # bundle exec erd
  gem "rails-erd"
end

# Auth
gem "authentication-zero"

# Performance
gem "rack-mini-profiler"
gem "flamegraph"
gem "stackprof"
gem "memory_profiler"

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
