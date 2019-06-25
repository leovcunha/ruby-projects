require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}

    hash.each do |room, capacity|
        @rooms[room] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    return true if @rooms.include?(room)
    false
  end

  def check_in(person, room)
    if room_exists?(room)
      if @rooms[room].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each { |name, room| puts "#{name} : #{room.available_space}"}
  end
end