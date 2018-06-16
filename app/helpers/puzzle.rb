class Puzzle < Prawn::Document
  def initialize(puzzle_name, words)
    font "Courier", :size => 24
    text puzzle_name, :align => :center
    font "Courier", :size => 10

    super()
    @puz = []
    @words = []
    (words.count * 3).times do
      @row = Array.new((words * 3).count) {'.'}
      @puz << @row
    end
    @direction = ['north', 'south', 'east', 'west', 'northwest', 'northeast', 'southwest', 'southeast']

    word_list = words.split("\n")

    word_list.each_with_index do |word, index|
      word_list[index] = word.chomp
      @words << word
    end
  end

  # def add_word(word)
  #   @words << word
  # end

  def encode
    row = 0
    while row < @puz.count
      col = 0
      while col < @puz[row].count
        if @puz[row][col] == '.'
          @puz[row][col] = ('A'..'Z').to_a.sample
        end
        col += 1
      end
      row += 1
    end
  end

  def in_bounds(row, col)
    in_bounds = false
    if (row) >= 0 && (row) < @puz.size && (col) >= 0 && (col) < @puz[0].size
      in_bounds = true
    end
    return in_bounds
  end

  def list_words
    word_list = ""
    @words.each_with_index do |word, index|
      word_list += "#{word}".ljust(30)
      if ((index + 1) % 3) == 0
        word_list += "\n"
      end
    end
    return word_list
  end

  def solve
    @words.sort_by {|word| word.length}.reverse.each do |word|
      placed = false
      while placed == false
        row = rand(@puz.size)
        col = rand(@puz.size)
        dir = rand(0...@direction.count)
        case dir
          when 0
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row - i][col] == '.' || @puz[row - i][col] == "#{word[i]}"
                  @puz[row - i][col] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 1
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row + i][col] == '.' || @puz[row + i][col] == "#{word[i]}"
                  @puz[row + i][col] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 2
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row][col + i] == '.' || @puz[row][col + i] == "#{word[i]}"
                  @puz[row][col + i] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 3
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row][col - i] == '.' || @puz[row][col - i] == "#{word[i]}"
                  @puz[row][col - i] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 4
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row - i][col - i] == '.' || @puz[row - i][col - i] == "#{word[i]}"
                  @puz[row - i][col - i] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 5
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row - i][col + i] == '.' || @puz[row - i][col + i] == "#{word[i]}"
                  @puz[row - i][col + i] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 6
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row + i][col - i] == '.' || @puz[row + i][col - i] == "#{word[i]}"
                  @puz[row + i][col - i] = word[i]
                end
                i += 1
              end
              placed = true
            end
          when 7
            if test_place(row, col, dir, word)
              i = 0
              while i < word.length
                if @puz[row + i][col + i] == '.' || @puz[row + i][col + i] == "#{word[i]}"
                  @puz[row + i][col + i] = word[i]
                end
                i += 1
              end
              placed = true
            end
        end
      end
    end
  end

  def test_place(row, col, dir, word)
    can_place = true
    row = row
    col = col
    dir = dir
    word = word
    if dir == 0
      i = 0
      while i < word.length
        if in_bounds(row - i, col) && (@puz[row - i][col] == '.' || @puz[row - i][col] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 1
      i = 0
      while i < word.length
        if in_bounds(row + i, col) && (@puz[row + i][col] == '.' || @puz[row + i][col] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 2
      i = 0
      while i < word.length
        if in_bounds(row, col + i) && (@puz[row][col + i] == '.' || @puz[row][col + i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 3
      i = 0
      while i < word.length
        if in_bounds(row, col - i) && (@puz[row][col - i] == '.' || @puz[row][col - i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 4
      i = 0
      while i < word.length
        if in_bounds(row - i, col - i) && (@puz[row - i][col - i] == '.' || @puz[row - i][col - i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 5
      i = 0
      while i < word.length
        if in_bounds(row - i, col + i) && (@puz[row - i][col + i] == '.' || @puz[row - i][col + i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 6
      i = 0
      while i < word.length
        if in_bounds(row + i, col - i) && (@puz[row + i][col - i] == '.' || @puz[row + i][col - i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    elsif dir == 7
      i = 0
      while i < word.length
        if in_bounds(row + i, col + i) && (@puz[row + i][col + i] == '.' || @puz[row + i][col + i] == "#{word[i]}")

        else
          can_place = false
        end
        i += 1
      end
    end
    return can_place
  end

  def to_s
    ret_str = ""
    @puz.each do |row|
      ret_str += row.join(" ") + "\n"
    end
    return ret_str
  end
end