#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime>   // for time()

using namespace std;

//class for Rock_Paper_Scissors
class RockPaperScissors {
	private:
    	string player_name;

	public:
   		// Constructor to initialize player_name
    	RockPaperScissors() {
        	player_name = "";
    	}

    	// Function to display menu
    	display_menu() {
      		cout << "Rock Paper Scissors Game" << endl;
      		cout << "-------------------------" << endl;
      		cout << "Menu:" << endl;
        	cout << "1. Rock" << endl;
        	cout << "2. Paper" << endl;
        	cout << "3. Scissors" << endl;
        	cout << "4. Exit" << endl;
    	}

   		// Function to get user's choice
    	int get_user_choice() {
        	int choice;
        	cout << player_name << ", enter your choice (1-3): ";
        	cin >> choice;
        	return choice;
    	}

    	// Function to generate computer's choice
    	int generate_computer_choice() {
        	srand(time(0)); // Seed the random number generator
        	return (rand() % 3) + 1;
    	}

    	// Function to determine winner
    	determine_winner(int user_choice, int computer_choice) {
        	cout << "Computer chose: ";
        	switch (computer_choice) {
            	case 1:
                	cout << "Rock" << endl;
                	break;
            	case 2:
                	cout << "Paper" << endl;
                	break;
            	case 3:
                	cout << "Scissors" << endl;
                	break;
        	}

        	cout << player_name << " chose: ";
        	switch (user_choice) {
            	case 1:
                	cout << "Rock" << endl;
                	break;
            	case 2:
            	    cout << "Paper" << endl;
            	    break;
            	case 3:
            	    cout << "Scissors" << endl;
            	    break;
        	}

        	// Determine the winner
        	if (user_choice == computer_choice) {
            	cout << "It's a tie!" << endl;
        	} else if ((user_choice == 1 && computer_choice == 3) ||
            	       (user_choice == 2 && computer_choice == 1) ||
            	       (user_choice == 3 && computer_choice == 2)) {
            	cout << player_name << " wins!" << endl;
        	} else {
            	cout << "Computer wins!\n" << endl;
        	}
    	}

    	// Function to start the game
    	start_game() {
    		cout << "====================================" << endl;
    	    cout << "Enter your name: ";
        	cin >> player_name;
        	cout << "====================================" << endl;

        	int rounds;
        	cout << "Enter No. of Rounds to Play: ";
        	cin >> rounds;
        	cout << "====================================" << endl;

        	for (int i = 1; i <= rounds; ++i) {
            	cout << "Round " << i << endl;
            	display_menu();
            	int user_choice = get_user_choice();
           		if (user_choice == 4) {
                	cout << "Exiting the game. Goodbye!" << endl;
            	}
            	int computer_choice = generate_computer_choice();
            	determine_winner(user_choice, computer_choice);
        	}
    	}
};

int main() {
    RockPaperScissors game;				//game is an object 
    game.start_game();					//function calling
}

