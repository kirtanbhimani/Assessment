/* 
C ++ Programming Assessment Test
• Write a program to demonstrate a Rock Paper Scissor Game.
• Display the Menu using appropriate codes.
• For Menu kinds of Programming , use the core logic of Loops/conditional statements.
• You need to strictly follow the syntaxes’s of that logic which you are using.
• Write the necessary comments for better understanding to you as well as to the 
faculty.
Project Requirements : 
• Invoke the particular Method/Function through object , in which you are writing your
logic.
• Use this function :
• srand(time(0));
• (rand()%3)+1; -> Generating for random no.s from computer’s end.
• Use library header files i.e #include<stdlib.h> and #include<ctime> for above logic if 
necessary.
• Add the necessary comments for better understanding of code
*/

#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime>   // for time()

using namespace std;

//class for Game
class RockPaperScissors {
public:
    void displayMenu() {
        cout << "Rock Paper Scissors Game Menu" << endl;
        cout << "1. Rock" << endl;
        cout << "2. Paper" << endl;
        cout << "3. Scissors" << endl;
        cout << "Enter your choice (1-3): ";
    }
	
	//get user choice
    int getUserChoice() {
        int choice;
        cin >> choice;
        return choice;
    }

	//get computer choice
    int getComputerChoice() {
        srand(time(0)); // Seed the random number generator
        return (rand() % 3) + 1; // Generate random choice (1-3)
    }
	
	//Constuctor
    determineWinner(int userChoice, int computerChoice) {
        cout << "You chose: " << choiceToString(userChoice) << endl;
        cout << "Computer chose: " << choiceToString(computerChoice) << endl;

        if (userChoice == computerChoice) {
            cout << "It's a tie!" << endl;
        } else if ((userChoice == 1 && computerChoice == 3) ||
                   (userChoice == 2 && computerChoice == 1) ||
                   (userChoice == 3 && computerChoice == 2)) {
            cout << "You win!" << endl;
        } else {
            cout << "Computer wins!" << endl;
        }
    }

//private class for switch oparation
private:
    string choiceToString(int choice) {
        switch (choice) {
            case 1:
                return "Rock";
            case 2:
                return "Paper";
            case 3:
                return "Scissors";
            default:
                return "Invalid";
        }
    }
};

int main() {
    RockPaperScissors game;					//game is an object of RockPaperScissors

    int userChoice;
    int computerChoice;

    game.displayMenu();						//calling function for display manu
    userChoice = game.getUserChoice();			

	//match the choice between user and computer
    while (userChoice < 1 || userChoice > 3) {
        cout << "Invalid choice. Please enter a valid choice (1-3): ";
        userChoice = game.getUserChoice();
    }

    computerChoice = game.getComputerChoice();
    game.determineWinner(userChoice, computerChoice);

}

