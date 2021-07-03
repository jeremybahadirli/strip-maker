//
//  FlightPlan.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import Foundation

struct FlightPlan {
    
    var splitString: [String.SubSequence]

    let cid = String(format: "%03d", Int.random(in: 0...999))

    var aid:            String = ""
    var type:           String = ""
    var code:           String = ""
    var tas:            String = ""
    var prev:           String = ""
    var prevTime:       String = ""
    var next:           String = ""
    var nextTime:       String = ""
    var posted:         String = ""
    var postedTimeMin:  String = ""
    var postedTimeHour: String = ""
    var alt:            String = ""
    var reqAlt:         String = ""
    var route:          String = ""

    init?(_ string: String) {
        splitString = string.split(separator: " ")
        if (splitString.count == 13 && splitString[0] == "FP") {
            
            for i in 1..<self.splitString.count {
                if self.splitString[i] == "-" {
                    self.splitString[i] = ""
                }
            }
        } else {
            return nil
        }
        
        //MARK: AID
        
        if splitString[1] == "*" {
            let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            aid = "N" +
                String(Int.random(in: 10...999)) +
                String((0..<Int.random(in: 0...2)).map{ _ in letters.randomElement()! })
        } else {
            aid = String(splitString[1])
        }
        
        //MARK: TYPE

        if splitString[2] == "*" {
            let types    = ["C172", "C182", "PA32", "PA46", "SR22", "BE36"]
            let suffixes = ["/A", "/I", "/G"]
            type = types.randomElement()! + suffixes.randomElement()!
        } else {
            type = String(splitString[2])
        }
        
        //MARK: CODE

        if splitString[3] == "*" {
            let digits = "01234567"
            code = String((0..<4).map{ _ in digits.randomElement()! })
        } else {
            code = String(splitString[3])
        }
        
        //MARK: TAS
        
        if splitString[4] == "*" {
            tas = "T" + String(Int.random(in: 90/5...450/5) * 5)
        } else if splitString[4] != "" {
            tas = "T" + String(splitString[4])
        } else {
            tas = ""
        }
        
        //MARK: PREV PREVTIME NEXT NEXTTIME
        
        prev =     String(splitString[5])
        prevTime = String(splitString[6])
        next =     String(splitString[9])
        nextTime = String(splitString[10])

        //MARK: POSTED
        
        if splitString[8].contains("P") {
            posted = splitString[7] + " " + splitString[8]
        } else {
            posted = String(splitString[7])
        }
        
        //MARK: POSTEDTIMEMIN
        
        if splitString[8].contains("P") {
            postedTimeMin = ""
        } else {
            postedTimeMin = String(splitString[8].suffix(2))
        }
        
        //MARK: POSTEDTIMEHOUR

        if splitString[8].contains("P") {
            postedTimeHour = ""
        } else {
            postedTimeHour = String(splitString[8].dropLast(2).suffix(2))
        }
        
        //MARK: ALT
        
        if splitString[8].contains("P") {
            alt = ""
        } else if splitString[11] == "*" {
            alt = String(Int.random(in: 50/10...230/10) * 10)
        } else {
            alt = String(splitString[11])
        }
        
        //MARK: REQALT

        if !splitString[8].contains("P") {
            reqAlt = ""
        } else if splitString[11] == "*" {
            reqAlt = String(Int.random(in: 50/10...230/10) * 10)
        } else {
            reqAlt = String(splitString[11])
        }
        
        //MARK: ROUTE
        
        route = String(splitString[12]
                .replacingOccurrences(of: "..", with: " ")
                .replacingOccurrences(of: ".",  with: " "))
    }
}
