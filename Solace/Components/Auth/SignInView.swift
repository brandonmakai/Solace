//
//  SignInView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authService: AuthService
    var body: some View {
        NavigationStack{
            VStack{
                Image("tearDrop")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 32)
                
                // Form Field
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocorrectionDisabled()
                    InputView(text: $password, title: "Password", placeholder: "Enter your Password")
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Sign In Button
                Button {
                    Task{
                        try await authService.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color.lightYellow)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3) {
                        Text("Dont Have An Account")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                .tint(.darkBrown)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

/*
struct SwiftUIView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("teardrop")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                // form field
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView (text: $password,
                               title: "Password",
                               placeholder: "Enter your Password",
                               isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                Button {
                print("log user in")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3) {
                        Text("Dont Have An Account")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
} */

#Preview {
    SignInView()
}
