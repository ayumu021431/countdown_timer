//
//  SettingButtonView.swift
//  countdown_timer
//
//  Created by asora on 2021/09/13.
//

import SwiftUI

struct SettingButtonView: View {
    @EnvironmentObject var timeManager: TimeManager

    var body: some View {
        Image(systemName: "ellipsis.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .onTapGesture {
                self.timeManager.isSetting = true
            }
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButtonView()
            .environmentObject(TimeManager())
            .previewLayout(.sizeThatFits)
    }
}
