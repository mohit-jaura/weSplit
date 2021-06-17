//
//  ContentView.swift
//  WeSplit
//
//  Created by APPLE on 01/06/21.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmout = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [0,5,10,15,20]
    var totalPerPerson:Double{
        let peopleCount = Double(Int(numberOfPeople) ?? 0 + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmout) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }

    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter Amount", text:$checkAmout)
                        .keyboardType(.decimalPad)
//                    Picker("Number of people", selection:$numberOfPeople){
//                        ForEach(2..<100){
//                            Text("\($0) people")
//                            }
//                        }
                    TextField("Number of people(default 2)", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                        
                    }
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection:$tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per person")){
                    Text("$ \(totalPerPerson, specifier:"%.2f")")
                }
            }.navigationBarTitle("We Split",displayMode: .large)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
