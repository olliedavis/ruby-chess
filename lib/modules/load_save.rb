module LoadSave
  def load_file_prompt
    puts 'Which file is the name of your save?'
    retrieve_saves
    user_save = gets.chomp
    until File.exist?("../saves/#{user_save}.json")
      puts 'File not found, please try again'
      user_save = gets.chomp
    end
    JSON.parse(File.read("../saves/#{user_save}.json"))
  end

  def retrieve_saves
    saves = Dir.entries('../saves')
    saves.each do |save_file|
      puts File.basename(save_file, '.json') unless save_file =~ /^..?$/
    end
  end

  def load_game
    content = load_file_prompt
    @chessboard.board = content['current_board']
    @turn_counter = content['turn_counter']
    start_round
  end
end
