//
//  URLDetailsViewController.swift
//  ImageLoadingProject
//
//  Created by Teacher on 16.11.2020.
//

import UIKit
import WebKit

class URLDetailsViewController: UIViewController {
    var pageUrl: URL?

    private var textView: UITextView!

    override func loadView() {
        let textView = UITextView()
        textView.isEditable = false
        textView.automaticallyAdjustsScrollIndicatorInsets = true
        textView.contentInsetAdjustmentBehavior = .always
        self.textView = textView
        self.view = textView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadURL()
    }

    private func loadURL() {
        // load url!
    }
}
