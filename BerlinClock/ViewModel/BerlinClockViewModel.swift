//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 17/01/24.
//

import Foundation

import Foundation
import SwiftUI

class BerlinClockViewModel: ObservableObject {
    @Published var berlinClockLamps: BerlinClockLamps
    @Published var digitalTime: String = ""
    
    private let berlinClockModel = BerlinClockModel()
    private var timer: Timer?
    
    init() {
        self.digitalTime = Date().toString()
        self.berlinClockLamps = berlinClockModel.convertToBerlinTime(Date())
    }
    
    func convertToBerlinTime(_ date: Date) {
        digitalTime = date.toString()
        berlinClockLamps = berlinClockModel.convertToBerlinTime(date)
    }
}

extension BerlinClockViewModel {
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.convertToBerlinTime(Date())
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


