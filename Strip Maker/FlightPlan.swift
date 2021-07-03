//
//  FlightPlan.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import Foundation

struct FlightPlan {
    
    var splitString:   [String.SubSequence]
    
    var isProposal     = false
    
    var aid            = ""
    var type           = ""
    var code           = ""
    var tas            = ""
    var prev           = ""
    var prevTime       = ""
    var next           = ""
    var nextTime       = ""
    var posted         = ""
    var postedTimeMin  = ""
    var postedTimeHour = ""
    var alt            = ""
    var reqAlt         = ""
    var route          = ""
    var arrow          = ""
    
    let cid            = String(format: "%03d", Int.random(in: 0...999))
    
    
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
        
        isProposal = splitString[8].contains("P")
        
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
            let types    = ["C172", "C182", "C210", "PA32", "BE36", "PA24", "SR22", "PA46",
                            "PA32", "BE58", "C421", "PA31",
                            "C208", "PC12",
                            "BE9T", "B190", "SW4", "B350", "C441",
                            "DH8", "SF34", "DH8D"]
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
        }
        
        //MARK: POSTED
        
        if isProposal {
            posted = splitString[7] + " " + splitString[8]
        } else {
            posted = String(splitString[7])
        }
        
        //MARK: POSTEDTIME
        
        if !isProposal {
            postedTimeMin  = String(splitString[8].suffix(2))
            postedTimeHour = String(splitString[8].dropLast(2).suffix(2))
        }
        
        //MARK: ALT
        
        if !isProposal {
            if splitString[11] == "*" {
                alt = String(Int.random(in: 50/10...230/10) * 10)
            } else {
                alt = String(splitString[11])
            }
        }
        
        //MARK: REQALT
        
        if isProposal {
            if splitString[11] == "*" {
                reqAlt = String(Int.random(in: 50/10...230/10) * 10)
            } else {
                reqAlt = String(splitString[11])
            }
        }
        
        //MARK: ARROW
        
        if isProposal {
            arrow = "↑"
        } else if String(route.split(separator: " ").last!.suffix(3)) == posted.suffix(3) {
            arrow = "↓"
        }

        //MARK: REST
        
        prev     = String(splitString[5])
        prevTime = String(splitString[6])
        next     = String(splitString[9])
        nextTime = String(splitString[10])
        route    = String(splitString[12]
                            .replacingOccurrences(of: "..",  with: " ")
                            .replacingOccurrences(of: ".",   with: " ")
                            .replacingOccurrences(of: " / ", with: "./."))
    }
}
