require_relative 'scraper'
require 'csv'
# TODO: you can build your christmas list program here!

file_path = 'gifts.csv'

gift_list = {}

def parse_csv(path, list)
  CSV.foreach(path, col_sep: ',', quote_char: '"', headers: :first_row) do |row|
    bool = row["bought"] == "true"
    list[row["name"]] = bool
  end
end

def save_csv(gift_list, path)
  CSV.open(path, 'wb', col_sep: ',', force_quotes: true, quote_char: '"') do |csv|
    # We had headers to the CSV
    csv << ['name', 'bought']
    gift_list.each { |gift, bought| csv << [gift, bought] }
  end
end

def show_list(gift_list, is_scraper)
  gift_list.each_with_index do |(gift, bought), index|
    to_do = bought == true ? "x" : " "
    if is_scraper
      puts "#{index + 1} - #{to_do} #{gift}"
    else
      puts "#{index + 1} - [#{to_do}] #{gift}"
    end
  end
end

puts "Welcome to your Christmas gift list"
action = nil

parse_csv(file_path, gift_list)

until action == 'quit'
  puts "Which action [list|add|idea|delete|mark|quit]"
  action = gets.chomp

  case action
  when "list" then show_list(gift_list, false)
  when "add"
    puts "What do you want to add?"
    new_gift = gets.chomp
    gift_list[new_gift] = false
    save_csv(gift_list, file_path)
  when "delete"
    show_list(gift_list, false)
    puts "Which gift do you want to delete?"
    delete_item = gets.chomp.to_i - 1

    gift = gift_list.keys
    deleted_key = gift[delete_item]
    gift_list.delete(deleted_key)
    puts "#{deleted_gift} has been deleted from the list."
    save_csv(gift_list, file_path)
  when "mark"
    show_list(gift_list, false)
    puts "Which item have you bought (give the index)?"
    mark_gift = gets.chomp.to_i - 1

    gift = gift_list.keys
    marked_key = gift[mark_gift]
    puts "#{marked_key} has been marked from the list."
    gift_list[marked_key] = !gift_list[marked_key]
    save_csv(gift_list, file_path)
  when "idea"
    puts "What are you looking for on Etsy?"
    idea = gets.chomp

    puts "Here are Etsy results for #{idea}"
    show_list(scraper(idea), true)

    puts "Pick one to add to your list (give the number)"
    selected_idea = gets.chomp.to_i - 1
    gift_idea = scraper(idea).keys
    chosen_idea = gift_idea[selected_idea]
    puts "#{chosen_idea} has been added to your wishlist."
    gift_list[chosen_idea] = false
    save_csv(gift_list, file_path)
  when "quit"
    puts "See you!"
  else
    puts "Wrong input"
  end
end
