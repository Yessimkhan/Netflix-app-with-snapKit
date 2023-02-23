import UIKit
import SnapKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "blackAdam")
        return imageView
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
        
    }
    
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {
            return
        }
        heroImageView.sd_setImage(with: url, completed: nil)
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
private extension HeroHeaderUIView{
    
    func setupViews(){
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
    }
    func makeConstraints() {
        playButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(0.4)
            make.bottom.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.27)
        }
        downloadButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(0.85)
            make.bottom.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.27)
        }
    }
    func addGradient(){
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradiantLayer.frame = bounds
        layer.addSublayer(gradiantLayer)
    }
}
