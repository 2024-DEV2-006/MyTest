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
    @Published var berlinClockLamps: BerlinClockLamps = BerlinClockLamps.emptyclock
    @Published var digitalTime: String = "00:00:00"
    
    private let berlinClockModel: BerlinClockModelProtocol
    private var timer: AppTimerProtocol
    
    init(berlinClockModel: BerlinClockModelProtocol, timer: AppTimerProtocol) {
        self.berlinClockModel = berlinClockModel
        self.timer = timer
    }
    
    private func convertToBerlinTime(_ date: Date) {
        digitalTime = date.toString()
        berlinClockLamps = berlinClockModel.convertToBerlinTime(date)
    }
}

extension BerlinClockViewModel {
    
    func startTimer() {
        timer.startTimer { [weak self] date in
            self?.convertToBerlinTime(date)
        }
    }
    
    func stopTimer() {
        timer.stopTimer()
    }
}


