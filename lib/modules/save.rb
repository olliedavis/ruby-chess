module Save
  def save_game(save_name)
    self_json = {
      current_board: @chessboard.board,
      turn_counter: @turn_counter
    }.to_json
    open("../saves/#{save_name}.json", 'a') do |file|
      file.puts self_json
    end
  end

  def save_prompt
    puts 'Please enter a name for your save file'
    save_name = gets.chomp
    if unique_file_name?(save_name)
      save_game(save_name)
      puts 'Game saved succesfuly!'
      start_round
    else
      puts 'Save Failed - Name Already Exists'
      save_prompt
    end
  end

  def unique_file_name?(save_name)
    saves = Dir.entries('../saves/')
    return false if saves.any? { |save| save == "#{save_name}.json" }

    true
  end
end
