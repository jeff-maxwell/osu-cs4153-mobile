package edu.okstate.cs.mobile.maxwell.jeff.w10.w10_maxwell_jeff

// Assign the value passed in to the private amount variable
// Class Constructor that takes in the amount to break down
class Cash(private var amount: Double) {

    // Private Variables

    // bills: Integer Array initialized to all ZEROs
    private var bills: IntArray = intArrayOf(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    // moneyBreakdown: String to show the output of the bills
    public var moneyBreakdown: String = ""

    // denominations: Integer Array of Denominations (X 100) for rounding
    private val denominations: IntArray = intArrayOf(5000, 2000, 1000, 500, 100, 25, 10, 5, 1)


    // Call the breakdown() function to start the split of the amount in the default constructor
    init {
        breakdown()
    }

    // breakdown() function to split out the amount into bills array
    private fun breakdown() {

        // If amount is 0.0 return "nil" then return from function
        if (amount == 0.0) {
            moneyBreakdown = "nil"
            return
        }

        // Multiple the amount by 100 for rounding and assign to workingValue to break down
        var workingValue = amount * 100

        // Loop through all the denominations and determine if a bill is in the position
        for (index in 0..8) {
            // Call countMoney() to see if a bill is in that position
            bills[index] = countMoney(workingValue, denominations[index])

            // If current bills position is greater than ZERO then do a Modulus (%) to get the remainder
            //   and assign it to workingValue for the next loop.
            if (bills[index] > 0)
                workingValue %= denominations[index]
        }

        formatBillsString()
    }

    // countMoney() Determines the number of bills for a current position
    private fun countMoney(moneyAmount: Double, billDenomination: Int): Int {
        val valueCheck: Int = (moneyAmount / billDenomination).toInt()

        // Return the valueCheck if greater than ZERO else return ZERO
        return if (valueCheck > 0) {
            valueCheck
        } else {
            0
        }
    }

    // formatBillsString() loops through the bills array and assigns the results to moneyBreakdown
    private fun formatBillsString() {
        var billsString  = "["

        for(index in 0..8) {
            billsString += bills[index].toString()
            if (index != 8)
                billsString += ", "
        }

        billsString += "]"

        moneyBreakdown = billsString
    }

}
