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
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    var otherUsername = ""
    var conversationListener: ListenerRegistration?
    
    init() {
        showingSignIn = Auth.auth().currentUser == nil
    }
}

// Search

extension AppStateModel {
    func searchUsers(query: String, completion: @escaping ([String]) -> Void) {
        database.collection("users")
            .getDocuments { snapshot, error in
                guard let usernames = snapshot?.documents.compactMap({ $0.documentID }),
                      error == nil else {
                    completion([])
                    return
                }
                
                let filtered = usernames.filter {
                    $0.lowercased().hasPrefix(query.lowercased())
                }
                
                completion(filtered)
            }
    }
}

// Conversations

extension AppStateModel {
    func getConversations() {
        // Listen for conversations
        
        conversationListener = database
            .collection("users")
            .document(currentUsername)
            .collection("chats").addSnapshotListener { [weak self] snapshot, error in
                guard let usernames = snapshot?.documents.compactMap({ $0.documentID }),
                      error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.conversations = usernames
                }
            }
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
        // Get email from database
        database.collection("users")
            .document(username)
            .getDocument { [weak self] snapshot, error in
                guard let email = snapshot?.data()?["email"] as? String,
                      error == nil else {
                    return
                }
                
                // Try to sign in
                self?.auth.signIn(withEmail: email, password: password) { result, error in
                    guard result != nil, error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentEmail = email
                        self?.currentUsername = username
                        self?.showingSignIn = false
                    }
                }
            }
    }
    
    func signUp(email: String, username: String, password: String) {
        // Create Account
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Insert user to database
            let data = [
                "email" : email,
                "username" : username
            ]
            
            self?.database
                .collection("users")
                .document(username)
                .setData(data) { error in
                    guard error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentUsername = username
                        self?.currentEmail = email
                        self?.showingSignIn = false
                    }
                }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.showingSignIn = true
        } catch {
            print(error)
        }
    }
}
