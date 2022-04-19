//
//  Model.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let url: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// MARK: - Result
struct Result: Codable {
    let artistName, id, name, releaseDate: String
    let kind: Kind
    let artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: ContentAdvisoryRating?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

enum ContentAdvisoryRating: String, Codable {
    case explict = "Explict"
}

// MARK: - Genre
struct Genre: Codable {
    let genreID: String
    let name: Name
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Name: String, Codable {
    case alternative = "Alternative"
    case dance = "Dance"
    case hipHopRap = "Hip-Hop/Rap"
    case music = "Music"
    case pop = "Pop"
    case rock = "Rock"
}

enum Kind: String, Codable {
    case songs = "songs"
}


