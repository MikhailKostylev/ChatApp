//
//  SignInView.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var username = ""
    @State var password = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .padding(.vertical)
                
                Text("Chat App")
                    .bold()
                    .font(.system(size: 34))
                
                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                    
                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                    
                    Button {
                        self.signIn()
                    } label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(width: 220, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink("Sign Up") {
                        SignUpView()
                    }
                    .foregroundColor(.blue)
                }
            }
            .padding(.vertical)
        }
    }
    
    func signIn() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        model.signIn(username: username, password: password)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
