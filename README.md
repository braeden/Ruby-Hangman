# Ruby-Hangman
##Lab: Hangman
###Group: Braeden, Matt, Tommy.
 

Objective:
Create a Hangman game that uses ruby methods. You should have the following features and methods:
The game should display all letters already guessed, the letters remaining that can still be guessed, the hangman drawing using ASCII characters, and the mystery word or quote as letters guessed. See example below.
Define a method draw_man. This method takes one input, the number of body parts to draw (head, neck, left arm, right arm, body, left leg, right leg), outputs the hangman drawing using ASCII characters, and returns nothing.
```
 ____________
 |      |
 |      @
 |     /|\
 |      |
 |     / \      
 |
 -----------
 ```

Define a method check_letter. This method takes two inputs, the word being played and the letter just guessed, and outputs an array of the positions where the letter was found.
 

 check_letter(“encyclopedia”, “c”)
 => [2, 4]
 

Define a method display_result. This method takes two inputs, the word being played and an array of letters guessed, and outputs the word using blanks (underscores) for the unrevealed letters and the actual letters if the letter has been guessed.
 

 display_result(“encyclopedia”, [“c”, “e”])
 => “e _ c _ c _ _ _ e _ _ _”











Example:
```
____________
|      |
|      0
|     /|\
|      |
|          
-----------
``` 

Word: e _ c _ c _ _ _ e _ _ _
 

Letters Already Guesses: B, C, E, Z
 

Press 1 to guess another letter.
Press 2 to guess the word!
 
Posted Wed Apr 22, 2015 at 8:33 am
Comments
There are no comments
Profile picture for Braeden Smith
Write a comment: *
