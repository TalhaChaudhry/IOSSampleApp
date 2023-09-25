//
//  RMRMCharacterCollectionViewCell.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 25/09/2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String  {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(conpletion: @escaping (Result<Data,Error>)-> Void){
        guard let url = characterImageUrl else {
            conpletion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, _, error in
            guard let data = data, error == nil else {
                conpletion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            conpletion(.success(data))
        }
        task.resume()
    }
    
}
