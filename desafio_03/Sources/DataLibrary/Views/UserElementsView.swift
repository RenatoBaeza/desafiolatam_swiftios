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

struct AddElementSheet: View {
    @Binding var isPresented: Bool
    let onSave: (String, String) -> Void
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Element")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    onSave(name, description)
                    isPresented = false
                }
                .disabled(name.isEmpty || description.isEmpty)
            )
        }
    }
}

#Preview {
    UserElementsView()
}