#BY: Braeden Smith 2015

#Intro to programming class
def draw(faults)
  if faults == 7
    puts "
_________
|       |
|       |
|       O
|      /|\\
|       |
|      / \\
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
    puts "YOU HAVE LOST!"
    puts "The word was: " + $wordfinal
    sleep 2
    exit
  elsif faults == 6
    puts "
_________
|       |
|       |
|       O
|      /|\\
|       |
|      /
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == 5
    puts "
_________
|       |
|       |
|       O
|      /|\\
|       |
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == 4
    puts "
_________
|       |
|       |
|       O
|      /|\\
|
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == 3
    puts "
_________
|       |
|       |
|       O
|      /|
|
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == 2
    puts "
_________
|       |
|       |
|       O
|       |
|
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == 1
    puts "
_________
|       |
|       |
|       O
|
|
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""

  elsif faults == 0
    puts "
_________
|       |
|       |
|
|
|
|
|
-----------------
"
    puts
    puts "Used Letters: " + $usedletters.inspect
    puts "Faults: " + $faults.inspect
    puts "Unknown Word: " + $wordEmptyArray.join(" ")
    puts ""
  elsif faults == "win"
    puts "CONGRATS YOU WON"
    puts "You guessed " + $wordfinal + " correctly"
    sleep 2
    exit
  end
end
def inputsan(input)
  if input.downcase == "word"
    puts ""
    puts "What word do you want to guess?"
		inputw = gets.chomp
    if inputw.nil? or inputw.empty?
      $message = "Nothing inputed."
      puts ""
      inputsan("word")
    elsif inputw[/[a-zA-Z]+/] == inputw && inputw.downcase == $wordfinal
      $message = "Congrats you guessed the right word"
      $faults = "win"
    else
      $message = "Sorry the word is wrong"
      $faults = $faults + 1
      draw($faults)
    end
    #inputchk(inputw)
  elsif input[/[a-zA-Z]+/] == input && input.length == 1
    input=input.downcase
    if $usedletters.include?(input)
      $message = "You've already entered this letter"
    else
      $usedletters.push(input)
      if $wordFinalArray.include?(input)
        $message = "Success"
        matchLocations = $wordFinalArray.map.with_index{|x, i| i if x == input}.compact
        matchLocations.each { |x|
          $wordEmptyArray.fill(input, x, 1)
        }
        if $wordEmptyArray == $wordFinalArray
          $faults= "win"
        end
      else
        $message = "Your letter is not in the word"
        $faults = $faults + 1
      end
    end
  elsif input.downcase == "giveup"
    puts "The answer is: " + $wordfinal
    sleep 2
    exit
  else
    $message = "Your input was not a valid letter."
  end
end

def wordgen
  randomGen=[]
  File.read("Dictionary.csv").each_line do |line|
    randomGen << line.chop
  end
  $wordfinal = randomGen.sample
  $wordfinal = $wordfinal.to_s
end
begin
  $faults = 0
  $usedletters = []
  wordgen
  $wordEmptyArray = []
  $wordFinalArray = $wordfinal.split('')
  $wordFinalArray.each { |x|
    $wordEmptyArray.push("_")
  }
  loop {
    system "clear" or system "cls"
    draw($faults)
    puts $message
    #puts $wordfinal
    #Testing Use
    #puts $wordFinalArray.inspect
    puts "Enter 'Word' to type entire word OR enter a letter OR 'giveup'"
    choice=gets.chomp.to_s
    inputsan(choice)
  }

rescue
  #To catch exception
  puts ""
  puts "ERROR: Program has crashed, exception details below"
  puts ""
  puts "Look what you've done!"
  puts ""
  sleep(1)
  puts $!, $@
  puts ""
  puts "QUITTING!"
end
