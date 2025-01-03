import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    
    @State private var title: String = ""
    @State private var isCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $title)
                Toggle("Completed", isOn: $isCompleted)
                
                Button("Save Task") {
                    viewModel.addTask(title: title, isCompleted: isCompleted)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Add New Task")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }
} 