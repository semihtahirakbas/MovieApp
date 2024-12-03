struct MovieModel: Codable, Identifiable, Equatable, Hashable {
    let _id: String
    let id: String
    let primaryImage: Image?
    let titleType: TitleType
    let titleText: TitleText
    let originalTitleText: TitleText
    let releaseYear: ReleaseYear
    let releaseDate: ReleaseDate?

    // Conformance to Equatable (Structs automatically conform when all properties are Equatable)
    static func == (lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.id == rhs.id
    }

    // Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    struct Image: Codable, Equatable, Hashable {
        let id: String
        let width: Int
        let height: Int
        let url: String
        let caption: Caption

        struct Caption: Codable, Equatable, Hashable {
            let plainText: String
        }
    }

    struct TitleType: Codable, Equatable, Hashable {
        let text: String
        let id: String
        let isSeries: Bool
        let isEpisode: Bool
    }

    struct TitleText: Codable, Equatable, Hashable {
        let text: String
    }

    struct ReleaseYear: Codable, Equatable, Hashable {
        let year: Int
        let endYear: Int?
    }

    struct ReleaseDate: Codable, Equatable, Hashable {
        let day: Int?
        let month: Int?
        let year: Int?
    }
}
