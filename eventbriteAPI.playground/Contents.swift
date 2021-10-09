import UIKit
import Foundation



struct EventBriteHighWatt: Codable {

    var events:[Events]
    
    
}

struct Events: Codable {

    var summary:String?
    var url:String?
    
}




// NOTE: Uncommment following two lines for use in a Playground
 import PlaygroundSupport
 PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://www.eventbriteapi.com/v3/venues/33781047/events/?token=YOURTOKEN")!
var request = URLRequest(url: url)
request.addValue("Bearer YOURTOKEN", forHTTPHeaderField: "Authorization")
let task = URLSession.shared.dataTask(with: request) { data, response, error in

    
    if let response = response {
//    print(response)

    if let data = data, let body = String(data: data, encoding: .utf8) {
//      print(body)
    }
  } else {
    print(error ?? "Unknown error")
  }
    
    let decoder = JSONDecoder()
    
    do {
        
        let highEvents = try decoder.decode(EventBriteHighWatt.self, from: data!)
        
        print(highEvents)
        
    }catch{
        print("Error in JSON parsing.")
    }
    
}

task.resume()
    


