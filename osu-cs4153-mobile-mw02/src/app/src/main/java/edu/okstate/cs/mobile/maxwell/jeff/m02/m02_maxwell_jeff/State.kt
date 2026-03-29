package edu.okstate.cs.mobile.maxwell.jeff.m02

/****************
 * State Class to store information on each State
 * Properties:
 *  name - State Name
 *  nickname - Nickname of the State
 *  img - Integer reference to the State Flag image
 *  isFound - Boolean to track if the state has been selected
 ***************/
class State(name: String, nickname: String, img: Int, isFound: Boolean) {
    var name = name
    var nickname = nickname
    var img = img
    var isFound = isFound
}