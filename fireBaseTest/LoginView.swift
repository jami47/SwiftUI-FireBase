import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var dogs: [Dog] = [] // Array to hold Firestore data
    @State private var newDogName: String = "" // For adding a new dog
    @State private var errorMessage: String?

    var body: some View {
        
    }

    
}
