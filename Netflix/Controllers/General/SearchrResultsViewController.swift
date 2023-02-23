//
//  SearchrResultsViewController.swift
//  Netflix
//
//  Created by Yessimkhan Zhumash on 30.11.2022.
//

import UIKit

protocol SearchrResultsViewControllerDelegate: AnyObject {
    func searchrResultsViewControllerDidTapItem (_ viewModel: TitlePreviewViewModel)
}


class SearchrResultsViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    public weak var delegate: SearchrResultsViewControllerDelegate?
    public let searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
}

extension SearchrResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{
            return UICollectionViewCell()
        }
        let titles = titles[indexPath.row]
        cell.configure(with: titles.poster_path ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        let titleName = title.original_title ?? title.original_name ?? ""
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result{
            case .success(let viedeoElement):
                self?.delegate?.searchrResultsViewControllerDidTapItem(TitlePreviewViewModel(title: title.original_title ?? "", youtubeView: viedeoElement, titleOverview: title.overview ?? "", indexPath: indexPath))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
