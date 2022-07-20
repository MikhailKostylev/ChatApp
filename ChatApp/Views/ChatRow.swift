//
//  ChatRow.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatRow: View {
    
    let type: MessageType
    let text: String
    
    var isSender: Bool {
        return type == .sent
    }
    
    init(text: String, type: MessageType) {
        self.text = text
        self.type = type
    }
    
    var body: some View {
        HStack {
            if isSender { Spacer() }
            
            if !isSender {
                VStack {
                    Spacer()
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.pink)
                }
            }
            
            HStack {
                Text(text)
                    .foregroundColor(isSender ? Color.white : Color(.label))
                    .padding()
            }
            .background(isSender ? Color.blue : Color(.systemGray4))
            .cornerRadius(10)
            .padding(isSender ? .leading : .trailing, isSender ? UIScreen.main.bounds.width/4 : UIScreen.main.bounds.width/6)
            
            if !isSender { Spacer() }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatRow(text: "Hello, World!", type: .sent)
                .preferredColorScheme(.dark)
            ChatRow(text: "Hello, World!", type: .received)
                .preferredColorScheme(.light)
        }
    }
}
