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
            
            //MARK: TEXTFIELD
            
            TextField("FP [aid] [typ] [bcn] [tas] [prev] [prev time] [posted] [posted time] [next] [next time] [alt] [rte]", text: $flightPlanString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.allCharacters)
                .disableAutocorrection(true)
                .padding(.top, 20)
                .padding()
            
            HStack {
                                
                Spacer()
                
                //MARK: FP BUTTON

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
                
                //MARK: * BUTTON
                
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
                
                //MARK: – BUTTON
                
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
                
                //MARK: CREATE BUTTON

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
                
                //MARK: DELETE BUTTON

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
            
            //MARK: STRIP LIST
            
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
