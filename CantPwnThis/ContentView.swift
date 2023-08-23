//
//  ContentView.swift
//  CantPwnThis
//
//  Created by Dmitry on 21.08.2023.
//

import SwiftUI
import CoreData

// class
var password = passwordGeneration()


struct ContentView: View {
    
    
    // variables for password options
    @State var lowerState = true
    @State var upperState = false
    @State var numberState = true
    @State var specialState = false
    @State var passwordLength = 15
    
    
    @State var revealPassword = false
    // turns password to stars if revealPassword is false
    // maybe I could've used secure test field? who knows
    @State var insecurePassword = ""
    @State var securePassword = ""
    // variable to make an Int Slider
    var intSlider: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(passwordLength)
        }, set: {
            //rounds the double to an Int
            print($0.description)
            passwordLength = Int($0)
        })
    }
        // UI body
        var body: some View {
            VStack {
                Spacer()
                VStack {
                    Text("CantPwnThis")
                        .bold().font(.largeTitle)
                    Text("Secure Password Generator")
                        .font(.caption).background(Color(red: 0.2, green: 0.2, blue: 0.3))
                }
                Spacer()
                
                HStack{
                    VStack {
                        Text("Generated password")
                        HStack {
                            if !revealPassword {
                                TextField("Your password will appear here", text: $securePassword).frame(width: 343.0).disabled(true).font(.title)
                            } else {
                                TextField("Your password will appear here", text: $insecurePassword).frame(width: 343.0).disabled(false).font(.title)
                            }
                            
                            Toggle(isOn: $revealPassword) {
                                Text("Reveal")
                                
                            }.toggleStyle(.checkbox)
                        }
                    }
                    
                }
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Toggle(isOn: $lowerState) {
                                Text("Lowercase (a-z)")
                            }.toggleStyle(.switch)
                        }
                        HStack {
                            Toggle(isOn: $upperState) {
                                Text("Uppercase (A-Z)")
                            }.toggleStyle(.switch)
                        }
                    }
                    Spacer()
                    VStack {
                        HStack {
                            
                            Toggle(isOn: $numberState) {
                                Text("Numbers (0-9)")
                            }.toggleStyle(.switch)
                        }
                        HStack {
                            
                            Toggle(isOn: $specialState) {
                                Text("Special characters")
                            }.toggleStyle(.switch)
                        }
                    }
                    Spacer()
                }
                Slider(value: intSlider, in: 0.0...30, step: 1.0)
                    .frame(width: 250.0)
                HStack {
                    Spacer()
                    Text("Password length: ")
                    Text("\(passwordLength)")
                    Spacer()
                }
                Spacer()
                Button("Generate") {
                    password.existingPassword = password.generatePass(length: passwordLength, lower: lowerState, upper: upperState, number: numberState, special: specialState)
                    securePassword = String(repeating: "*", count: password.existingPassword.count)
                    insecurePassword = password.existingPassword
                }
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

