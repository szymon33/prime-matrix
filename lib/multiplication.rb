class Multiplication
  private

  def prime?(num)
    return if num <= 1

    (2..Math.sqrt(num)).each do |i|
      return false if (num % i).zero?
    end
  end
end
