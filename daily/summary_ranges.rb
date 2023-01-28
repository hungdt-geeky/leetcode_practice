class SummaryRanges
  def initialize()
    @list = []
  end

=begin
    :type value: Integer
    :rtype: Void
=end
  def add_num(value)
    position = find_insert_position(value)
    @list.insert(position, value)
  end

=begin
    :rtype: Integer[][]
=end
  def get_intervals()
    result = []
    last_elem = @list.first
    current_range = [last_elem]
    @list.each do |elem|
      if elem - last_elem <= 1
        current_range << elem
      else
        result << [current_range.first, current_range.last]

        current_range = [elem]
      end

      last_elem = elem
    end

    result << [current_range.first, current_range.last]

    result
  end

  def find_insert_position(value)
    @list.bsearch_index { |x| x >= value } || @list.size
  end
end
