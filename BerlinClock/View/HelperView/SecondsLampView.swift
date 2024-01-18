//
//  SecondsLampView.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 18/01/24.
//

import SwiftUI

struct SecondsLampView: View {
    let lamp: Lamp

    var body: some View {
        Circle()
            .fill(lamp.color)
            .frame(width: 70, height: 70)
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct SecondsLampView_Previews: PreviewProvider {
    static var previews: some View {
        SecondsLampView(lamp: .yellow)
    }
}
