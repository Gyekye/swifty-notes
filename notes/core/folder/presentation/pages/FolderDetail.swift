import SwiftUI


struct FolderDetail: View {
    // Internal state dependencies
    @State private var sheetPresented = false
    @State private var noteTitle = "New Note"
    @State private var noteBody = "Add descriptiom"
    
    // Internal dependencies
    let items = (1...10).map { "Item, keep your face to the sunshine and you cannot see the shadow \($0)  " }
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment:.bottom) {
                    VStack(alignment:.leading) {
                        Label("20 notes", systemImage: "note.text")
                            .font(.system(size: 16))
                            .padding([.top], -15)
                            .foregroundColor(.purple)
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
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(destination: NoteDetail()) {
                                NoteCard()
                            }
                        }
                }.padding()
            }.navigationTitle("Note Title")
             .sheet(isPresented: $sheetPresented){
                    VStack(alignment: .center) {
                        Spacer(minLength: 100)
                        Text("Add New Note")
                            .font(.system(size: 25, weight: .black))
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
                                    sheetPresented =  false
                                }){
                                   Label("Add Folder", systemImage: "text.badge.plus").padding(10)
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
        FolderDetail()
    }
}
