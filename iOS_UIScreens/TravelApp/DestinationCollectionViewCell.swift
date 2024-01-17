import UIKit

class DestinationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - PROPERTIES
    static let identifier = "DestinationCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let underCountryLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let gradientView: GradientView = {
        let view = GradientView()
        view.startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.endColor = .clear
        view.startLocation = 0.1
        view.endLocation = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - INITIALIZATION
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PRIVATE FUNCTION
    private func setupCell() {
        contentView.addSubview(imageView)
        imageView.addSubview(gradientView)
        contentView.addSubview(countryLabel)
        contentView.addSubview(underCountryLabelView)

        NSLayoutConstraint.activate([
            // constraints for an imageview
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // constraints for a label
            countryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 37),
            
            // constraints for a view under the countryLabel
            underCountryLabelView.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 0.3),
            underCountryLabelView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            underCountryLabelView.heightAnchor.constraint(equalToConstant: 2),
            underCountryLabelView.widthAnchor.constraint(equalTo: countryLabel.widthAnchor),
            
            // constraints for a gradient view
            gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            gradientView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    // MARK: - PUBLIC FUNCTION
    func configure(with destination: Destination) {
        imageView.image = UIImage(named: destination.imageName)
        countryLabel.text = destination.name.uppercased()
    }
}
