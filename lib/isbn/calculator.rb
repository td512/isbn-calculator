module ISBN
  module Calculator
    WEIGHT = 131313131313.freeze

    def self.calculate(isbn)
      isbn = (isbn.is_a? Integer) ? isbn : isbn.gsub('-', '').to_i
      return false if ! isbn || ! isbn.to_s.chars.count == 12
      checksum = self.weighted_calc(isbn, WEIGHT) % 10
      checksum = checksum.zero? ? checksum : 10 - checksum

      return checksum
    end

    def self.weighted_calc(number, weight)
			checksum = 0

			# if we have 0 after dividing by 10 there is nothing else to do.
			while number > 0
				checksum += (number % 10) * (weight % 10)

				# discard the digits we've summed up already
				number = number / 10
				weight = weight / 10
			end

			return checksum 
    end
  end
end