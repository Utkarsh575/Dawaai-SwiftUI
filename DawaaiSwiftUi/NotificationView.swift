//
//  NotificationView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 23/02/24.
//

import SwiftUI
import UserNotifications


class NotifiacationManager{
    static let instance = NotifiacationManager()
    
    func requestAuthorisation(){
        let options : UNAuthorizationOptions = [.alert , .sound , .badge]
        UNUserNotificationCenter.current().requestAuthorization(options:options){
            (success,error) in
            if let error = error {
                print("ERROR \(error)")
            } else{
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "🚨DAWAAI TIME🚨 "
        content.subtitle = "Take DOLO 650"
        content.sound = .default
        content.badge = 1
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 15
        dateComponents.minute = 46
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct NotificationView: View {
    var body: some View {
        VStack (spacing:40){
            Button("Request Premission"){
                NotifiacationManager.instance.requestAuthorisation()
                
            }
            
            Button("Schedule notif "){
                NotifiacationManager.instance.scheduleNotification()
                
            }
            
        }
    }
}

#Preview {
    NotificationView()
}

