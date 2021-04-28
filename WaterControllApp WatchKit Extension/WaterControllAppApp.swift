//
//  WaterControllAppApp.swift
//  WaterControllApp WatchKit Extension
//
//  Created by Физтех.Радио on 23.03.2021.
//

import SwiftUI

@main
struct WaterControllAppApp: App {
    let container = PersistentController.shared.container
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                Home()
                    .environment(\.managedObjectContext, container.viewContext)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
