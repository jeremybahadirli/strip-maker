//
//  FlightPlan.swift
//  Strip Maker
//
//  Created by Jeremy Bahadirli on 6/26/21.
//

import Foundation

struct FlightPlan {
    
    var splitString: [String.SubSequence]
    let cid: String
    
    init(_ splitString: [String.SubSequence]) {
        self.splitString = splitString
        cid = String(Int.random(in: 100...999))
        
        for i in 0..<self.splitString.count {
            if self.splitString[i] == "-" {
                self.splitString[i] = ""
            }
        }
    }
    
    var aid:      String { String(splitString[1])  }
    var type:     String { String(splitString[2])  }
    var code:     String { String(splitString[3])  }
    var prev:     String { String(splitString[5])  }
    var prevTime: String { String(splitString[6])  }
    var next:     String { String(splitString[9])  }
    var nextTime: String { String(splitString[10]) }
    
    var tas:  String {
        if splitString[4] != "" {
            return "T" + String(splitString[4])
        } else {
            return ""
        }
    }
    
    var posted: String {
        if splitString[8].contains("P") {
            return splitString[7] + " " + splitString[8]
        } else {
            return String(splitString[7])
        }
    }
    
    var postedTimeMin: String {
        if splitString[8].contains("P") {
            return ""
        } else {
            return String(splitString[8].suffix(2))
        }
    }
    
    var postedTimeHour: String {
        if splitString[8].contains("P") {
            return ""
        } else {
            return String(splitString[8].dropLast(2).suffix(2))
        }
    }
    
    var alt: String {
        if splitString[8].contains("P") {
            return ""
        } else {
            return String(splitString[11])
        }
    }
    
    var reqAlt: String {
        if splitString[8].contains("P") {
            return String(splitString[11])
        } else {
            return ""
        }
    }
    
    var route: String {
        String(splitString[12]
                .replacingOccurrences(of: "..", with: " ")
                .replacingOccurrences(of: ".",  with: " "))
    }
}
