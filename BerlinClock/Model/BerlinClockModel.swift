//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

struct BerlinClockModel {
    
    func convertToBerlinTime(_ date: Date) -> String {
        
        let time = date.getTimeComponents()
        
        return checkSecondsLamp(seconds: time.seconds)
        
    }
    
    func checkSecondsLamp(seconds: Int) -> String{
        ((seconds % 2) == 0) ? "Y" : "O"
    }
    
}
