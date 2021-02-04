puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'

puts 'Please type 1 if you want to play alone, or 2 to play with other player!'
response = (gets.chomp)

if response.to_n == 1
    # play vs the computer
    puts 'Player one name:'
    pone = gets.chomp
    player_one = pone #Here I have to create a new Player class instance
    puts "Hello #{player_one}, this is 'CPU' and it will be your opponent"
    board = 'This is the board instance class' #Here I have to create a new Board class instance
    #board.display
    puts board
    puts 'Displaying empty board' #I have to display the board through the display method from the board
    puts "Press 'P' to start"
    key = gets.chomp
    if key == 'P'
        #Start the game vs the computer
        game = true
        win = false
        while game
            if win
            puts "Your turn, select one number to put a 'X'"
            puts board
            # here I set up the board and the array that will manage the game
            number = gets.chomp
            array = [1,2,3,4,5,6,7,8,9]
            if array.include?(number)
                puts "Change the position #{number} for an X"
            
            

        end
    else
        puts 'Thanks for playing'
    end
elsif response.to_n == 2
    #play with other friend
else
    raise WrongOption
end