//
//  ContentView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ConversationListView: View {
    
    let usernames = ["Joe", "John", "Jack"]
    
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
            }
            .navigationTitle("Conversations")
        }
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
