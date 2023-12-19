class Day05
  def self.decode_row(ticket_part_row)
    decode_part(127,'F', ticket_part_row)
  end

  def self.decode_column(ticket_part_column)
    decode_part(8,'L', ticket_part_column)
  end

  def self.decode_part(limit, identifier, ticket_part)
    rows = (0..limit).to_a
    ticket_part.each do |letter|
      rows_parts = rows.each_slice((rows.length/2)).to_a
      rows = letter == identifier ? rows_parts[0] : rows_parts[1]

      return rows[0] if rows.length == 1
    end
  end

  def self.decode_seat(ticket)
    letter_row, letter_column = ticket.chars.each_slice(7).to_a

    decode_row(letter_row) * 8 + decode_column(letter_column)
  end

  def self.find_highest_seat(subject)
    subject.inject(0) { |highest_seat, ticket| [decode_seat(ticket), highest_seat].max }
  end

  def self.find_my_seat(subject)
    seats = (decode_seat("FFFFFFFLLL")..decode_seat("BBBBBBBRRR")).to_a
    occupied_seats = subject.inject([]) { |list, ticket| list << decode_seat(ticket) }

    (seats - occupied_seats).select { |seat| occupied_seats.include?(seat+1) && occupied_seats.include?(seat-1) }.first
  end

  def self.read_file
    return File.read('subject/day_05.txt').split("\n")
  end
end

# puts Day05.find_highest_seat(Day05.read_file)
p Day05.find_my_seat(Day05.read_file)