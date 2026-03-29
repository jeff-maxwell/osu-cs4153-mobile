package edu.okstate.cs.mobile.maxwell.jeff.m02.m02_maxwell_jeff

import android.graphics.drawable.ClipDrawable.HORIZONTAL
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.support.v7.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*
import android.support.v7.widget.DividerItemDecoration

/****************
 * MainActivity - Main Application
 * Implements the MyInterface defined in the RecyclerViewAdapter so the
 * application can push changes from the RecyclerViewAdapter to the MainActivity
 ***************/
class MainActivity : AppCompatActivity(), MyRecyclerViewAdapter.MyInterface {

    // Define an instance of the Common class
    var common = Common()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Load the list of States
        common.loadStates()

        // Set the Score (Initially 0 / 50)
        tvCount.text = common.getCounter()

        // Create an DividerItemDecoration element and add it to the
        // RecyclerView so there is a Horizontal line between each row
        val itemDecor = DividerItemDecoration(this, HORIZONTAL)
        rvStates.addItemDecoration(itemDecor)

        // Creates a vertical Layout Manager
        rvStates.layoutManager = LinearLayoutManager(this)

        // Access the RecyclerView Adapter and
        // load the data into it
        rvStates.adapter = MyRecyclerViewAdapter(GlobalVariables.states, this)

        // Reset button prompts user and reloads data if "Yes" is selected.
        btnResetGame.setOnClickListener {
            val builder = AlertDialog.Builder(this@MainActivity)

            // Set the alert dialog title
            builder.setTitle("Please Verify")

            // Display a message on alert dialog
            builder.setMessage("Do you want to reset the game?")

            // Display a negative button on alert dialog
            builder.setNegativeButton("NO"){ dialog, which ->
                // Take NO action just close the dialog
            }

            // Set a positive button and its click listener on alert dialog
            builder.setPositiveButton("YES"){ dialog, which ->
                // Reset the Counter to Zero
                GlobalVariables.counter = 0

                // Set the TextView value on the screen to the counter (# / 50)
                this.tvCount.text = this.common.getCounter()

                // Get the count of the State ArrayList items for the loop
                var stateTotal = GlobalVariables.states.count() - 1

                // Loop through all the States and set the isFound back to false
                for (i in 0..stateTotal) {
                    GlobalVariables.states[i].isFound = false
                }

                // Set the RecyclerView Adapter and load the data.
                rvStates.adapter = MyRecyclerViewAdapter(GlobalVariables.states, this)

            }

            // Make the alert dialog using builder
            val dialog: AlertDialog = builder.create()

            // Display the alert dialog on app interface
            dialog.show()
        }

    }

    // changeCountTextView - Interface Implementation from RecyclerView
    override fun changeCountTextView() {
        // Set the current TextView Counter value
        this.tvCount.text = common.getCounter()
    }

}
