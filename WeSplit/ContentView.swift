//
//  ContentView.swift
//  WeSplit
//
//  Created by Cumulations Technologies Private Limited on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAmount = 0
    @State private var tipPercentage = 0
    @State private var totalMembers = 1
    let tipArray = [0, 5, 10, 15, 20, 25]
    
    var totalPayableBill : Double {
        let totalAmount = Double(totalAmount)
        let tipAmount = totalAmount * Double(tipPercentage)/100.0
        return Double(totalAmount + tipAmount)/Double(totalMembers)
    }
    var body: some View {
        NavigationStack{
            Form{
                
                Section{
                    TextField("Enter total bill", value: $totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                } header: {
                    Text("Actual bill")
                        .textCase(.none)
                }
                
                Section{
                    Picker("Would you like to leave us a tip?", selection: $tipPercentage) {
                        ForEach(tipArray, id: \.self){ tip in
                            Text(tip, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Would you like to leave us a tip?")
                        .textCase(.none)
                }
                
                Section{
                    Picker("Total people to share the bill", selection: $totalMembers) {
                        ForEach(1...8, id: \.self){ tip in
                            Text(tip, format: .number)
                        }
                    }
                }
                Section{
                    Text(totalPayableBill, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))

                } header: {
                    Text("Net payable amount")
                }
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
