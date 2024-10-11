//
//  Reposetories.swift
//  MyProject
//
//  Created by user on 12.10.2024.
//

import Foundation
import Supabase

class Repositories {

    static let instance = Repositories()

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://mqjhtgrstlkojposgqbk.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1xamh0Z3JzdGxrb2pwb3NncWJrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0NDkxODcsImV4cCI6MjA0NDAyNTE4N30.Expc0UgE5AkPlqI2vHaWlz2fz6I_CtbFrreVgQHDok4",
    options: .init()
)

func signUp(
    fullname: String, phone: String, email: String, password: String
) async throws {
    try await supabase.auth.signUp(email: email, password: password)
    
    let user = try await supabase.auth.session.user
    
    let newUser = UserModel(
        id: user.id,
        fullname: fullname,
        phone: phone,
        email: email,
        password: password
    )
    
    try await supabase.from("users")
        .insert(newUser)
        .execute()
    
    try await supabase.auth.signOut()
}

func signIn(
    email: String, password: String
) async throws {
    try await supabase.auth.signIn(email: email, password: password)
}

func logOut() async throws {
    try await supabase.auth.signOut()
}
}
