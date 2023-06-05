import SwiftUI


struct NoteDetail: View {
@State private var value = "Ths is the bodyof the textfield"
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
        }.navigationTitle("Note Title")
    }
}
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail()
    }
}
