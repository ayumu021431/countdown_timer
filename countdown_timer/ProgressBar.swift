//
//  ProgressBar.swift
//  countdown_timer
//
//  Created by asora on 2021/09/14.
//

import SwiftUI

struct ProgressBarView: View {
    @EnvironmentObject var timeManager: TimeManager

    var body: some View {
        ZStack {
            //背景用の円
            Circle()
                .stroke(Color(.darkGray), style: StrokeStyle(lineWidth: 20))
                .scaledToFit()
                .padding(15)
            
            //プログレスバー用の円
            Circle()
                .trim(from: 0, to: CGFloat(self.timeManager.duration / self.timeManager.maxValue))
                .stroke(Color(.cyan), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                .scaledToFit()
                //輪郭線の開始位置を12時の方向にする
                .rotationEffect(Angle(degrees: -90))
                .padding(15)
            
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
            .environmentObject(TimeManager())
            .previewLayout(.sizeThatFits)
    }
}
