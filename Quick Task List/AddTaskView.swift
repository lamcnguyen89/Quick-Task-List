//
//  AddTaskView.swift
//  Quick Task List
//
//  Created by Lam Nguyen on 1/9/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State var task = ""
    @FocusState var titleFocus: Bool
    
    var body: some View {
        VStack{
            
            TextField("Have Dreamtime", text: $task)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .focused($titleFocus)
                .submitLabel(.go)
                .onSubmit {
                    addTask()
                }
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        titleFocus = true
                    }
                }
                .toolbar{
                    Button(action: addTask) {
                        Text("Add Task")
                    }
                    
                }
            Spacer()
        }

    }
    
    func addTask() {
        let newItem = Task(context: viewContext)
        newItem.task = task
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
            task = ""
            
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
        
    }
}


