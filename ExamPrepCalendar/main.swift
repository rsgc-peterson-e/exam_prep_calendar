import Foundation

/*
 
 ORGANIZING YOUR SOLUTION
 
 A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.
 
 The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?
 
 */

/*
 
 INPUT
 
 Be sure that your implementation of this section discards all the possible bad inputs the user could provide.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
var inputToProcess : String = ""

struct BoundPair { // pairs the upper and lower bounds for a given day input
    var upper : Int?
    var lower : Int
}

struct InputStruct {
    var bounds : BoundPair
    var prompt : String
    var input : Int?
}

var inputData = [InputStruct]()
// add structs containing all the data needed for each prompt and input collection
inputData.append(InputStruct(bounds: BoundPair(upper : 7, lower : 1), prompt: "Enter Day: ", input: nil))
inputData.append(InputStruct(bounds: BoundPair(upper : 31, lower : 28), prompt: "Enter the number of days in the month: ", input: nil))
inputData.append(InputStruct(bounds: BoundPair(upper : inputData[inputData.count - 1].input, lower : 1), prompt: "Enter the Special Day: ", input: nil))

var i = 0
// Loop until valid input is received
while inputData[inputData.count - 1].input == nil {
    
    // Show the prompt
    print(inputData[i].prompt, terminator: "\n")
    
    // Get the user's input
    var input : String?
    input = readLine()
    
    // Use optional binding to see if the string can be unwrapped (to see if it is not nil)
    if let notNilInput = input {
        if let inputAsInt = Int(notNilInput) {
            if inputAsInt >= inputData[i].bounds.lower && inputAsInt <= inputData[i].bounds.upper! {
                inputData[i].input = inputAsInt
                if (i == 1) {
                    inputData[i + 1].bounds.upper = inputData[i].input
                }
                i += 1
            }
        }
    }
    
}

/*
 
 PROCESS
 
 Here is where you implement the logic that solves the problem at hand.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'process' code below....

var output : String = "Sun Mon Tue Wed Thu Fri Sat\n"

// get number of spaces needed before printing can start on the second line of the calendar
func getSpace(weekDay : Int) -> Int {
    switch weekDay {
    case 1:
        return 0
    case 2:
        return 4
    case 3:
        return 8
    case 4:
        return 12
    case 5:
        return 16
    case 6:
        return 20
    case 7:
        return 24
    default:
        return 1
    }
}
// add spaces to ensure start at the correct position
var spaceNum = getSpace(weekDay: inputData[0].input!)
func addSpaces(_ n : Int) {
    if (n != 0) {
        for i in 1...n {
            output.append(" ")
        }
    }
}
//output.append("\n")
addSpaces(spaceNum)

//for i in 1...inputData[1].input! {
//    if (i == 1) {
//        addSpaces(2)
//    } else if (i == 8) {
//        output.append("\n")
//        addSpaces(2)
//    } else if (i < 10) {
//        addSpaces(3)
//    } else {
//        addSpaces(2)
//    }
//    output.append("\(i)")
//}
//output.append("\n")

var newLineVals : [Int : Int] = [
    1 : 8,
    2 : 7,
    3 : 6,
    4 : 5,
    5 : 4,
    6 : 3,
    7 : 2,
    8 : 1,
]

for i in 1...inputData[1].input! {
    if (i == 1) {
        if (i == inputData[2].input!) {
            addSpaces(1)
        } else {
            addSpaces(2)
        }
    } else if (i == newLineVals[inputData[0].input!] || i == (7 + newLineVals[inputData[0].input!]!) || i == (14 + newLineVals[inputData[0].input!]!) || i == (21 + newLineVals[inputData[0].input!]!) || i == (28 + newLineVals[inputData[0].input!]!)) {
        output.append("\n")
        //addSpaces(2)
        if (i < 10) {
            if i == inputData[2].input! {
                addSpaces(1)
            } else {
                addSpaces(2)
            }
        } else {
            if i != inputData[2].input! {
                addSpaces(1)
            }
        }
    } else if (i < 10) {
        if i == inputData[2].input! {
            addSpaces(2)
        } else {
            addSpaces(3)
        }
    } else {
        if i == inputData[2].input! {
            addSpaces(1)
        } else {
            addSpaces(2)
        }
    }
    if i == inputData[2].input! {
        output.append("*\(i)")
    } else {
        output.append("\(i)")
    }
}
output.append("\n")


/*
 
 OUTPUT
 
 Here is where you report the results of the 'process' section above.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'output' code below... replace what is here as needed.
print(output, terminator: "")
