//
//  SignUpView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(.vertical)
            
            VStack {
                TextField("Email Address", text: $email)
                    .modifier(CustomField())
                
                TextField("Username", text: $username)
                    .modifier(CustomField())
                
                SecureField("Password", text: $password)
                    .modifier(CustomField())
                Button {
                    self.signUp()
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(width: 220, height: 50)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.vertical)
            }
            .padding()
            
            Spacer()
        }
        .padding(.vertical)
        .navigationBarTitle("Create Account", displayMode: .inline)
    }
    
    func signUp() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        model.signUp(email: email, username: username, password: password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.light)
    }
}
