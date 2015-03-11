require 'pathname'
require Pathname.new(__dir__) + 'integer_to_english/version'

module IntegerToEnglish

  # @params [Symbol] format
  def to_english(format = :gb)
    Converter.new.to_text self, format
  end

  class Converter

    def initialize
      @singles   = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      @tens      = ['', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      @ten_frags = ['', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
      @scale     = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion'] # can be extended further
    end

    # Version can be :gb or :uk for British or :us for USA
    # "and" word will be used accordingly
    #
    # @param number [String|Integer]
    # @param version [Symbol]
    # @return [String]
    def to_text(number, version = :gb)
      unless number.is_a?(String) || number.is_a?(Integer)
        raise ArgumentError.new 'Only Integer or String (that converts to integer) can be parsed'
      end

      version = version.to_sym if version.is_a? String
      unless [:uk, :gb, :us].include? version
        raise ArgumentError.new 'Only :uk, :gb or :us versions can be generated'
      end

      number = number.to_s if number.is_a? Integer
      number.strip!

      # strip prefix
      number[0] = '' if number[0] == '+' or number[0] == '-'

      # 0
      return 'zero' if number.length == 1 and number == '0'

      # 1..999
      return get_hundreds number, version if number.length < 4

      # 999 <
      i             = 0
      portions      = []
      portion_block = []
      number.reverse!

      number.each_char do |c|
        portion_block.push c
        i += 1

        if i % 3 == 0
          block_clone = portion_block.clone
          portions.push block_clone
          portion_block.clear
          i = 0
        end
      end

      portions.push portion_block unless portion_block.empty?
      portions.reverse!

      final_number = ''
      i            = portions.length - 1
      portions.each do |p|
        p.reverse!
        p_in_text    = get_hundreds(p.join.to_i.to_s, version)
        final_number += p_in_text
        final_number += ' ' + @scale[i] + ' ' if p_in_text != ''
        i            -= 1
      end
      final_number.strip!
    end

    private

    # @param number [String]
    # @return [String]
    def get_hundreds number, version
      two = get_2_decimals number
      return two unless two.nil?
      get_3_decimals number, version
    end

    # @param number [String]
    # @return [String|Nil]
    def get_2_decimals number
      # 0
      return '' if number.length == 1 and number == '0'

      # 1..9 / 01..09
      if (number.length == 1 and number != '0') or
          (number.length == 2 and number[0] == '0' and number[1] != '0')
        return @singles[number.to_i]
      end

      # tens
      if number.length == 2 and number[0] != '0' and number[1] == '0'
        return @tens[number[0].to_i]
      end

      # 11..19
      if number.length == 2 and number[0] == '1' and number[1].to_i > 0
        return @ten_frags[number[1].to_i]
      end

      # 21..99
      if number.length == 2 and number[0].to_i > 1 and number[1].to_i >= 1
        return @tens[number[0].to_i] + '-' + @singles[number[1].to_i]
      end

      nil
    end

    # @param number [String|Array]
    # @return [String|Nil]
    def get_3_decimals number, version
      # hundreds
      if number.length == 3 and number[0] != '0'
        final_number = @singles[number[0].to_i] + ' hundred'

        if number[1] != '0' or number[2] != '0'
          final_number += version == :gb ? ' and ' : ' '
          final_number += get_2_decimals(number[1..2])
        end

        return final_number
      end

      nil
    end

  end

end

class Integer
  include IntegerToEnglish
end
