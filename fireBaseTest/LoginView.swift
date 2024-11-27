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
        VStack {
            if isLoggedIn {
                // Display Dogs List and Add Dog Input
                VStack {
                    Text("Dogs List")
                        .font(.title)
                        .padding()

                    List(dogs) { dog in
                        Text(dog.name)
                            .font(.headline)
                    }

                    // Input Field and Add Button for New Dog
                    HStack {
                        TextField("New Dog Name", text: $newDogName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Button(action: {
                            addDog(name: newDogName)
                        }) {
                            Text("Add")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    fetchDogs()
                }
            } else {
                // Login UI
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
        }
    }

    
}
