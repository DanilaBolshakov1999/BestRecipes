//
//  ApiManager.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/7/23.
//

import Foundation
import SDWebImage

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let apiKey = "08aaad3488c7489fa416f8e726d49df7"
    private let baseURL = "https://api.spoonacular.com/recipes/random"
    
    func fetchRandomRecipes(numberOfRecipes: Int, completion: @escaping (Result<CookData, Error>) -> Void) {
        let queryString = "number=\(numberOfRecipes)&apiKey=\(apiKey)"
        let fullURLString = baseURL + "?" + queryString
        guard let url = URL(string: fullURLString) else { return }
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, fetchError in
            if let fetchError = fetchError {
                completion(.failure(fetchError))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let cookData = try decoder.decode(CookData.self, from: data)
                    completion(.success(cookData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func fetchRecipeImage(id: Int, completion: @escaping (UIImage?) -> Void) {
        
        let imageUrlString = "https://spoonacular.com/recipeImages/\(id)-636x393.jpg"
        
        guard let imageUrl = URL(string: imageUrlString) else {
            completion(nil)
            return
        }
        
        SDWebImageDownloader.shared.downloadImage(with: imageUrl) { (image, _, _, _) in
            completion(image)
        }
    }
}
