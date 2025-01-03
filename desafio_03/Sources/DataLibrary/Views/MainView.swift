import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink(destination: HeroesView()) {
                    Text("New View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: UserElementsView()) {
                    Text("User Elements View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("SecondaryColor"))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Data Library")
        }
    }
} 