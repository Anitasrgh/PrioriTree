import Foundation
import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    UNUserNotificationCenter.current().requestAuthorization(options: options) { (_, error) in if let error = error {
            print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
}

struct LocalNotification: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
                }
        }
    }
}

// struct LocalNotification_Preview: PreviewProvider{
//    static var previews: some View{
//        LocalNotification()
//    }
// }
