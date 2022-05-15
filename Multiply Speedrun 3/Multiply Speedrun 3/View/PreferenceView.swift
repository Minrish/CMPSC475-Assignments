//
//  PreferenceView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI


struct PreferenceView : View {
    @Binding var isShowingPreference : Bool
    @Binding var questionNumber : Int
    @Binding var preference : PreferenceModel
        
    var body: some View{
        NavigationView {
            Form {
                Section(header: Text("Arthimetic operation").foregroundColor(ViewConstants.textSettingsColor)) {
                    VStack {
                        Picker("Operation", selection: $preference.operation) {
                            ForEach(Operation.allCases){
                                Text($0.rawValue).tag($0).foregroundColor(ViewConstants.textSettingsColor)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Text("Selected value is: \(preference.operation.rawValue)").padding().foregroundColor(ViewConstants.textSettingsColor)
                    }
                }
                
                Section(header: Text("Difficulty").foregroundColor(ViewConstants.textSettingsColor)) {
                    VStack {
                        Picker("Difficulty", selection: $preference.difficulty) {
                            ForEach(Difficulty.allCases) {
                                Text($0.rawValue).tag($0).foregroundColor(ViewConstants.textSettingsColor)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Text("Selected value is: \(preference.difficulty.rawValue)").padding().foregroundColor(ViewConstants.textSettingsColor)
                    }
                }
                Section(header: Text("Number of questions").foregroundColor(ViewConstants.textSettingsColor)) {
                    Stepper(value: $questionNumber,
                            in: 3...7,
                            label: {
                                Text("\(self.questionNumber) questions").foregroundColor(ViewConstants.textSettingsColor)
                    })
                }
                
                Section() {
                    HStack {
                        Spacer()
                        Button("Done"){
                            self.isShowingPreference.toggle()
                        }.foregroundColor(ViewConstants.textSettingsColor)
                        Spacer()
                    }
                }.navigationBarTitle("Settings")
            }
        }
        
    }
    
}
