even' x = mod x 2 == 0

odd' x = mod x 2 /= 0

bmi height weight = weight / (height^2)

deg2Rad degrees = pi / 180 * degrees

rad2Deg radians = 180 / pi * radians

isTriangle a b c = a + b > c && a + c > b && b + c > a

perimeter a b c = a + b + c

perimeterHalf a b c = (perimeter a b c) / 2

area a b c = sqrt((perimeterHalf a b c) * ((perimeterHalf a b c) - a) * ((perimeterHalf a b c) - b) * ((perimeterHalf a b c) - c))

calculate sign a b = if sign == '+' then a + b else if sign == '-' then a - b else a * b

convert fromCurrency toCurrency amount = if fromCurrency == 'usd' then if toCurrency == 'bgn' then amount * 1.737
                                                                  else if toCurrency == 'eur' then amount * 1.959 / 1.737
                                         else if fromCurrency == 'eur' then if toCurrency == 'bgn' then amount * 1.959
                                                                       else if toCurrency == 'usd' then amount * 1.737 / 1.959
                                         else if fromCurrency == 'bgn' then if toCurrency == 'usd' then amount / 1.737
                                                                       else if toCurrency == 'eur' then amount / 1.959
                                                                        