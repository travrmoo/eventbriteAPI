import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct NestedJSONModel: Codable {
    
    var events: [Events]
    
    enum CodingKeys: String, CodingKey {
        case events
    }
}

struct Events: Codable {

    var url:String?
    var name:Name
    var start:Start

    enum CodingKeys: String, CodingKey {
        case url
        case name
        case start
    }
}

struct Name: Codable {

    var text:String?

    enum CodingKeys: String, CodingKey {
        case text
    }
}

struct Start: Codable {

    var local:String?

    enum CodingKeys: String, CodingKey {
        case local
    }
}

let url = URL(string: "https://www.eventbriteapi.com/v3/venues/33781047/events/?token=YOUR TOKEN")!

var request = URLRequest(url: url)

request.addValue("Bearer YOUR TOKEN", forHTTPHeaderField: "Authorization")

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    if let response = response {
    print(response)

    if let data = data, let body = String(data: data, encoding: .utf8) {
      print(body)
        
    }
  } else {
      
    print(error ?? "Unknown error")
      
  }
    let decoder = JSONDecoder()
    
    let json = try! JSONDecoder().decode(NestedJSONModel.self, from: data!)
    
    print(json)
}

task.resume()
    


