import Foundation


/// Note Entity
struct Note: Identifiable, Codable, Hashable{
    
    /// Generated ID
    var id: String
    
    /// Title related to note
    var title: String
    
    ///  Content of note
    var content: String
    
    /// Date note was created
    var date: String
}
