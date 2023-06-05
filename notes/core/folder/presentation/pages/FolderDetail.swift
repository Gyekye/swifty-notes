//
//  FolderDetail.swift
//  notes
//
//  Created by richmond gyekye on 05/06/2023.
//

import SwiftUI

struct FolderDetail: View {
    func greet() {
        print("Hello!")
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment:.center) {
                    VStack(alignment:.leading) {
                        Text("Folder Title")
                            .font(.system(size: 25, weight: .black))
                            .foregroundColor(.primary)
                        Label("20 notes", systemImage: "note.text")
                            .font(.system(size: 16))
                            .padding([.top], -15)
                            .foregroundColor(.purple)
                    }
                    Spacer()
                    Button(action: greet){
                        Label("Add Note", systemImage: "folder.badge.plus")
                            .padding(2)
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                }.padding(20)
                Divider()
            }
        }
    }
}

struct FolderDetail_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetail()
    }
}
