//
//  RMCharacterCollectionViewCell.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 25/09/2023.
//

import UIKit

class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLable: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLable: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView,nameLable,statusLable)
        addConstraint()
        setUpLayer()
    }
    
    required init(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func setUpLayer(){
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    private  func addConstraint() {
        NSLayoutConstraint.activate([
            statusLable.heightAnchor.constraint(equalToConstant: 30),
            nameLable.heightAnchor.constraint(equalToConstant: 30),
            statusLable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            statusLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            nameLable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            nameLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            statusLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLable.bottomAnchor.constraint(equalTo: statusLable.topAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLable.topAnchor,constant: -3),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLable.text = nil
        statusLable.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        nameLable.text = viewModel.characterName
        statusLable.text = viewModel.characterStatusText
        viewModel.fetchImage{ [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
            
        }
    }
}
