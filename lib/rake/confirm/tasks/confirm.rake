task :confirm do
  display "WARNING: Destructive Action. To proceed, type \"#{Rails.root.basename}\""
  display "> ", false

  abort if ask.downcase != Rails.root.basename.to_s
end

# https://github.com/heroku/heroku/blob/master/lib/heroku/helpers.rb
def ask
  $stdin.gets.to_s.strip
end

def display(msg = "", new_line = true)
  if new_line
    puts(msg)
  else
    print(msg)
    $stdout.flush
  end
end
