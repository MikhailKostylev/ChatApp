//
//  SearchView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct SearchView: View {
    
    let usernames = ["John", "Jack", "Joe"]
    let completion: ((String) -> Void)
    
    @State var text: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Username...", text: $text)
                    .modifier(CustomField())
                
                Button("Search") {
                    //
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
