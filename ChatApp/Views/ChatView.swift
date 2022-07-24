//
//  ChatView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatView: View {
    
    @State var message: String = ""
    @EnvironmentObject var model: AppStateModel
    
    let otherUserName: String
    
    init(otherUserName: String) {
        self.otherUserName = otherUserName
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(model.messages, id: \.self) { message in
                    ChatRow(text: "Hello, World!", type: .sent)
                        .padding(3)
                }
            }
            
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
                
                SendButton(text: $message)
            }
            .padding()
        }
        .navigationTitle(otherUserName)
        .onAppear {
            model.otherUsername = otherUserName
            model.observeChat()
        }
    }
}

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
       return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .autocapitalization(.none)
            .disableAutocorrection(true)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUserName: "Bob")
            .preferredColorScheme(.dark)
    }
}
