import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let urlString = "https://google.com"

guard let url = URL(string: urlString) else {
    fatalError()
}

let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Task failed with error: \(error)")
    } else if let data = data {
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
            // text/html, text/json, text/xml, image/jpeg, image/png
            print("Mime type: \(httpResponse.mimeType ?? "unknown")")
        }

        print("Got data: \(data)")
        if let string = String(data: data, encoding: .windowsCP1251) {
            print("String: \(string.count)")
        }
    }
}
dataTask.resume()


let urlString2 = "https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg"

guard let url2 = URL(string: urlString2) else {
    fatalError()
}

let dataTask2 = URLSession.shared.dataTask(with: url2) { data, response, error in
    if let error = error {
        print("Task failed with error: \(error)")
    } else if let data = data {
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
            // text/html, text/json, text/xml, image/jpeg, image/png
            print("Mime type: \(httpResponse.mimeType ?? "unknown")")
        }

        print("Got data: \(data)")
        if let image = UIImage(data: data) {
            print("Image size: \(image.size)")
            image
        }
    }
}
dataTask2.resume()
