struct MovieModel: Codable, Identifiable {
    let _id: String
    let id: String
    let primaryImage: Image?
    let titleType: TitleType
    let titleText: TitleText
    let originalTitleText: TitleText
    let releaseYear: ReleaseYear
    let releaseDate: ReleaseDate?

    struct Image: Codable {
        let id: String
        let width: Int
        let height: Int
        let url: String
        let caption: Caption

        struct Caption: Codable {
            let plainText: String
        }
    }

    struct TitleType: Codable {
        let text: String
        let id: String
        let isSeries: Bool
        let isEpisode: Bool
    }

    struct TitleText: Codable {
        let text: String
    }

    struct ReleaseYear: Codable {
        let year: Int
        let endYear: Int?
    }

    struct ReleaseDate: Codable {
        let day: Int?
        let month: Int?
        let year: Int?
    }
}
