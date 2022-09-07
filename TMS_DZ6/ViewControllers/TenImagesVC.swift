//
//  TenImagesVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 03.09.2022.
//

import UIKit

enum Direction {
    case prev, next
}

class TenImagesVC: UIViewController {

    private let closeButton = CloseButton()
    private let imageViewMain = UIImageView()
    private var images = [UIImage]()
    private var currentImageIndex = 0
    
    private let nextButton = UIButton()
    private let prevButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...8 {
            let image = UIImage(named: String(i)) ?? UIImage()
            images.append(image)
        }
        
        imageViewMain.isUserInteractionEnabled = true
        imageViewMain.image = images[0]
        
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(imageViewMain)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
               
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
       
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(prevButtonAction), for: .touchUpInside)
    
    }
    
    override func viewDidLayoutSubviews() {
        setupUI()
        
        nextButton.setTitle("Next Pic", for: .normal)
        nextButton.backgroundColor = .orange
        
        prevButton.setTitle("Prev Pic", for: .normal)
        prevButton.backgroundColor = .orange
        
    }
    
    private func setupUI() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        //  как задавать констрейнты constraints
        // сверху справа слева = по 100 и height 20
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: imageViewMain.bottomAnchor, constant: 50),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        ])
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prevButton.topAnchor.constraint(equalTo: imageViewMain.bottomAnchor, constant: 50),
            prevButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        ])
        
        imageViewMain.backgroundColor = .orange
        imageViewMain.translatesAutoresizingMaskIntoConstraints = false
        imageViewMain.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageViewMain.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageViewMain.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            imageViewMain.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageViewMain.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageViewMain.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageViewMain.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc private func nextButtonAction() {
        var nextImageIndex = 0
        nextImageIndex = currentImageIndex == images.count - 1 ? 0 : currentImageIndex + 1
        changeAndAnimate(nextImageIndex: nextImageIndex, direction: Direction.next)
    }
    
    private func createImageView(direction: Direction) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame.size = imageViewMain.frame.size
        imageView.frame.origin.y = imageViewMain.frame.origin.y
        switch direction {
        case .prev:
            imageView.frame.origin.x = imageViewMain.frame.size.width * -2
        case .next:
            imageView.frame.origin.x = imageViewMain.frame.size.width * 2
        }
        view.addSubview(imageView)
        return imageView
    }
        
    @objc private func prevButtonAction() {
        var nextImageIndex = 0
        nextImageIndex = currentImageIndex == 0 ? images.count - 1 : currentImageIndex - 1
        changeAndAnimate(nextImageIndex: nextImageIndex, direction: Direction.prev)
    }
    
    private func changeAndAnimate(nextImageIndex: Int, direction: Direction)  {
        
        let imageView = createImageView(direction: direction)
        imageView.image = images[nextImageIndex]
    
        UIView.animate(withDuration: 0.3) {
            imageView.frame.origin.x = self.imageViewMain.frame.origin.x
        } completion: { _ in
            imageView.removeFromSuperview()
            self.imageViewMain.image = self.images[nextImageIndex]
            self.currentImageIndex = nextImageIndex
        }
    }
    
    @IBAction func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
