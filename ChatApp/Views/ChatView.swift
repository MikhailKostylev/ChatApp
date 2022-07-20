//
//  ChatView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatView: View {
    
    @State var message: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRow(type: .sent)
                    .padding(3)
                ChatRow(type: .received)
                    .padding(3)
            }
            
            HStack {
                TextField("Message...", text: $message)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SendButton(text: $message )
            }
            .padding()
        }
        .navigationTitle("Bob")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .preferredColorScheme(.dark)
    }
}
