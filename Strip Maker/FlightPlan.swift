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
    
    var aid:  String {
        if !(splitString[1] == "-") {
            return String(splitString[1])
        } else {
            return ""
        }
    }
    
    var type: String {
        if !(splitString[2] == "-") {
            return String(splitString[2])
        } else {
            return ""
        }
    }
    
    var code: String {
        if !(splitString[3] == "-") {
            return String(splitString[3])
        } else {
            return ""
        }
    }
    
    var tas:  String {
        if !(splitString[4] == "-") {
            return "T" + String(splitString[4])
        } else {
            return ""
        }
    }
    
    var prev: String {
        if !(splitString[5] == "-") {
            return String(splitString[5])
        } else {
            return ""
        }
    }
    
    var prevTime: String {
        if !(splitString[6] == "-") {
            return String(splitString[6])
        } else {
            return ""
        }
    }
    
    var posted: String {
        if (splitString[7] == "-") {
            return ""
        } else if splitString[8].contains("P") {
            return splitString[7] + " " + splitString[8]
        } else {
            return String(splitString[7])
        }
    }
    
    var postedTimeMin: String {
        if (splitString[8] == "-") {
            return ""
        } else if !splitString[8].contains("P") {
            return String(splitString[8].suffix(2))
        } else {
            return ""
        }
    }
    
    var postedTimeHour: String {
        if (splitString[8] == "-") {
            return ""
        } else if !splitString[8].contains("P") {
            return String(splitString[8].dropLast(2).suffix(2))
        } else {
            return ""
        }
    }
    
    var next: String {
        if !(splitString[9] == "-") {
            return String(splitString[9])
        } else {
            return ""
        }
    }
    
    var nextTime: String {
        if !(splitString[10] == "-") {
            return String(splitString[10])
        } else {
            return ""
        }
    }
    
    var alt: String {
        if (splitString[11] == "-") {
            return ""
        } else if !splitString[8].contains("P") {
            return String(splitString[11])
        } else {
            return ""
        }
    }
    
    var reqAlt: String {
        if (splitString[11] == "-") {
            return ""
        } else if splitString[8].contains("P") {
            return String(splitString[11])
        } else {
            return ""
        }
    }
    
    var route: String {
        if !(splitString[12] == "-") {
            return String(splitString[12]
                            .replacingOccurrences(of: "..", with: " ")
                            .replacingOccurrences(of: ".",  with: " "))
        } else {
            return ""
        }
    }
    
    var rmk: String { String(splitString[13]) }
}
