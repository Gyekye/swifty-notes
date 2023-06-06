import SwiftUI


struct NoteDetail: View {
    
    // External dependencies
    var note: Note
    
    // Internal State dependencies
    @State private var value = "Ths is the bodyof the textfield"
    
    // UI
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    .padding(10)
                
                TextEditor(text: $value)
                    .padding(15)
                
                }.toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button(action: {}) {Image(systemName: "paperplane.fill")
                 }
              }
            }.navigationTitle(note.title)
        }.onAppear {
            value = note.content
        }
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note:  Note(id: "100", title: "First Time", content: "Keep your face to the sunshine and the shadow disappears", date: "23 May 2033"))
    }
}
