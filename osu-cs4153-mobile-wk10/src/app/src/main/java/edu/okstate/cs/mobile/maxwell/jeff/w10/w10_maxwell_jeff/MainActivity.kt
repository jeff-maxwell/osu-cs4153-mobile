package edu.okstate.cs.mobile.maxwell.jeff.w10.w10_maxwell_jeff

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log

import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Call private function to make calls to the Cash Class
        printOutCashValues()
    }

    // Function to print out results of calls using the Cash Class
    private fun printOutCashValues() {
        // Create Instance of Cash Class Initializing to 0.00
        val cash1 = Cash(0.00)
        Log.d("CASH1", cash1.moneyBreakdown)

        // Create Instance of Cash Class Initializing to 47.23
        val cash2 = Cash(47.23)
        Log.d("CASH2", cash2.moneyBreakdown)

        // Create Instance of Cash Class Initializing to 99.99
        val cash3 = Cash(99.99)
        Log.d("CASH3", cash3.moneyBreakdown)

        // Create Instance of Cash Class Initializing to 45.22
        val cash4 = Cash(45.22)
        Log.d("CASH4", cash4.moneyBreakdown)

        // Create Instance of Cash Class Initializing to 67.45
        val cash5 = Cash(67.45)
        Log.d("CASH5", cash5.moneyBreakdown)

        // Create Instance of Cash Class Initializing to 1.45
        val cash6 = Cash(1.45)
        Log.d("CASH6", cash6.moneyBreakdown)
    }

}
