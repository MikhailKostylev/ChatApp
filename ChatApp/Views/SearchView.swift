//
//  SearchView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var model: AppStateModel
    @State var text: String = ""
    @State var usernames: [String] = []
    
    let completion: ((String) -> Void)
    
    init(completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Username...", text: $text)
                    .modifier(CustomField())
                
                Button("Search") {
                    guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                        return
                    }
                    
                    model.searchUsers(query: text) { usernames in
                        self.usernames = usernames
                    }
                }
            }
            .padding(.horizontal)
            
            List {
                ForEach(usernames, id: \.self) { name in
                    HStack {
                        Circle()
                            .frame(width: 55, height: 55)
                            .foregroundColor(Color.pink)
                        
                        Text(name)
                            .font(.system(size: 24))
                        
                        Spacer()
                    }
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                        completion(name)
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { _ in }
    }
}
