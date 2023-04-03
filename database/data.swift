import Foundation
import SQLite3


struct model{
    var id : Int
    var name : String
}


class Sqlite {
    static var file : OpaquePointer?

   static func createFile() {
       var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       x.appendPathComponent("My Sqlite file1.db")
       sqlite3_open(x.path, &file)
       print(x.path)
       print("Create file")
       createTable()
           
    }
   static func createTable() {
       let q = "Create Table if not exists Students (name text,id integer)"
       var table: OpaquePointer?
       sqlite3_prepare(file, q, -1, &table, nil)
       print("Create table")
       sqlite3_step(table)
       
        
    }
    static func addData(id:Int,name:String) {
       let q = "insert into Students values ('\(name)',\(id))"
       var data: OpaquePointer?
       sqlite3_prepare(file, q, -1, &data, nil)
       print("Create data")
       sqlite3_step(data)
       
        
    }
    static func getData() -> [model] {
       var arr = [model]()
       let q = "select name,id from students"
       var get: OpaquePointer?
       sqlite3_prepare(file, q, -1, &get, nil)
//       sqlite3_step(get)
       
       while sqlite3_step(get) == SQLITE_ROW{
           let id = sqlite3_column_int64(get, 1)
           print("id = \(id);",terminator: "")
           
           if let cstring = sqlite3_column_text(get, 0){
               let name = String(cString: cstring)
               arr.append(model(id: Int(id), name: name))
           }
       }
       
       print("get data")
       return arr
       
       
        
    }
   static func delteData(id:Int,name:String) {
       let q = "DELETE FROM Students WHERE id = \(id)"
       var tabel: OpaquePointer?
       sqlite3_prepare(file, q, -1, &tabel, nil)
       sqlite3_step(tabel)
       print("delet data")
       
       
        
    }
    
}


