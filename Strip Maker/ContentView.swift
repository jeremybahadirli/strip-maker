//
//  ContentView.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    
    @State var flightPlanString: String = ""
    @State var strips = [Strip]()
    
    var body: some View {
        
        VStack {
            TextField("Enter flight plan message...", text: $flightPlanString)
                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                .autocapitalization(.allCharacters)
                .disableAutocorrection(true)
                .padding(.top, 20)
                .padding()
            
            HStack(spacing: 90){
                Button(action: {
                    var splitString: [String.SubSequence] { flightPlanString.split(separator: " ") }
                    if (splitString.count == 13) {
                        strips.append(Strip(flightPlan: FlightPlan(splitString: splitString)))
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .foregroundColor(.blue)
                            .frame(width: 120)
                        Text("Create Strip")
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                    }
                })
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    strips = [Strip]()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .opacity(0.2)
                            .foregroundColor(.red)
                            .frame(width: 120)
                        Text("Delete All")
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .foregroundColor(.red)
                    }
                })
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                
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

