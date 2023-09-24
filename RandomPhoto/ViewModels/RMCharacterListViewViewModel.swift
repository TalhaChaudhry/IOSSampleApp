//
//  CharacterListViewViewModel.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 25/09/2023.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject{
    func fetchharacters(){
        RMSerive.share.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self){result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("PAGE Result Count: "+String(model.results.count))
            case .failure(let error):
               print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        )as? RMCharacterCollectionViewCell else {
            fatalError("Unxupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Talha",
                                                               characterStatus: .alive,
                                                               characterImageUrl: nil)
        cell.configure(with: viewModel)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds =  UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
}
