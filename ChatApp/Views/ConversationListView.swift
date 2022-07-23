//
//  ContentView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ConversationListView: View {
    
    let usernames = ["Joe", "John", "Jack"]
    
    @EnvironmentObject var model: AppStateModel
    @State var otherUserName = ""
    @State var showChat = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(usernames, id: \.self) { name in
                    NavigationLink {
                        ChatView(otherUserName: name)
                    } label: {
                        HStack {
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundColor(Color.pink)
                            
                            Text(name)
                                .bold()
                                .foregroundColor(Color(.label))
                                .font(.system(size: 32))
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                
                if !otherUserName.isEmpty {
                    NavigationLink(
                        "",
                        destination: ChatView(otherUserName: otherUserName),
                        isActive: $showChat
                    )
                }
            }
            .navigationTitle("Conversations")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button("Sign Out") {
                        self.signOut()
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    NavigationLink {
                        SearchView { name in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.otherUserName = name
                                self.showChat = true
                            }
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            .fullScreenCover(isPresented: $model.showingSignIn) {
                SignInView()
            }
        }
    }
    
    func signOut() {
        model.signOut()
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
