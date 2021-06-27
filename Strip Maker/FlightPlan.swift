//
//  FlightPlan.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import Foundation

struct FlightPlan {
    
    var splitString: [String.SubSequence]
    var cid: String
    
    var aid: String {
        if splitString[1] == "-" {
            return ""
        } else {
            return String(splitString[1])
        }
    }
    
    var type: String {
        if splitString[2] == "-" {
            return ""
        } else {
            return String(splitString[2])
        }
    }
    
    var code: String {
        if splitString[3] == "-" {
            return ""
        } else {
            return String(splitString[3])
        }
    }
    
    var tas: String {
        if splitString[4] == "-" {
            return ""
        } else {
            return "T" + String(splitString[4])
        }
    }
    
    var prev: String {
        if splitString[5] == "-" {
            return ""
        } else {
            return String(splitString[5])
        }
    }
    
    var prevTime: String {
        if splitString[6] == "-" {
            return ""
        } else {
            return String(splitString[6])
        }
    }
    
    var posted: String {
        if splitString[7] == "-" {
            return ""
        } else if splitString[8].contains("P") {
            return splitString[7] + " " + splitString[8]
        } else {
            return String(splitString[7])
        }
    }
    
    var postedTimeMin: String {
        if (splitString[8] == "-" || splitString[8].contains("P")) {
            return ""
        } else {
            return String(splitString[8].suffix(2))
        }
    }
    
    var postedTimeHour: String {
        if (splitString[8] == "-" || splitString[8].contains("P")) {
            return ""
        } else {
            return String(splitString[8].dropLast(2).suffix(2))
        }
    }
    
    var next: String {
        if splitString[9] == "-" {
            return ""
        } else {
            return String(splitString[9])
        }
    }
    
    var nextTime: String {
        if splitString[10] == "-" {
            return ""
        } else {
            return String(splitString[10])
        }
    }
    
    var alt: String {
        if (splitString[11] == "-" || splitString[8].contains("P")) {
            return ""
        } else {
            return String(splitString[11])
        }
    }
    
    var reqAlt: String {
        if (splitString[11] == "-" || !splitString[8].contains("P")) {
            return ""
        } else {
            return String(splitString[11])
        }
    }
    
    var route: String {
        if splitString[12] == "-" {
            return ""
        } else {
            return String(splitString[12]
                            .replacingOccurrences(of: "..", with: " ")
                            .replacingOccurrences(of: ".",  with: " "))
        }
    }
}
