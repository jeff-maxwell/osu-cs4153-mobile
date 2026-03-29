# OSU CS4153 Mobile App Development

## Weekly Assignment 04

#### Last updated: Sep 11, 2018 4:00 PM 
#### Due: Sep 20 11:59PM

A few years ago, there was an app named The Gestures Game on the Apple App store. Your job
is to write your own simplified version of the game, which is described below.

Here are some screenshots from that game.

From left to right, the screenshots depict:
- The upper part of this screenshot shows you the four icons that may appear during the game. The lower part of this screenshot permits the user to access different parts of the app. You will not replicate this screenshot in your game.

- This screenshot shows a game in progress. There are 49 seconds left in the game, and the user has identified correctly 8 gestures.

- This screenshot describes the gameplay.

- This screenshot is the end of game screen. It tells the user the number of gestures identified correctly in the game that just ended (8), the best score so far (26) and permits the user to play again.

### App Description
1. Create a new, Swift 4.2 project in Xcode 10-beta or productin; its UI should be formatted for the iPhone 8 Plus. Name the project
W04_lastName_firstName

2. Set the background of the root view to some pleasant color or unobtrusive
pattern/picture.

3. The gestures your app will recognizer are left swipe, right swipe, tap, and pinch. The icons for these gestures are found in the file Gesture Icons.zip found in the Apps & Assets section on the BrightSpace page.

4. When the app begins, it should look something like the one shown Figure 1, at the bottom of this document. The screen displays only a Start button.

5. When the user taps on the Start button, the button disappears and three other items appear on the screen, as shown in Figure 2. They are: the current score (number of gestures identified correctly), the time remaining (in seconds), and a gesture icon, randomly-chosen from among the four possibilities. The timer begins to count down towards zero.

6. The user makes a gesture anywhere on the screen.
- If the user’s gesture matches that indicated by the icon, increment the score and replace the icon with a randomly-chosen (but different) icon, and play continues.

- If the user makes a gesture that does not match the icon, do nothing, and play continues.

7. When the clock reaches zero, the three items on the screen disappear and a game over item appears, something like the one shown in Figure 3.

8. You are not required to add a Play Again? option, but you may if you wish.

### General notes
- Every UIView subclass has a Boolean property named isHidden. This property can be
set while the app is running to make views appear and disappear at your command.

- An example countdown timer app can be found in the Apps & Assets section on the BrightSpace page.

- Be as creative or as simple as you like with your app’s format, fonts, colors, etc.

- You may add music or sound effects, if you wish.