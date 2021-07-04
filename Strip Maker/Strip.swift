//
//  Strip.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import SwiftUI

struct Strip: View, Identifiable {
    
    let flightPlan: FlightPlan
    let id = UUID()
    
    init(_ flightPlan: FlightPlan) {
        self.flightPlan = flightPlan
    }
    
    var body: some View {
        
        GeometryReader { strip in
            HStack(spacing: 0) {
                
                //MARK: COLUMN 1
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.aid)
                        Text(flightPlan.type)
                        Text(flightPlan.tas)
                        Spacer()
                        Text(flightPlan.cid)
                            .font(.title)
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.14)
                .border(Color(UIColor(named: "CustomColor")!))
                
                //MARK: COLUMN 2
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.prev)
                        Text(flightPlan.prevTime)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
                .frame(width: strip.size.width * 0.1)
                .border(Color(UIColor(named: "CustomColor")!))
                
                //MARK: COLUMN 3
                
                GeometryReader { fix in
                    VStack(spacing: 0) {
                        
                        //MARK: ROW 1
                        
                        ZStack {
                            VStack {
                                Text(flightPlan.postedTimeMin)
                                HStack {
                                    Text(flightPlan.postedTimeHour)
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                VStack {
                                    Text(flightPlan.arrow)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                        .frame(height: fix.size.height * 0.55)
                        .border(Color(UIColor(named: "CustomColor")!))
                        .font(.title)
                        
                        //MARK: ROW 2
                        
                        HStack(spacing: 0) {
                            Rectangle()
                                .frame(width: fix.size.width * 0.35)
                                .colorInvert()
                                .border(Color(UIColor(named: "CustomColor")!))
                            Rectangle()
                                .colorInvert()
                                .border(Color(UIColor(named: "CustomColor")!))
                        }
                        
                        //MARK: ROW 3
                        
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
                
                //MARK: COLUMN 4
                
                HStack {
                    VStack {
                        Text(flightPlan.alt)
                            .font(.title)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.13)
                .border(Color(UIColor(named: "CustomColor")!))
                
                //MARK: COLUMN 5
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightPlan.next)
                        Text(flightPlan.nextTime)
                        Spacer()
                        Text(flightPlan.reqAlt)
                    }
                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
                .frame(width: strip.size.width * 0.1)
                .border(Color(UIColor(named: "CustomColor")!))
                
                //MARK: COLUMN 6
                
                HStack {
                    VStack {
                        Text(flightPlan.route)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
                .frame(width: strip.size.width * 0.27)
                .border(Color(UIColor(named: "CustomColor")!))
                
                //MARK: COLUMN 7
                
                HStack {
                    VStack {
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

struct Strip_Previews: PreviewProvider {
    static var previews: some View {
        Strip(FlightPlan("FP - - - - - - - - - - - -")!)
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
