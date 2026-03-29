# OSU CS4153 Mobile App Development

## Weekly Assignment 08

#### Last updated: Oct 11, 2018 6:30 AM 
#### Due: Oct 18 11:59PM

In this assignment, you will enhance the course database app covered in our classtime.

### App Description
1. The starting point for this app is the “course database” app we wrote in class using Swift 4.2 project in Xcode 10 during session 15.

2. On the “New Course” screen:
- Note that, when you type information into the text fields using the device keyboard, there is no way to dismiss the keyboard. Add this capability.

- Prevent the user from entering non-numeric data into the “Course Number” text field.

- If the user taps “Save” but any of the text fields are empty or contain only whitespace (blanks, tabs, newlines), then alert the user that they must enter a value for all fields or tap “Back” to cancel.

3. Back in the table view controller, if the user attempts to save a duplicate department abbreviation / course number pair (e.g., “CS4153” more than once), alert the user that the data entered is a duplicate and will not be saved.