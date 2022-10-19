class BaseView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print '> '
    return gets.chomp
  end
end
