import SwiftUI
import SwiftData

struct UserElementsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var userElements: [UserElement]
    @StateObject private var viewModel = UserElementsViewModel()
    @State private var showingForm = false
    @State private var elementToEdit: UserElement?
    
    var body: some View {
        List {
            ForEach(userElements) { element in
                VStack(alignment: .leading) {
                    Text(element.title)
                        .font(.headline)
                    Text(element.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(element.dateCreated.formatted())
                        .font(.caption)
                }
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        viewModel.deleteElement(element, modelContext: modelContext)
                    }
                    
                    Button("Edit") {
                        elementToEdit = element
                        viewModel.title = element.title
                        viewModel.description = element.description
                        showingForm = true
                    }
                    .tint(.blue)
                }
            }
        }
        .navigationTitle("User Elements")
        .toolbar {
            Button("Upload") {
                showingForm = true
            }
        }
        .sheet(isPresented: $showingForm) {
            NavigationStack {
                Form {
                    TextField("Title", text: $viewModel.title)
                    TextField("Description", text: $viewModel.description)
                }
                .navigationTitle(elementToEdit != nil ? "Edit Element" : "New Element")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            showingForm = false
                            elementToEdit = nil
                            viewModel.title = ""
                            viewModel.description = ""
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            if let element = elementToEdit {
                                viewModel.updateElement(element)
                            } else {
                                viewModel.createElement(modelContext: modelContext)
                            }
                            showingForm = false
                            elementToEdit = nil
                        }
                        .disabled(viewModel.title.isEmpty || viewModel.description.isEmpty)
                    }
                }
            }
            .presentationDetents([.medium])
        }
    }
} 