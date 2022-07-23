//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegatte.self) var appDelegate: AppDelegatte
    
    var body: some Scene {
        WindowGroup {
            ConversationListView()
                .environmentObject(AppStateModel())
        }
    }
}

class AppDelegatte: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        print("Did launch")
        
        FirebaseApp.configure()
        
        return true
    }
}
