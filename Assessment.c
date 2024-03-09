//Create an application that can perform all string related operations 
//Make sure each business logic is denoted with appropriate comments and
//make your code interactive and represent clean and clear output on your
//console screen.
//Adhere to the coding principles 
//It should be a menu driven approach, for which you are suppose to use the functions 
//concept 
//Over Here, take string input from user and perform string operations listed below : 
//? reverse a string
//? Concatenation 
//? Palindrome
//? Copy a string 
//? Length of the string 
//? Frequency of character in s string 
//? Find number of vowels and consonants 
//? Find number of blank spaces and digits 
//As given above perform the operation as per user’s choice 
//If user will not select any of the above then it should not perform any operation and 
//give an appropriate user friendly message 
//After performing the operation ask the user if the user wants to continue or not ?


#include <stdio.h>
#include <string.h>
// Function prototypes
void reverseString(char *str);
void concatenateStrings(char *str1, char *str2);
int isPalindrome(char *str);
void copyString(char *source, char *destination);
int stringLength(char *str);
void characterFrequency(char *str);
void countVowelsAndConsonants(char *str);
void countDigitsAndSpaces(char *str);

int main() {
    char str1[1000], str2[1000], choice;
    int continueFlag = 1,i;

    do {
        printf("\nString Operations Menu:\n");
        printf("1. Reverse a string\n");
        printf("2. Concatenate strings\n");
        printf("3. Check palindrome\n");
        printf("4. Copy a string\n");
        printf("5. Length of the string\n");
        printf("6. Frequency of characters\n");
        printf("7. Count vowels and consonants\n");
        printf("8. Count digits and spaces\n");
        printf("Enter your choice (1-8): ");
        scanf(" %c", &choice);

        switch (choice) {
            case '1':
                printf("Enter the string to reverse: ");
                scanf(" %[^\n]", str1);
                reverseString(str1);
                break;
            case '2':
                printf("Enter the first string: ");
                scanf(" %[^\n]", str1);
                printf("Enter the second string: ");
                scanf(" %[^\n]", str2);
                concatenateStrings(str1, str2);
                break;
            case '3':
                printf("Enter the string to check palindrome: ");
                scanf(" %[^\n]", str1);
                if (isPalindrome(str1))
                    printf("The string is a palindrome.\n");
                else
                    printf("The string is not a palindrome.\n");
                break;
            case '4':
                printf("Enter the source string: ");
                scanf(" %[^\n]", str1);
                copyString(str1, str2);
                printf("Copied string: %s\n", str2);
                break;
            case '5':
                printf("Enter the string: ");
                scanf(" %[^\n]", str1);
                printf("Length of the string: %d\n", stringLength(str1));
                break;
            case '6':
                printf("Enter the string: ");
                scanf(" %[^\n]", str1);
                characterFrequency(str1);
                break;
            case '7':
                printf("Enter the string: ");
                scanf(" %[^\n]", str1);
                countVowelsAndConsonants(str1);
                break;
            case '8':
                printf("Enter the string: ");
                scanf(" %[^\n]", str1);
                countDigitsAndSpaces(str1);
                break;
            default:
                printf("Invalid choice! Please enter a number between 1 and 8.\n");
                break;
        }

        printf("\nDo you want to continue? (y/n): ");
        scanf(" %c", &choice);
        if (choice != 'y' && choice != 'Y')
            continueFlag = 0;

    } while (continueFlag);

    printf("Thank you for using the string operations application!\n");

    return 0;
}

// Function to reverse a string
void reverseString(char *str) {
    int length = strlen(str),i;
    for (i = length - 1; i >= 0; i--) {
        printf("%c", str[i]);
    }
    printf("\n");
}

// Function to concatenate two strings
void concatenateStrings(char *str1, char *str2) {
    printf("Concatenated string: %s%s\n", str1, str2);
}

// Function to check if a string is a palindrome
int isPalindrome(char *str) {
    int i,length = strlen(str);
    for (i = 0; i < length / 2; i++) {
        if (str[i] != str[length - 1 - i]) {
            return 0; // Not a palindrome
        }
    }
    return 1; // Palindrome
}

// Function to copy a string
void copyString(char *source, char *destination) {
    strcpy(destination, source);
}

// Function to find the length of a string
int stringLength(char *str) {
    return strlen(str);
}

// Function to calculate the frequency of each character in a string
void characterFrequency(char *str) {
    int frequency[256] = {0}; // Assuming ASCII characters
    int i,length = strlen(str);
    for (i = 0; i < length; i++) {
        frequency[(unsigned char)str[i]]++;
    }
    printf("Character frequency:\n");
    for ( i = 0; i < 256; i++) {
        if (frequency[i] > 0) {
            printf("'%c' : %d\n", i, frequency[i]);
        }
    }
}

// Function to count vowels and consonants in a string
void countVowelsAndConsonants(char *str) {
    int vowels = 0, consonants = 0;
    int i,length = strlen(str);
    for (i = 0; i < length; i++) {
        char ch = tolower(str[i]);
        if (ch >= 'a' && ch <= 'z') {
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
                vowels++;
            } else {
                consonants++;
            }
        }
    }
    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);
}

// Function to count digits and spaces in a string
void countDigitsAndSpaces(char *str) {
    int digits = 0, spaces = 0;
    int i,length = strlen(str);
    for (i = 0; i < length; i++) {
        if (isdigit(str[i])) {
            digits++;
        } else if (isspace(str[i])) {
            spaces++;
        }
    }
    printf("Number of digits: %d\n", digits);
    printf("Number of spaces: %d\n", spaces);
}

