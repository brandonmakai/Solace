//
//  AuthService.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    // Firebase Authentication Functions
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
        
    }
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, firstName: String, lastName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserView.User(id: result.user.uid, firstName: firstName, lastName: lastName, email: email, icon: "placeholderImage", preferences: nil)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    static func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            throw error
        }
    }
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not logged in.")
            return
        }
    }
}
