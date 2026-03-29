# OSU CS4153 Mobile App Development

## Multi-Week Assignment 01 20 Points

#### Last updated: Sep 20, 2018 4:30 PM 
#### Due: Oct 11 11:59PM

Write an iOS app for iPhones that helps joggers keep track of their workout times and statistics, on a lap-by-lap basis.

1. Create a new, Swift 4.2 project in Xcode 10 beta, GM Seed, or production. Name the
project
MW1_lastName_firstName

2. Your app should run in upright, portrait orientation only. However, it must use auto
layout to look good on all models of iPhones.

3. When the app starts, the display looks similar to that shown in Figure 1 (near the end of
this document), and it is waiting for user interaction.

- I’ve named my app “Take a Lap” and provided a logo that includes the name; this
logo actually is a button with which the user will interact. You should give your app
a distinctive name, logo, and style – as long as it has all of the components shown in
the image.

- The stopwatch image that displays the word START is another button with which
the user will interact. You can make your own image or use one from a Web-based
source; if you use artwork assets that you did not create (the runner and stopwatch
images, in my case), reference them at the bottom of the display.

- There are three different numbers displayed on the screen: current lap number
(upper-left), current lap time (lower), and total jogging time (upper-right). I suggest
you use a monospaced font, such as Helvetica Neue (which is accessed as a custom
font in the attribute inspector of a label).

4. When the user taps the START button, a number of changes take place:

- The stopwatch image changes its color/look so that the user sees a stopwatch with
the word STOP on it.

- If the current lap number value is 0 when the user taps START, increment the
number to 1; if the value already is ³ 1, don’t change it. (It is the job of the New Lap
button – described below – to increment the lap counter once a run has started.)

- Start the lap and total time counters. (I suggest you keep just one Swift Timer object
to keep both values updated.)

- A new, large (i.e., easy to hit with the thumb) button (New Lap) appears over the
logo, hiding the logo. When the user taps this button, increment the current lap
number and resets the current lap time to 0.

- After running for a while (on the first lap), the screen looks something like that
shown in Figure 2.

5. When the user taps the STOP button, the timer stops, the START button reappears, and
the New Lap button disappears. The screen will look something like that shown in
Figure 3.

6. If the user taps on the START button again after pressing the STOP button, neither the
times nor the lap count get reset; it simply continues the timer from where it left off, as
though the STOP button had never been pressed. (Perhaps the jogger stopped for a
burger in the middle of the lap.)

7. Recall that I mentioned above that the app logo actually is a button. When it is visible
on the display, the user can tap on it and segue to a table view controller that lists the
lap times. The navigation bar should contain an appropriate title, and the toolbar
should provide the user with the average lap time. This view should look something
like that shown in figure 4.

8. If the user double-taps on the START button, reset the timers and the lap counter.
(You’ll also erase the list of lap times used to generate the table view controller
contents.)

### General notes
- Be as creative or as simple as you like with your app’s format, fonts, colors, etc.
- You may add music or sound effects, if you wish.