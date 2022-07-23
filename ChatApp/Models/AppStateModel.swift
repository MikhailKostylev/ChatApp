//
//  AppStateModel.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppStateModel: ObservableObject {
    
    @AppStorage("currentUsername") var currentUsername = ""
    @AppStorage("currentEmail") var currentEmail = ""
    
    @Published var showingSignIn = true
    @Published var conversation: [String] = []
    @Published var messages: [Message] = []
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    var otherUsername = ""
}

// Search

extension AppStateModel {
    func searchUsers(query: String, completion: @escaping ([String]) -> Void) {
        
    }
}

// Conversations

extension AppStateModel {
    func getConversations() {
        
    }
}

// Get Chat / Send Messages

extension AppStateModel {
    func observeChat() {
        
    }
    
    func sendMessage(text: String) {
        
    }
    
    func createConversationIfNeeded() {
        
    }
}

// Sign In & Sign Up & Sign Out

extension AppStateModel {
    func signIn(username: String, password: String) {
        
    }
    
    func signUp(email: String, username: String, password: String) {
        
    }
    
    func signOut() {
        
    }
}
