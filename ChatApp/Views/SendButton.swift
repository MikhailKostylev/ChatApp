//
//  SendButton.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct SendButton: View {
    
    @Binding var text: String
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        Button {
            self.sendMessage()
        } label: {
            Image(systemName: "paperplane")
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 30))
                .frame(width: 55, height: 55)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Circle())
        }
    }
    
    private func sendMessage() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        model.sendMessage(text: text)
        
        text = ""
    }
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SendButton()
//    }
//}
