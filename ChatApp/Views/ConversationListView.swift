//
//  ContentView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ConversationListView: View {
        
    @EnvironmentObject var model: AppStateModel
    @State var otherUserName = ""
    @State var showChat = false
    @State var showSearch = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(model.conversations, id: \.self) { name in
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
                    NavigationLink(isActive: $showSearch) {
                        SearchView { name in
                            self.showSearch = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.showChat = true
                                self.otherUserName = name
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
            .onAppear {
                guard model.auth.currentUser != nil else {
                    return
                }
                
                model.getConversations()
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
