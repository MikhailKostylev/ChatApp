//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

@main
struct ChatAppApp: App {
    var body: some Scene {
        WindowGroup {
            ConversationListView()
                .environmentObject(AppStateModel())
        }
    }
}
