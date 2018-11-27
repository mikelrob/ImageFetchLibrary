import Foundation

public class ImageFetchLibrary {
    public private(set) var text = "Hello, World!"

    public let homeUrl = URL(string: "https://github.com/mikelrob")!

    public let filesRootUrl: URL
    public let filesUrl: URL

    public init() {
        filesRootUrl = URL(string: "https://raw.githubusercontent.com/mikelrob/frameit-frames/gh-pages/latest/")!
        filesUrl = filesRootUrl.appendingPathComponent("files.json")
    }

    public func loadImageUrls(completion: @escaping ([URL], Error?) -> Void) {

        URLSession.shared.dataTask(with: filesUrl) { [unowned self] data, _, error in
            guard let data = data else {
                completion([], error)
                return
            }

            let jsonDecoder = JSONDecoder()

            do {
                let imageFilesUrls = try jsonDecoder.decode([String].self,
                                                            from: data)
                    .compactMap { self.filesRootUrl.appendingPathComponent($0) }
                completion(imageFilesUrls, nil)
            } catch {
                completion([], error)
            }
        }.resume()
    }
}
