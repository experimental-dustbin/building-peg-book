# REF : Variation 1
def parse(matcher, stream)
  index = 0
  for m in matcher
    if m === stream[index]
      index += 1
    else
      return [:fail, stream[0...index]]
    end
  end
  [stream[0..index]]
end
# ENDREF

# REF : Variation 2
def parse(matcher, stream)
  index = -1
  while (m = matcher[index += 1])
    next if m === stream[index]
    return [:fail, stream[0...index]]
  end
  [stream[0...index]]
end
# ENDREF

# REF : Variation 3
class Indexable

  attr_reader :current_position

  def initialize(input)
    @indexable, @current_position, @current_element = input, 0, input[0]
  end

  def advance!
    return nil unless old_element = @indexable[@current_position]
    @current_element = @indexable[@current_position += 1]
    old_element
  end

  def jump!(new_position)
    @current_position = new_position
  end

  def [](slice)
    @indexable[slice]
  end

end

##
# Remember that +@current_position+ points to the next element to be consumed by the
# matcher and the indexing, slicing should make sense.

def parse(matcher, indexable)
  index, start = -1, indexable.current_position
  while (m = matcher[index += 1])
    next if m === indexable.advance!
    return [:fail, indexable[start...indexable.current_position - 1]]
  end
  [indexable[start...indexable.current_position]]
end
# ENDREF

# REF : Variation 4
class BasicParser

  def initialize(matchers)
    @matchers = matchers
  end

  def parse(indexable)
    index, start = -1, indexable.current_position
    while (m = @matchers[index += 1])
      next if m === indexable.advance!
      return [:fail, indexable[start...indexable.current_position - 1]]
    end
    [indexable[start...indexable.current_position]]
  end

end
# ENDREF
