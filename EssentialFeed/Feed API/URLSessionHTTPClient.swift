//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 07/02/2023.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient{
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    struct UnexpectedValuesRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void){
        session.dataTask(with: url) { data, response, error in
            completion(Result{
                if let error{
                    throw error
                }
                else if let data, let response = response as? HTTPURLResponse{
                    return (data, response)
                }else{
                    throw UnexpectedValuesRepresentation()
                }
            })
        }.resume()
    }
}
