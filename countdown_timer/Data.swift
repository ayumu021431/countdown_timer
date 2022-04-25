//
//  Data.swift
//  countdown_timer
//
//  Created by asora on 2021/09/11.
//

import SwiftUI
import AudioToolbox

enum TimeFormat {
    case hr
    case min
    case sec
}

enum TimerStatus {
    case running
    case pause
    case stopped
}

struct Sound: Identifiable {
    let id: SystemSoundID
    let soundName: String
}
