//
//  ChatView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatView: View {
    
    @State var message: String = ""
    let otherUserName: String
    
    init(otherUserName: String) {
        self.otherUserName = otherUserName
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRow(text: "Hello, World!", type: .sent)
                    .padding(3)
                ChatRow(text: "Hello, World!", type: .received)
                    .padding(3)
            }
            
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
                
                SendButton(text: $message)
            }
            .padding()
        }
        .navigationTitle(otherUserName)
    }
}

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
       return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUserName: "Bob")
            .preferredColorScheme(.dark)
    }
}
