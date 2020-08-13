# isbn-calculator

[![gem](https://img.shields.io/gem/v/isbn-calculator.svg)](https://rubygems.org/gems/isbn-calculator)

_Calculates the check digit of a partial ISBN_

## Installation

```
gem install isbn-calculator
```
or add `isbn-calculator` to your Gemfile

## Usage

Function requires one string parameter:
* Partial ISBN number (normal or dashed format, e.g. `978014300723`)
Returns an integer.

```
require 'isbn-calculator'
ISBN::Calculator.calculate(000000000000) # 13 digit ISBN (12 digits supplied)
```

## Algorithm

The algorithm is based on the EAN checksum algorithm.

### ISBN validation - modulus 10 digit check

The ISBN number format is a thirteen digit number consisting of the following parts -

* A twelve digit base number
* A trailing check digit

### Check digit validation

The following steps are to be performed:

* Calculate the check digit
    * To each of the base number’s twelve digits a weight factor is assigned. From left to right these are: 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3.
    * Sum together the products of the weight factors and their associated digits.
    * Divide the sum by 10. If the remainder is 0 then the calculated check digit is 0.
    * If the remainder is not 0 then subtract the remainder from 10, giving the calculated check digit.

## Contributing

Pull requests are welcome.
