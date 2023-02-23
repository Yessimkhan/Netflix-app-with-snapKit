//
//  TitlePreviewViewController.swift
//  Netflix
//
//  Created by Yessimkhan Zhumash on 11.12.2022.
//

import UIKit
import WebKit
import SnapKit


class TitlePreviewViewController: UIViewController {
//    var titles:[Title] = [Title]()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
//        label.textColor = .green
        return label
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "This moview is norm movie"
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: "clickedDownloadButton", for: .touchUpInside)
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstrains()
    }
    var indexPath: IndexPath = [];
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverview
        indexPath = model.indexPath
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    @IBAction private func clickedDownloadButton(){
        print("Clicked")
//        downloadTitleAt(indexPath: indexPath)
    }
    
}
extension TitlePreviewViewController{
    func setupViews(){
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)
    }
    func setupConstrains(){
        webView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
                make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(webView.snp.bottom).inset(-20)
            make.leading.equalToSuperview().inset(20)
        }
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
        }
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
    }
}
