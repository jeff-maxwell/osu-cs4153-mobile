package edu.okstate.cs.mobile.maxwell.jeff.m02.m02_maxwell_jeff

import android.app.Application
import edu.okstate.cs.mobile.maxwell.jeff.m02.State

/****************
 * Common Class library to return the list of States and the
 * counter number formatted
 ***************/
class Common: Application() {

    /****************
     * Returns the current Count of States select out of the total formatted
     ***************/
    fun getCounter(): String {
        return GlobalVariables.counter.toString() + " / " + GlobalVariables.states.count()
    }

    /****************
     * Load the values of the state name, nickname, flag image and initializes the found flag to false
     * This loads a GlobalVariables Object that is shared across the application
     ***************/
    fun loadStates() {
        // State flag and nickname were taken from the following sites:
        // Flags: https://en.wikipedia.org/wiki/Flags_of_the_U.S._states_and_territories
        // Nicknames: https://statesymbolsusa.org/categories/nickname
        GlobalVariables.states.add(State("Alabama", "The Yellowhammer State", R.drawable.alabama, false))
        GlobalVariables.states.add(State("Alaska", "The Last Frontier",R.drawable.alaska,false))
        GlobalVariables.states.add(State("Arizona","The Grand Canyon State", R.drawable.arizona, false))
        GlobalVariables.states.add(State("Arkansas","The Natural State", R.drawable.arkansas, false))
        GlobalVariables.states.add(State("California","The Golden State", R.drawable.california, false))
        GlobalVariables.states.add(State("Colorado","The Centennial State", R.drawable.colorado, false))
        GlobalVariables.states.add(State("Connecticut","The Constitution State", R.drawable.connecticut, false))
        GlobalVariables.states.add(State("Delaware","The First State", R.drawable.delaware, false))
        GlobalVariables.states.add(State("Florida","The Sunshine State", R.drawable.florida, false))
        GlobalVariables.states.add(State("Georgia","The Peach State", R.drawable.georgia, false))
        GlobalVariables.states.add(State("Hawaii","The Aloha State", R.drawable.hawaii, false))
        GlobalVariables.states.add(State("Idaho","The Gem State.  Tasty Destinations", R.drawable.idaho, false))
        GlobalVariables.states.add(State("Illinois","The Prairie State", R.drawable.illinois, false))
        GlobalVariables.states.add(State("Indiana","The Hoosier State", R.drawable.indiana, false))
        GlobalVariables.states.add(State("Iowa","The Hawkeye State", R.drawable.iowa, false))
        GlobalVariables.states.add(State("Kansas","The Sunflower State", R.drawable.kansas, false))
        GlobalVariables.states.add(State("Kentucky","The Bluegrass State", R.drawable.kentucky, false))
        GlobalVariables.states.add(State("Louisiana","The Pelican State", R.drawable.louisiana, false))
        GlobalVariables.states.add(State("Maine","The Pine Tree State", R.drawable.maine, false))
        GlobalVariables.states.add(State("Maryland","The Old Line State", R.drawable.maryland, false))
        GlobalVariables.states.add(State("Massachusetts","The Bay State", R.drawable.massachusetts, false))
        GlobalVariables.states.add(State("Michigan","Great Lakes State", R.drawable.michigan, false))
        GlobalVariables.states.add(State("Minnesota","The North Star State", R.drawable.minnesota, false))
        GlobalVariables.states.add(State("Mississippi","The Magnolia State", R.drawable.mississippi, false))
        GlobalVariables.states.add(State("Missouri","The Show-Me State", R.drawable.missouri, false))
        GlobalVariables.states.add(State("Montana","The Treasure State", R.drawable.montana, false))
        GlobalVariables.states.add(State("Nebraska","The Cornhusker State", R.drawable.nebraska, false))
        GlobalVariables.states.add(State("Nevada","The Silver State", R.drawable.nevada, false))
        GlobalVariables.states.add(State("New Hampshire","The Granite State", R.drawable.newhampshire, false))
        GlobalVariables.states.add(State("New Jersey","The Garden State", R.drawable.newjersey, false))
        GlobalVariables.states.add(State("New Mexico","Land of Enchantment", R.drawable.newmexico, false))
        GlobalVariables.states.add(State("New York","The Empire State", R.drawable.newyork, false))
        GlobalVariables.states.add(State("North Carolina","The Tar Heel State", R.drawable.northcarolina, false))
        GlobalVariables.states.add(State("North Dakota","The Peace Garden State", R.drawable.northdakota, false))
        GlobalVariables.states.add(State("Ohio","The Buckeye State", R.drawable.ohio, false))
        GlobalVariables.states.add(State("Oklahoma","The Sooner State", R.drawable.oklahoma, false))
        GlobalVariables.states.add(State("Oregon","The Beaver State", R.drawable.oregon, false))
        GlobalVariables.states.add(State("Pennsylvania","The Keystone State", R.drawable.pennsylvania, false))
        GlobalVariables.states.add(State("Rhode Island","The Ocean State", R.drawable.rhodeisland, false))
        GlobalVariables.states.add(State("South Carolina","The Palmetto State", R.drawable.southcarolina, false))
        GlobalVariables.states.add(State("South Dakota","Mount Rushmore State", R.drawable.southdakota, false))
        GlobalVariables.states.add(State("Tennessee","The Volunteer State", R.drawable.tennessee, false))
        GlobalVariables.states.add(State("Texas","The Lone Star State", R.drawable.texas, false))
        GlobalVariables.states.add(State("Utah","The Beehive State", R.drawable.utah, false))
        GlobalVariables.states.add(State("Vermont","The Green Mountain State", R.drawable.vermont, false))
        GlobalVariables.states.add(State("Virginia","Old Dominion", R.drawable.virginia, false))
        GlobalVariables.states.add(State("Washington","The Evergreen State", R.drawable.washington, false))
        GlobalVariables.states.add(State("West Virginia","The Mountain State", R.drawable.westvirginia, false))
        GlobalVariables.states.add(State("Wisconsin","The Badger State", R.drawable.wisconsin, false))
        GlobalVariables.states.add(State("Wyoming","The Equality State", R.drawable.wyoming, false))
    }

}