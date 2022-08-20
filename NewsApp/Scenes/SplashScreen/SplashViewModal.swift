//
//  SplashViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 24.07.2022.
//

import UIKit
import UserNotifications

class SplashViewModal {

    func registerForPushNotifications(action: @escaping () -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .sound, .badge]) { granted, _ in
                    granted ? action() : action()
            }
    }
}
