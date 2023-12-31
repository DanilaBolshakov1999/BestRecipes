//
//  URLGenerate.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 12.09.2023.
//

import Foundation
import UIKit

class URLGenerate {
    
    //MARK: - Base URL

    private let baseURL = "https://api.spoonacular.com/"
    private let apiKey = "924bbed5c43b42c1bf46d8844b7caf1e"
    
    func request(endpoint: String, queryItems: [URLQueryItem] = []) -> URLRequest? {
        
        //MARK: - Base URL
        guard let baseURL = URL(string: baseURL) else { return nil }
        var components = URLComponents(url: baseURL.appendingPathComponent(endpoint), resolvingAgainstBaseURL: true)

        var defaultQueryItems = [URLQueryItem(name: "apiKey", value: apiKey)]
        defaultQueryItems.append(contentsOf: queryItems)

        components?.queryItems = defaultQueryItems

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        return request
    }
}
