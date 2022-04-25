//
//  MainView.swift
//  countdown_timer
//
//  Created by asora on 2021/09/13.
//

import SwiftUI
import AudioToolbox

struct MainView: View {
    @EnvironmentObject var timeManager: TimeManager

    var body: some View {
        ZStack {
            if timeManager.isProgressBarOn {
                ProgressBarView()
            }
            
            if timeManager.timerStatus == .stopped {
                PickerView()
            } else {
                TimerView()
            }

            VStack {
                Spacer()
                ZStack {
                    ButtonsView()
                        .padding(.bottom)
                //設定ボタンを追加
                SettingButtonView()
                    .padding(.bottom)
                    //isSettingプロパティがtrueになったらSettingViewをモーダルで表示
                    .sheet(isPresented: $timeManager.isSetting) {
                        SettingView()
                            .environmentObject(self.timeManager)
                    }
                }
            }
        }
        
        //指定した時間（1秒）ごとに発動するtimerをトリガーにしてクロージャ内のコードを実行
       .onReceive(timeManager.timer) { _ in
           //タイマーステータスが.running以外の場合何も実行しない
           guard self.timeManager.timerStatus == .running else { return }
           //残り時間が0より大きい場合
           if self.timeManager.duration > 0 {
               //残り時間から -0.05 する
            self.timeManager.duration -= 0.05
               //残り時間が0以下の場合
           } else {
                //タイマーステータスを.stoppedに変更する
                self.timeManager.timerStatus = .stopped
                //アラーム音を鳴らす
                if timeManager.isAlarmOn {
                    AudioServicesPlayAlertSoundWithCompletion(self.timeManager.soundID, nil)
                }
                //バイブレーションを作動させる
                if timeManager.isVibrationOn {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
                }
           }
       }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environmentObject(TimeManager())
        }
    }
}
