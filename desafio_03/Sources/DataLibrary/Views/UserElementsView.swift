import SwiftUI
import SwiftData

struct UserElementsView: View {
    @StateObject private var viewModel = UserElementsViewModel()
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.userElements) { element in
                VStack(alignment: .leading) {
                    Text(element.title)
                        .font(.headline)
                    Text(element.dateCreated, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("User Elements")
            .toolbar {
                Button(action: { showingAddSheet = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddElementSheet(
                    isPresented: $showingAddSheet,
                    onSave: viewModel.addUserElement
                )
            }
        }
        .onAppear {
            viewModel.fetchUserElements()
        }
    }
}

#Preview {
    UserElementsView()
}