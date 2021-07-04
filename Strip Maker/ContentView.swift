//
//  ContentView.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var flightPlanString: String = ""
    @State var strips = [Strip]()
    
    var body: some View {
        
        VStack {
            TextField("Enter flight plan message...", text: $flightPlanString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.allCharacters)
                .disableAutocorrection(true)
                .padding(.top, 20)
                .padding()
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    flightPlanString.append("FP ")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .frame(width: 40)
                        Text("FP")
                            .padding(.vertical, 8)
                    }
                    .foregroundColor(Color(UIColor(named: "CustomColor")!))
                    
                })
                .fixedSize(horizontal: true, vertical: true)
                
                Button(action: {
                    flightPlanString.append("* ")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .frame(width: 40)
                        Text("*")
                            .padding(.vertical, 8)
                    }
                    .foregroundColor(Color(UIColor(named: "CustomColor")!))
                })
                .fixedSize(horizontal: true, vertical: true)
                
                Button(action: {
                    flightPlanString.append("- ")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .frame(width: 40)
                        Text("–")
                            .padding(.vertical, 8)
                    }
                    .foregroundColor(Color(UIColor(named: "CustomColor")!))
                })
                .fixedSize(horizontal: true, vertical: true)
                
                Spacer()
                
                Button(action: {
                    if let flightPlan = FlightPlan(flightPlanString) {
                        strips.append(Strip(flightPlan))
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .frame(width: 120)
                        Text("Create Strip")
                            .padding(.vertical, 8)
                    }
                    .foregroundColor(.blue)
                })
                .fixedSize(horizontal: true, vertical: true)
                
                Spacer()
                
                Button(action: {
                    strips = [Strip]()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .frame(width: 120)
                        Text("Delete All")
                            .padding(.vertical, 8)
                    }
                    .foregroundColor(.red)
                })
                .fixedSize(horizontal: true, vertical: true)
                
                Spacer()
            }
            List(strips, id: \.id) { strip in
                strip
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
