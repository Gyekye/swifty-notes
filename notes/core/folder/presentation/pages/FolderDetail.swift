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
    
    let items = (1...10).map { "Item, keep your face to the sunshine and you cannot see the shadow \($0)  " }
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    
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
                        Label("Add Note", systemImage: "folder.badge.plus").padding(2)
                    }.buttonBorderShape(.capsule)
                     .buttonStyle(.borderedProminent)
                    
                }.padding(20)
                Divider()
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(destination: NoteDetail()) {
                                NoteCard()
                            }
                        }
                }.padding()
            }
        }
    }
}

struct FolderDetail_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetail()
    }
}
