//
//  RecipeImageService.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-13.
//

import Foundation
import UIKit
import SwiftUI
import Combine


class RecipeImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let recipe: Recipe
    private let fileManager = LocalFileManager.instance
    private let folderName = "recipe_images"
    private let imageName: String
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.imageName = String(recipe.id)
        getRecipeImage()
    }
    
    private func getRecipeImage(){
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            //print("Retrieved image from File Manager")
        } else {
            downloadRecipeImage()
            //print("Downlaoding image now")
        }
    }
    
    private func downloadRecipeImage() {
        
        
        
        let headers = [
            "X-RapidAPI-Host": "tasty.p.rapidapi.com",
            "X-RapidAPI-Key": "4c8b969e9dmsh434d8985f483c8bp12e5f0jsn599a35f02a67"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: recipe.thumbnailURL)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        imageSubscription =  NetworkingManager.download(request: request)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage , imageName: self.imageName, folderName: self.folderName)
            })
    }
    
}
