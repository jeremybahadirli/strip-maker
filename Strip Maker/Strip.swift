//
//  Strip.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import SwiftUI

struct Strip: View, Identifiable {
    
    var flightPlan: FlightPlan
    var id = UUID()
    
    var body: some View {
        
        GeometryReader { strip in
            HStack(spacing: 0) {
                
                /* * * * * COLUMN 1 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.aid)
                        Text(flightPlan.type)
                        Text(flightPlan.tas)
                        Spacer()
                        Text(flightPlan.cid)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.15)
                .border(Color(UIColor(named: "CustomColor")!))
                
                /* * * * * COLUMN 2 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.prev)
                        Text(flightPlan.prevTime)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.09)
                .border(Color(UIColor(named: "CustomColor")!))
                
                /* * * * * COLUMN 3 * * * */
                
                GeometryReader { fix in
                    VStack(spacing: 0) {
                        
                        /* * * * * ROW 1 * * * */
                        
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Spacer()
                                    Text(flightPlan.postedTimeMin)
                                    Spacer()
                                }
                                Text(flightPlan.postedTimeHour)
                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                        .padding(.leading, 8)
                        .frame(height: fix.size.height * 0.55)
                        .border(Color(UIColor(named: "CustomColor")!))
                        .font(.title)
                        
                        /* * * * * ROW 2 * * * */
                        
                        HStack(spacing: 0) {
                            Rectangle()
                                .frame(width: fix.size.width * 0.35)
                                .colorInvert()
                                .border(Color(UIColor(named: "CustomColor")!))
                            Rectangle()
                                .colorInvert()
                                .border(Color(UIColor(named: "CustomColor")!))
                        }
                        
                        /* * * * * ROW 3 * * * */
                        
                        HStack {
                            Text(flightPlan.posted)
                            Spacer()
                        }
                        .padding(.leading, 8)
                        .frame(maxHeight: .infinity)
                        .border(Color(UIColor(named: "CustomColor")!))
                    }
                }
                .frame(width: strip.size.width * 0.16)
                
                /* * * * * COLUMN 4 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.alt)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.12)
                .border(Color(UIColor(named: "CustomColor")!))
                
                /* * * * * COLUMN 5 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.next)
                        Text(flightPlan.nextTime)
                        Spacer()
                        Text(flightPlan.reqAlt)
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.09)
                .border(Color(UIColor(named: "CustomColor")!))
                
                /* * * * * COLUMN 6 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.route)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.27)
                .border(Color(UIColor(named: "CustomColor")!))
                
                /* * * * * COLUMN 7 * * * */
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.code)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(maxWidth: .infinity)
                .border(Color(UIColor(named: "CustomColor")!))
            }
        }
        .border(Color(UIColor(named: "CustomColor")!), width: 2)
        .aspectRatio(4.9, contentMode: .fit)
    }
}
