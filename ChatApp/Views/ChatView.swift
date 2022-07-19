//
//  ChatView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ScrollView(.vertical) {
            ChatRow(type: .sent)
                .padding(3)
            ChatRow(type: .received)
                .padding(3)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
