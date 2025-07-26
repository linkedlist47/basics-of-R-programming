play_rps <- function() {
  choices <- c("rock", "paper", "scissors")
  computer_choice <- sample(choices, size = 1)
  
  player_choice <- tolower(readline("Enter your choice (rock, paper, or scissors): "))
  
  if (!player_choice %in% choices) {
    print("Invalid choice. Please enter rock, paper, or scissors.")
    return(NULL) # Exit the function if input is invalid
  }
  
  if (player_choice == computer_choice) {
    print(paste0("It's a tie! Both chose ", player_choice, "."))
  } else if ((player_choice == "rock" & computer_choice == "scissors") |
             (player_choice == "paper" & computer_choice == "rock") |
             (player_choice == "scissors" & computer_choice == "paper")) {
    print(paste0("You win! You chose ", player_choice, " and the computer chose ", computer_choice, "."))
  } else {
    print(paste0("You lose! You chose ", player_choice, " and the computer chose ", computer_choice, "."))
  }
}

# To play the game:
# play_rps()
