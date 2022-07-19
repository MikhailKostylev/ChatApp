//
//  ChatRow.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatRow: View {
    
    let type: MessageType
    
    var isSender: Bool {
        return type == .sent
    }
    
    init(type: MessageType) {
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
                Text("Hello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello World")
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
            ChatRow(type: .sent)
                .preferredColorScheme(.dark)
            ChatRow(type: .received)
                .preferredColorScheme(.light)
        }
    }
}
