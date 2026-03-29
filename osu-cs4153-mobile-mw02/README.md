# OSU CS4153 Mobile App Development

## Multi-Week Assignment 02 - 20 Points 

#### Last updated: Nov 13, 2018 6:30 AM 
#### Due: Nov 29 11:59PM 

### See Date Notes Below
On long trips, you might need something to occupy your time (assuming you’re not the driver).
A popular pastime is to look for license plates from the different states, and to see how many
of the state plates can be spotted before the trip is over.
In this assignment, you will write an app that lets the user play “the license plate game”.

### App Usage Notes
You are creating an Android version of an iOS app. The screenshots shown under the
Figures section, below, are from the iOS version.

When the app starts:

- A recycler view displays information about the 50 US states. Each row contains the following information about one state:

- The name of the state (larger text); e.g., “Oklahoma”

- The nickname of the state (smaller text); e.g., “The Sooner State”

- The user can scroll vertically through the list of states.

- The background color of each row is the default or some other neutral color.

- A bar across the bottom shows the current score (0 / 50) and contains a Reset Game
button.

- The user taps on a row when she/he sees a car with a license plate from that state.
When this tap occurs, the background color of the row changes to some pastel color, as
shown in Figure 1, and the score in the bar increases by 1.

- The user taps a row a second time if he/she was mistaken about seeing the license plate
from that state. When this tap occurs, a dialog appears asking the user if he/she really
wants to reset the state, as shown in Figure 2.

- If the user responds “Yes”, reset the background to its original color, reduce the
score in the bar by 1, and dismiss the dialog.

- If the user responds “No”, dismiss the dialog without any changes.

- The user taps the Reset Game when she/he wants to start the game over. A dialog
appears asking the user to verify their decision, as shown in Figure 3.

- If the user responds “Yes”, reset the background of all rows to their original color
and reset the score in the bar to 0.

- If the user responds “No”, dismiss the dialog without any changes.

### Add Development Notes
1. Create a new Kotlin project in Android Studio 3.2.1 and targeting the Pixel 2 XL running API 28 (Android 9.0, Pie. Name your project
    MW2_lastName_firstName

2. Your app is required to run in upright, portrait orientation only.

3. Use a RecyclerView to represent the list of state information.

4. You may use the Anko libraries, if you wish.

5. The alphabet-letter separator rows in the list that appear in the sample screenshots
between the states that start with the same letter (e.g., “A”, “C”, “D”, etc.) are optional.

6. Each row should have a thin, grey, horizontal line separating it from adjacent cells.

7. You can find a list of the state names and nicknames at this website.

### General notes

- Be as creative or as simple as you like with your app’s format, fonts, colors, etc.

- You may add music or sound effects, if you wish.

### Due Date Notes
Since the end of the semester is approaching, here are the various due dates for this assignment:

```
- On time .................................................... by Nov 29 11:59 PM
- 1 class late .............................................. by Dec 4 11:59 PM
- 2 classes late ......................................... by Dec 6 11:59 PM
- 3 classes late ......................................... by Dec 7 11:59 PM
```