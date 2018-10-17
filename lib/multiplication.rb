class Multiplication
  FIRST_TEN_PRIME_NUMBERS = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29].freeze

  def initialize(table_size)
    @table_size = table_size
    @matrix = valid? ? build_matrix : FIRST_TEN_PRIME_NUMBERS
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
    []
  end
end
