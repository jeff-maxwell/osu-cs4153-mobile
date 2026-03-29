package edu.okstate.cs.mobile.maxwell.jeff.m02.m02_maxwell_jeff

import android.content.Context
import android.graphics.Color
import android.support.v7.app.AlertDialog
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import edu.okstate.cs.mobile.maxwell.jeff.m02.State
import kotlinx.android.synthetic.main.recyclerview_row.view.*

/****************
 * MyRecyclerViewAdapter - RecyclerView to define each row.
 ***************/
class MyRecyclerViewAdapter(val items: ArrayList<State>, val context: Context): RecyclerView.Adapter<MyRecyclerViewAdapter.ViewHolder>()
{
    // public Interface so the application can share data to the MainActivity
    public interface MyInterface {
        public fun changeCountTextView()
    }

    /****************
     * MyRecyclerViewAdapter - RecyclerView to define each row.
     ***************/
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val myViewHolder = ViewHolder(LayoutInflater.from(context).inflate(R.layout.recyclerview_row, parent, false))

        /****************
         * setOnClickListener - Create a click listener for the Row.
         ***************/
        myViewHolder.itemView.setOnClickListener {

            // Get the current state at the position clicked
            var st = GlobalVariables.states[myViewHolder.pos]

            // If the isFound flag is true it is currently highlighted
            // Ask the user if they want to reset the row with an Alert Dialog
            if (st.isFound) {
                val builder = AlertDialog.Builder(myViewHolder.itemView.context)

                // Set the alert dialog title
                builder.setTitle("Please Verify")

                // Display a message on alert dialog
                builder.setMessage("Do you want to reset " + myViewHolder.tvState.text + "?")

                // Display a negative button on alert dialog
                builder.setNegativeButton("NO") { dialog, which ->
                    // Take no action and close the dialog
                }

                // Set a positive button and its click listener on alert dialog
                builder.setPositiveButton("YES") { dialog, which ->
                    // Decrease the Counter
                    GlobalVariables.counter -= 1

                    // Set the selected (Found) flag to false (resetting it)
                    st.isFound = false

                    // Change the color back to the default
                    myViewHolder.itemView.setBackgroundColor(Color.parseColor(context.getString(R.string.default_color)))

                    // Call the Interface change to change the value in the MainActivity
                    (context as MyInterface).changeCountTextView()
                }

                // Make the alert dialog using builder
                val dialog: AlertDialog = builder.create()

                // Display the alert dialog on app interface
                dialog.show()

            } else {
                // Increase the Counter
                GlobalVariables.counter += 1

                // Set the selected (Found) flag to true (setting it)
                st.isFound = true

                // Change the color back to the selected color
                myViewHolder.itemView.setBackgroundColor(Color.parseColor(context.getString(R.string.selected_color)))

                // Call the Interface change to change the value in the MainActivity
                (context as MyInterface).changeCountTextView()
            }
        }
        return myViewHolder
    }

    /****************
     * getItemCount - Returns the number of items in the list.
     ***************/
    override fun getItemCount(): Int {
        return items.size
    }

    /****************
     * onBindViewHolder - Match each rows data to the appropriate field on screen.
     ***************/
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {

        // Extract the state at each position and assign the values
        var state = items[position]
        holder.pos = position
        holder.tvState?.text = state.name
        holder.tvNickName?.text = state.nickname
        holder.ivFlag?.setImageResource(state.img)

        // If the isFound is true color the row.
        // Else set it back to White
        if (state.isFound) {
            holder.itemView.setBackgroundColor(Color.parseColor(context.getString(R.string.selected_color)))
        } else {
            holder.itemView.setBackgroundColor(Color.parseColor(context.getString(R.string.default_color)))
        }
    }

    /****************
     * MyRecyclerViewAdapter - RecyclerView to define each row.
     ***************/
    class ViewHolder (view: View): RecyclerView.ViewHolder(view) {
        // Holds the TextView that will add each state to the RecyclerView.
        val tvState = view.tvStateName
        val tvNickName = view.tvStateNickName
        val ivFlag = view.ivStateFlag
        var pos = 0
    }
}