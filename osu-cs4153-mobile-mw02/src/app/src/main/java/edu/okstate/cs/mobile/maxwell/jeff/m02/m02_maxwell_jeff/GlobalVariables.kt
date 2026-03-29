package edu.okstate.cs.mobile.maxwell.jeff.m02.m02_maxwell_jeff

import edu.okstate.cs.mobile.maxwell.jeff.m02.State

/****************
 * Store Global variable list of States and Counter that is
 * accessible from all source code
 ***************/
object GlobalVariables {
    // ArrayList of States
    var states: ArrayList<State> = ArrayList()

    // Counter of total number of states selected
    var counter: Int = 0
}