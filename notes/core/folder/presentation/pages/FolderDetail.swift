import SwiftUI


struct FolderDetail: View {
    // Internal state dependencies
    @State private var sheetPresented = false
    @State private var noteTitle = ""
    @State private var noteBody = ""
    
    // External state dependencie
    @EnvironmentObject private var controller: FolderController
    
    // External dependencies
    var folder: Folder
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment:.bottom) {
                    VStack(alignment:.leading) {
                        if(folder.notes.count == 0) {
                            Label("No note", systemImage: "note.text")
                                .font(.system(size: 18))
                                .padding([.top], -10)
                                .bold()
                                .foregroundColor(.purple)
                        } else {
                            Label("\(folder.notes.count) note(s)", systemImage: "note.text")
                                .font(.system(size: 18))
                                .padding([.top], -10)
                                .bold()
                                .foregroundColor(.purple)
                        }
                    }
                    Spacer()
                    Button(action: {
                        print("hello world")
                        sheetPresented = true
                    }){
                        Label("Add Note", systemImage: "folder.badge.plus").padding(2)
                    }.buttonBorderShape(.capsule)
                     .buttonStyle(.borderedProminent)
                    
                }.padding(20)
                Divider()
                    
                if(folder.notes.count == 0) {
                    VStack {
                        Text("Oops 😬, No Notes")
                            .font(.title)
                            .padding([.bottom], 10)
                        Label("Add Note", systemImage: "square.grid.3x1.folder.fill.badge.plus")
                            .foregroundColor(.purple)
                            .onTapGesture {
                                sheetPresented = true
                        }
                    }.frame(height: 600)
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(folder.notes, id: \.self) { item in
                            NavigationLink(destination: NoteDetail(note: item)) {
                                NoteCard(note: item)
                            }
                        }
                    }.padding()
                }
            }.navigationTitle(folder.title)
             .sheet(isPresented: $sheetPresented){
                    VStack(alignment: .center) {
                        Spacer(minLength: 100)
                        Text("Add New Note")
                            .font(.system(size: 20, weight: .black))
                        TextField("Note title", text: $noteTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(5)
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                .background(Color.clear)
                                .padding(5)
                                .frame(height: 300)
                            
                            TextEditor(text: $noteBody)
                                .padding(10)
                                .frame(height: 300)
                         }
                        GeometryReader { geometry in
                            HStack(alignment: .center) {
                                Button(action: {
                                    if(noteTitle.isEmpty){
                                        sheetPresented = false
                                    } else {
                                        var data = Note(
                                          id: "",
                                          title: noteTitle,
                                          content: noteBody,
                                          date: ""
                                        )
                                        controller.createNote(
                                            note: &data,
                                            folder: folder
                                        )
                                        noteTitle = ""
                                        noteBody  = ""
                                        sheetPresented =  false
                                    }
                                    sheetPresented =  false
                                }){
                                   Label("Add Note", systemImage: "text.badge.plus").padding(10)
                                 }.buttonBorderShape(.capsule)
                                  .buttonStyle(.borderedProminent)
                                  .padding([.top], 20)
                            }.frame(width: geometry.size.width)
                        }
                    }.padding()
                }
        }
    }
}

struct FolderDetail_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetail(folder: Folder(
                id: "01",
                title: "Finances 101",
                description: "For my finances",
                notes: [],
                date: "20 April 2023"
            )
        ).environmentObject(FolderController())
    }
}
