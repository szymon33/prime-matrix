
class Multiplication
  def initialize(table_size)
    @table_size = table_size
    if valid?
      @vector = vector
      build_matrix
    else
      @table_size = 10
      @matrix = vector
    end
  end

  private

  def prime?(num)
    return if num <= 1

    (2..Math.sqrt(num)).each do |i|
      return false if (num % i).zero?
    end
  end

  def valid?
    @table_size&.class == Fixnum
  end

  def build_matrix
    # address 0,0 is special and is always nil
    @matrix = Array.new(@table_size + 1) { Array.new(@table_size + 1) }
    setup_coordinates
    @vector.each_with_index do |col_val, col|
      @vector.each_with_index do |row_val, row|
        @matrix[col + 1][row + 1] = col_val * row_val
      end
    end
    @matrix
  end

  # vector of prime numbers size of table_size
  def vector
    result = []
    next_candiate = 2
    while result.size < @table_size
      (result << next_candiate) if prime?(next_candiate)
      next_candiate += 1
    end
    result
  end

  def setup_coordinates
    @matrix[0] = [nil] + @vector
    @matrix[0].each_with_index do |elem, idx|
      @matrix[idx][0] = elem
    end
  end
end
