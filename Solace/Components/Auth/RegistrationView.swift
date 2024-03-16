//
//  RegistrationView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var confirmPassword = ""
    
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
                        
                        InputView(text: $firstName, title: "First Name", placeholder: "Enter your first name")
                        InputView(text: $lastName, title: "lastName", placeholder: "Enter your last name")
                        InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                            .autocorrectionDisabled()
                        InputView(text: $password, title: "Password", placeholder: "Enter your Password", isSecureField: true)
                        ZStack {
                            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Enter your Password", isSecureField: true)
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    // Sign In Button
                    Button {
                        Task{
                            try await authService.createUser(withEmail: email, password:password, firstName: firstName, lastName: lastName)
                        }
                    } label: {
                        HStack {
                            Text("SIGN IN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.darkBrown)
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
            }
    }
}

#Preview {
    RegistrationView()
}
