import UIKit

class TravelViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - PROPERTIES
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let horizontalInsets: CGFloat = 30
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - (horizontalInsets * 2), height: 230)
        
        let verticalInsets: CGFloat = 28
        layout.sectionInset = UIEdgeInsets(top: verticalInsets, left: horizontalInsets, bottom: 0, right: horizontalInsets)
        layout.minimumLineSpacing = verticalInsets
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "Путешествуйте \n Почувствуйте прилив энергии"
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = """
            Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте.
        """
        label.numberOfLines = 3
        return label
    }()
    private var searchTextField: UITextField = {
        let textField = PaddingTextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Куда хотите поехать?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 47/255, green: 134/255, blue: 249/255, alpha: 1)]
        )
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        return textField
    }()
    let searchIcon: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return button
    }()
    
    private var destinations: [Destination] = []

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchDestinations()
        configureUI()
        setupCollectionView()
        setConstraints()
    }
    
    // MARK: - PRIVATE FUNCTIONS
    private func configureUI() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        shadowingForTextField()

        searchIcon.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchTextField.rightView = searchIcon
        searchTextField.rightViewMode = .always
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.identifier)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 2),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // constraints for a title label
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // constraints for a description label under the title label
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 11),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // text field
            searchTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func fetchDestinations() {
        destinations = [
            Destination(name: "ABU DHABI", imageName: "AbuDhabi"),
            Destination(name: "SAN ANTONIO", imageName: "SanAntonio")
        ]
        collectionView.reloadData()
    }
    
    // MARK: - PUBLIC FUNCTION
    func shadowingForTextField() {
        searchTextField.layer.shadowColor = UIColor.black.cgColor
        searchTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        searchTextField.layer.shadowOpacity = 0.25
        searchTextField.layer.shadowRadius = 1
        searchTextField.layer.masksToBounds = false
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCollectionViewCell.identifier, for: indexPath) as? DestinationCollectionViewCell else {
            fatalError("unable to dequeue DestinationCell")
        }
        
        let destination = destinations[indexPath.row]
        cell.configure(with: destination)
        return cell
    }
}
