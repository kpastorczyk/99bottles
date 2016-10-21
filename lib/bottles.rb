class Verse
  VERSE = "%s of beer on the wall, %s of beer.\nTake %s down and pass it around, %s of beer on the wall.\n"
  EMPTY_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

  def initialize(number)
    @number = number
  end

  def to_s
    if @number > 0
      VERSE % [bottle_from(@number), bottle_from(@number), take_from(@number), bottle_from(@number-1)]
    else
      EMPTY_VERSE
    end
  end

  private

  def bottle_from(number)
    if number > 1
      "#{number} bottles"
    elsif number == 1
      "1 bottle"
    else
      "no more bottles"
    end
  end

  def take_from(number)
    if number > 1
      "one"
    else
      "it"
    end
  end
end

class Bottles
  def verse(number)
    Verse.new(number).to_s
  end

  def verses(from, to)
    range = to..from
    verses = range.map { |number| Verse.new(number) }.reverse
    verses.map(&:to_s).join("\n")
  end

  def song
    verses(99, 0)
  end
end