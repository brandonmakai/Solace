//
//  SettingsView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    var body: some View {
        List {
            Section {
                HStack {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack{
                            Text(user.firstName)
                            Text(user.lastName)
                        }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General") {
                HStack {
                    SettingRowView (imageName: "gear",
                                    title: "Version",
                                    tintcolor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account") {
                Button {
                    print("Sign Out")
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign Out",
                                   tintcolor: .red)
                }
                
                Button {
                    print("Delete Account")
                } label: {
                    SettingRowView(imageName: "xmark.circle.fill",
                                   title: "Delete Account",
                                   tintcolor: .red)
                }
            }
        }
    }
}


#Preview {
    SettingsView()
}
