import SwiftUI

struct Folders: View {
    
    // Internal state dependencies
    @State private var sheetPresented = false
    @State private var folderTitle = ""
    @State private var folderBody = "Add description"

    
    // External state dependencie
    @EnvironmentObject private var controller: FolderController
    
    // View
     var body: some View {
         NavigationStack {
             ScrollView {
                 if(controller.folders.count == 0 ){
                     VStack {
                         Text("Oops 😬, No Folders")
                             .font(.title)
                             .padding([.bottom], 10)
                         Label("Add Folder", systemImage: "square.grid.3x1.folder.fill.badge.plus")
                             .foregroundColor(.purple)
                             .onTapGesture {
                                 sheetPresented = true
                             }
                     }.frame(height: 600)
                 }
                 else{
                     ForEach(controller.folders, id: \.self) { item in
                         NavigationLink(destination: FolderDetail(folder: item)) {
                             FolderCard(folder: item)
                         }
                     }
                 }
             }.toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button(action: {
                         sheetPresented = true
                     }) {
                         Image(systemName: "square.grid.3x1.folder.fill.badge.plus")
                     }
                 }
             }.navigationTitle("Folders")
              .sheet(isPresented: $sheetPresented){
                  VStack(alignment: .center) {
                      Spacer(minLength: 100)
                      Text("Add New Folder")
                          .font(.system(size: 25, weight: .black))
                      TextField("Folder title", text: $folderTitle)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding(5)
                      ZStack {
                          RoundedRectangle(cornerRadius: 4)
                              .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                              .background(Color.clear)
                              .padding(5)
                              .frame(height: 300)
                          
                          TextEditor(text: $folderBody)
                              .padding(10)
                              .frame(height: 300)
                       }
                      GeometryReader { geometry in
                          HStack(alignment: .center) {
                              Button(action: {
                                  if(folderTitle.isEmpty){
                                      sheetPresented = false
                                  } else {
                                      let data = Folder(
                                        id: "",
                                        title: folderTitle,
                                        description: folderBody,
                                        notes: [],
                                        date: ""
                                      )
                                      controller.createFolder(folder: data)
                                      folderTitle = ""
                                      folderBody = "Add description"
                                      sheetPresented =  false
                                  }
                              }){
                                 Label("Add Folder", systemImage: "folder.badge.plus").padding(10)
                               }.buttonBorderShape(.capsule)
                                .buttonStyle(.borderedProminent)
                                .padding([.top], 20)
                          }.frame(width: geometry.size.width)
                      }
                  }.padding()
              }
              .onAppear {
                  controller.listFolders()
              }
         }
     }
}

struct Folders_Previews: PreviewProvider {
    static var previews: some View {
        Folders().environmentObject(FolderController())
    }
}
