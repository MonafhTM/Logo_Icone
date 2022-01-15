// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let totalCount: Int
    let icons: [Icon]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case icons
    }
}

// MARK: Welcome convenience initializers and mutators

extension Welcome {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Welcome.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        totalCount: Int? = nil,
        icons: [Icon]? = nil
    ) -> Welcome {
        return Welcome(
            totalCount: totalCount ?? self.totalCount,
            icons: icons ?? self.icons
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.iconTask(with: url) { icon, response, error in
//     if let icon = icon {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Icon
struct Icon: Codable {
    
    let isIconGlyph, isPremium: Bool
    let publishedAt: String
    let vectorSizes: [VectorSize]
    let containers: [Container]
    let isPurchased: Bool?
    let styles: [Category]
    let tags: [String]
    let iconID: Int
    let prices: [Price]?
    let categories: [Category]
    let rasterSizes: [RasterSize]
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case isIconGlyph = "is_icon_glyph"
        case isPremium = "is_premium"
        case publishedAt = "published_at"
        case vectorSizes = "vector_sizes"
        case containers
        case isPurchased = "is_purchased"
        case styles, tags
        case iconID = "icon_id"
        case prices, categories
        case rasterSizes = "raster_sizes"
        case type
    }
}

// MARK: Icon convenience initializers and mutators

extension Icon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Icon.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        isIconGlyph: Bool? = nil,
        isPremium: Bool? = nil,
        publishedAt: String? = nil,
        vectorSizes: [VectorSize]? = nil,
        containers: [Container]? = nil,
        isPurchased: Bool?? = nil,
        styles: [Category]? = nil,
        tags: [String]? = nil,
        iconID: Int? = nil,
        prices: [Price]?? = nil,
        categories: [Category]? = nil,
        rasterSizes: [RasterSize]? = nil,
        type: TypeEnum? = nil
    ) -> Icon {
        return Icon(
            isIconGlyph: isIconGlyph ?? self.isIconGlyph,
            isPremium: isPremium ?? self.isPremium,
            publishedAt: publishedAt ?? self.publishedAt,
            vectorSizes: vectorSizes ?? self.vectorSizes,
            containers: containers ?? self.containers,
            isPurchased: isPurchased ?? self.isPurchased,
            styles: styles ?? self.styles,
            tags: tags ?? self.tags,
            iconID: iconID ?? self.iconID,
            prices: prices ?? self.prices,
            categories: categories ?? self.categories,
            rasterSizes: rasterSizes ?? self.rasterSizes,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.categoryTask(with: url) { category, response, error in
//     if let category = category {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Category
struct Category: Codable {
    let identifier, name: String
}

// MARK: Category convenience initializers and mutators

extension Category {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Category.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        identifier: String? = nil,
        name: String? = nil
    ) -> Category {
        return Category(
            identifier: identifier ?? self.identifier,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.containerTask(with: url) { container, response, error in
//     if let container = container {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Container
struct Container: Codable {
    let downloadURL: String
    let format: ContainerFormat

    enum CodingKeys: String, CodingKey {
        case downloadURL = "download_url"
        case format
    }
}

// MARK: Container convenience initializers and mutators

extension Container {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Container.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        downloadURL: String? = nil,
        format: ContainerFormat? = nil
    ) -> Container {
        return Container(
            downloadURL: downloadURL ?? self.downloadURL,
            format: format ?? self.format
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum ContainerFormat: String, Codable {
    case ai = "ai"
    case icns = "icns"
    case ico = "ico"
    case svg = "svg"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.priceTask(with: url) { price, response, error in
//     if let price = price {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Price
struct Price: Codable {
    let price: Int
    let currency: String
    let license: License
}

// MARK: Price convenience initializers and mutators

extension Price {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Price.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        price: Int? = nil,
        currency: String? = nil,
        license: License? = nil
    ) -> Price {
        return Price(
            price: price ?? self.price,
            currency: currency ?? self.currency,
            license: license ?? self.license
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.licenseTask(with: url) { license, response, error in
//     if let license = license {
//       ...
//     }
//   }
//   task.resume()

// MARK: - License
struct License: Codable {
    let url: String
    let licenseID: Int
    let scope, name: String

    enum CodingKeys: String, CodingKey {
        case url
        case licenseID = "license_id"
        case scope, name
    }
}

// MARK: License convenience initializers and mutators

extension License {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(License.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String? = nil,
        licenseID: Int? = nil,
        scope: String? = nil,
        name: String? = nil
    ) -> License {
        return License(
            url: url ?? self.url,
            licenseID: licenseID ?? self.licenseID,
            scope: scope ?? self.scope,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.rasterSizeTask(with: url) { rasterSize, response, error in
//     if let rasterSize = rasterSize {
//       ...
//     }
//   }
//   task.resume()

// MARK: - RasterSize
struct RasterSize: Codable {
    let sizeWidth, size, sizeHeight: Int
    let formats: [FormatElement]

    enum CodingKeys: String, CodingKey {
        case sizeWidth = "size_width"
        case size
        case sizeHeight = "size_height"
        case formats
    }
}

// MARK: RasterSize convenience initializers and mutators

extension RasterSize {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RasterSize.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sizeWidth: Int? = nil,
        size: Int? = nil,
        sizeHeight: Int? = nil,
        formats: [FormatElement]? = nil
    ) -> RasterSize {
        return RasterSize(
            sizeWidth: sizeWidth ?? self.sizeWidth,
            size: size ?? self.size,
            sizeHeight: sizeHeight ?? self.sizeHeight,
            formats: formats ?? self.formats
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.formatElementTask(with: url) { formatElement, response, error in
//     if let formatElement = formatElement {
//       ...
//     }
//   }
//   task.resume()

// MARK: - FormatElement
struct FormatElement: Codable {
    let downloadURL: String
    let format: PurpleFormat
    let previewURL: String

    enum CodingKeys: String, CodingKey {
        case downloadURL = "download_url"
        case format
        case previewURL = "preview_url"
    }
}

// MARK: FormatElement convenience initializers and mutators

extension FormatElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FormatElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        downloadURL: String? = nil,
        format: PurpleFormat? = nil,
        previewURL: String? = nil
    ) -> FormatElement {
        return FormatElement(
            downloadURL: downloadURL ?? self.downloadURL,
            format: format ?? self.format,
            previewURL: previewURL ?? self.previewURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum PurpleFormat: String, Codable {
    case png = "png"
}

enum TypeEnum: String, Codable {
    case vector = "vector"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.vectorSizeTask(with: url) { vectorSize, response, error in
//     if let vectorSize = vectorSize {
//       ...
//     }
//   }
//   task.resume()

// MARK: - VectorSize
struct VectorSize: Codable {
    let sizeWidth, size, sizeHeight: Int
    let targetSizes: [[Int]]
    let formats: [Container]

    enum CodingKeys: String, CodingKey {
        case sizeWidth = "size_width"
        case size
        case sizeHeight = "size_height"
        case targetSizes = "target_sizes"
        case formats
    }
}

// MARK: VectorSize convenience initializers and mutators

extension VectorSize {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VectorSize.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sizeWidth: Int? = nil,
        size: Int? = nil,
        sizeHeight: Int? = nil,
        targetSizes: [[Int]]? = nil,
        formats: [Container]? = nil
    ) -> VectorSize {
        return VectorSize(
            sizeWidth: sizeWidth ?? self.sizeWidth,
            size: size ?? self.size,
            sizeHeight: sizeHeight ?? self.sizeHeight,
            targetSizes: targetSizes ?? self.targetSizes,
            formats: formats ?? self.formats
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
