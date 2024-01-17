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
    var berlinClockLamps: BerlinClockLamps = BerlinClockLamps()

    private let berlinClockModel = BerlinClockModel()

    func convertToBerlinTime(_ date: Date) {
        berlinClockLamps = berlinClockModel.convertToBerlinTime(date)
    }
}


