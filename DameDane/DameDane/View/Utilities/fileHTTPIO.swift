//
//  fileHTTPIO.swift
//  damedame
//
//  Created by Taeheon Kim on 2021/06/03.
//

import Foundation
import UIKit

let session: URLSession = URLSession.shared
func obfuscate(url: URL, accessToken: String,image:UIImage, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
    let boundary: String = "XXXXX"
    var request: URLRequest = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

    // 파일을 읽을 수 없다면 nil을 리턴
    guard let filedata = image.pngData() else {
        return
    }
    let headerLines = ["--\(boundary)",
        "Content-Disposition: form-data; name=\"file\"; filename=\"\("")\"",
        "Content-Type: application/octet-stream",
        "\r\n"]
    var data = headerLines.joined(separator:"\r\n").data(using:.utf8)!
    // 그 다음에 파일 데이터를 붙이고
    data.append(contentsOf: filedata)
    // 마지막으로 데이터의 끝임을 알리는 바운더리를 한 번 더 사용한다.
    // 이는 '새로운 개행'이 필요하므로 앞에 \r\n이 있어야 함에 유의 한다.
    data.append(contentsOf: "\r\n--\(boundary)--".data(using:.utf8)!)
    session.uploadTask(with: request, from: data, completionHandler: completionHandler).resume()
}
