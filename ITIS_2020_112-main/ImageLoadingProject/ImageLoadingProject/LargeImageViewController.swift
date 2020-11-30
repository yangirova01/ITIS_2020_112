//
//  LargeImageViewController.swift
//  ImageLoadingProject
//
//  Created by Эвелина on 29.11.2020.
//

import UIKit
class LargeImageViewController: UIViewController, UIScrollViewDelegate, URLSessionDownloadDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var progressView: UIProgressView!
    var largeImageUrl: URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {
        guard let url = largeImageUrl else { return }

        download(from: url)
    }

    func download(from url: URL) {
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)

        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let data = try? Data(contentsOf: location), let image = UIImage(data: data) {
            DispatchQueue.main.async {
                let imageView = UIImageView(frame: self.imageViewFrame())
                imageView.image = image
                imageView.contentMode = .scaleAspectFit
                imageView.clipsToBounds = true
                self.scrollView.addSubview(imageView)
                self.progressView.isHidden = true
            }
        }
    }

    private func imageViewFrame() -> CGRect {
        scrollView.bounds.inset(by: UIEdgeInsets(top: scrollView.layoutMargins.top, left: 0, bottom: scrollView.layoutMargins.bottom, right: 0))
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            self.progressView.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        }
    }
}
