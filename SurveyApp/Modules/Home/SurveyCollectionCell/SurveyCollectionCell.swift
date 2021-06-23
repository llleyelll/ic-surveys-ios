//
//  SurveyCollectionCell.swift
//  SurveyApp
//
//  Created by Chananchida F. on 6/21/21.
//

import UIKit
import SnapKit

final class SurveyCollectionCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
    
    func setImage(imageURLString: String) {
        guard let imageURL: URL = URL(string: imageURLString) else { return }
        imageView.loadUrl(url: imageURL)
    }
    
    // TODO: might not need when integrate
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    private func setUpLayout() {
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(122.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(68.0)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(86.0)
            $0.bottom.equalToSuperview().inset(54.0)
        }
    }
    
    private func setUpViews() {
        imageView.contentMode = .scaleAspectFill
        
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.6).cgColor]
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.bold(ofSize: .title)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        descriptionLabel.font = UIFont.regular(ofSize: .body)
        descriptionLabel.numberOfLines = 2
    }
}
