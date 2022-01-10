//
//  DetailedTaskView.swift
//  Quick Task List
//
//  Created by Lam Nguyen on 1/9/22.
//

import SwiftUI

struct DetailedTaskView: View {
    var detailedTask : String
    var body: some View {
        Text(detailedTask)
            .padding()
            .font(.largeTitle)
    }
}

struct DetailedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTaskView(detailedTask: "Heartless")
    }
}
