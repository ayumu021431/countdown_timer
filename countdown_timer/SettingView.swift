//
//  SettingView.swift
//  countdown_timer
//
//  Created by asora on 2021/09/13.
//

import SwiftUI

struct SettingView: View {
    //モーダルシートを利用するためのプロパティ
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var timeManager: TimeManager

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Alarm:")) {
                    Toggle(isOn: $timeManager.isAlarmOn) {
                        Text("Alarm Sound")
                    }
                    Toggle(isOn: $timeManager.isVibrationOn) {
                        Text("Vibration")
                    }
                    NavigationLink(destination: SoundListView()) {
                        HStack {
                           //設定項目名
                           Text("Sound Selection")
                           Spacer()
                           //現在選択中のアラーム音
                           Text("\(timeManager.soundName)")
                       }
                    }
                }
                Section(header: Text("Animation:")) {
                    Toggle(isOn: $timeManager.isProgressBarOn) {
                        Text("Progress Bar")
                    }
                   
                }
                Section(header: Text("Save:")) {
                    Button(action: {
                        //タップしたらモーダルを閉じる
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Spacer()
                            Text("Done")
                            Image(systemName: "checkmark.circle")
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarTitle("Setting", displayMode: .automatic)
            .navigationViewStyle(DefaultNavigationViewStyle())
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(TimeManager())
    }
}

