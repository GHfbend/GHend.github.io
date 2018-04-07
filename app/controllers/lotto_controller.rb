class LottoController < ApplicationController
  def lotto
    lotto_arrays = Array.new
    while lotto_arrays.size < lotto
      lotto_arrays << (1..45).to_a.sample(6).sort
  end
  require ('json')

  page = open('http://www.nlotto.co.kr/gameResult.do?method=byWin')
  lotto_info = page.read
  lotto_hash = JSON.parse(lotto_info)

  puts lotto_hash

  lotto_arrays.uniq!

  win_array = lotto_hash
  puts "Lotto win number is: "
  puts win_array.inspect
  puts "Your lotto number is: "
  lotto_arrays.each do |array|
    puts array.inspect

    if win_array.sort == array
      puts "Your won 1st Prize!"
    elsif (win_array & array).size == 5
      puts "You won 2nd Prize!"
    elsif (win_array & array).size == 4
      puts "You won 3rd Prize!"
    elsif (win_array & array).size == 3
      puts "You won 4th prize!"
    elsif (win_array & array).size == 2
      puts "You won 5th Prize!"
    end
  end

  return lotto_arrays, win_array
end

def
