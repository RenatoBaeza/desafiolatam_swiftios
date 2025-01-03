import SwiftUI

struct WelcomeView: View {
    @State private var username: String = ""
    @State private var isAnimating = false
    @AppStorage("currentScreen") var currentScreen: String = "welcome"
    @State private var showGallery = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Welcome to Image Gallery")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -20)
                    .multilineTextAlignment(.center)
                
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .scaleEffect(isAnimating ? 1.2 : 0.8)
                
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("Enter your name", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .font(.title3)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    Button(action: {
                        currentScreen = "gallery"
                        showGallery = true
                    }) {
                        Text("Enter Gallery")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(username.isEmpty ? Color.gray.opacity(0.5) : Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(username.isEmpty)
                    .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
            .padding()
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    isAnimating = true
                }
            }
            .navigationDestination(isPresented: $showGallery) {
                GalleryView(username: username)
            }
        }
    }
}

#Preview {
    WelcomeView()
} 