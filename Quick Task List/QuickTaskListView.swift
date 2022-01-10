//
//  QuickTaskListView.swift
//  Quick Task List
//
//  Created by Lam Nguyen on 1/9/22.
//

import SwiftUI

struct QuickTaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.task, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List{
                ForEach(tasks) {listedTask in
                    NavigationLink(destination: DetailedTaskView(detailedTask: listedTask.task!)) {
                        Text(listedTask.task!)
                            .lineLimit(1)
                    }
                    
                    
                    
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Quick Task List")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddTaskView()) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            
            try? viewContext.save()
        }
    }
}


struct QuickTaskListView_Previews: PreviewProvider {
    static var previews: some View {
        QuickTaskListView()
    }
}
