//
//  EventViewController.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, EventViewProtocol {
    //MARK: - IBOutlet
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    
    
    var presenter: EventPresenterProtocol?
    
    func bindData(with model: EventViewModel) {
        if let url = model.cover, let data = try? Data(contentsOf: url) {
            coverImage.image = UIImage(data: data)
            scrollViewTopConstraint.constant = view.bounds.height / 3.0
        } else {
            scrollViewTopConstraint.constant = 0
        }
        
        titleLabel.text = model.title
        categoryLabel.text = model.category
        addressLabel.text = model.address
        descriptionLabel.attributedText = model.description.htmlToAttributedString
        view.layoutIfNeeded()
        self.scrollView.contentSize = containerView.bounds.size
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = containerView.bounds.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
