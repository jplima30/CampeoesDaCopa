//
//  WorldCup2026.swift
//  CampeoesDaCopa
//
//  Models for Copa 2026 and historical data
//

import Foundation

struct WorldCupEdition: Identifiable, Codable {
    let id = UUID()
    let year: Int
    let country: String
    let winner: String
    let vice: String
    let winnerScore: String
    let viceScore: String
    let matches: [Match]
    
    var winnerFlagName: String {
        return winner.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: "")
    }
}

struct Match: Codable, Identifiable {
    let id = UUID()
    let stage: String
    let games: [Game]
}

struct Game: Codable, Identifiable {
    let id = UUID()
    let home: String
    let away: String
    let score: String
}

// MARK: - Sample Data for Copa 2026
extension WorldCupEdition {
    static let copa2026 = WorldCupEdition(
        year: 2026,
        country: "EUA, México e Canadá",
        winner: "Em Breve",
        vice: "Em Breve",
        winnerScore: "-",
        viceScore: "-",
        matches: []
    )
    
    static let sampleData: [WorldCupEdition] = [
        copa2026,
        WorldCupEdition(year: 2022, country: "Catar", winner: "Argentina", vice: "França", winnerScore: "3 (4)", viceScore: "3 (2)", matches: []),
        WorldCupEdition(year: 2018, country: "Rússia", winner: "França", vice: "Croácia", winnerScore: "4", viceScore: "2", matches: []),
        WorldCupEdition(year: 2014, country: "Brasil", winner: "Alemanha", vice: "Argentina", winnerScore: "1", viceScore: "0", matches: []),
        WorldCupEdition(year: 2010, country: "África do Sul", winner: "Espanha", vice: "Holanda", winnerScore: "1", viceScore: "0", matches: []),
        WorldCupEdition(year: 2006, country: "Alemanha", winner: "Itália", vice: "França", winnerScore: "1 (5)", viceScore: "1 (3)", matches: []),
        WorldCupEdition(year: 2002, country: "Coreia do Sul e Japão", winner: "Brasil", vice: "Alemanha", winnerScore: "2", viceScore: "0", matches: []),
        WorldCupEdition(year: 1998, country: "França", winner: "França", vice: "Brasil", winnerScore: "3", viceScore: "0", matches: []),
        WorldCupEdition(year: 1994, country: "Estados Unidos", winner: "Brasil", vice: "Itália", winnerScore: "(0) 3", viceScore: "0 (2)", matches: []),
        WorldCupEdition(year: 1990, country: "Itália", winner: "Alemanha Ocidental", vice: "Argentina", winnerScore: "1", viceScore: "0", matches: []),
        WorldCupEdition(year: 1986, country: "México", winner: "Argentina", vice: "Alemanha Ocidental", winnerScore: "3", viceScore: "2", matches: []),
        WorldCupEdition(year: 1982, country: "Espanha", winner: "Itália", vice: "Alemanha Ocidental", winnerScore: "3", viceScore: "1", matches: []),
        WorldCupEdition(year: 1978, country: "Argentina", winner: "Argentina", vice: "Holanda", winnerScore: "3", viceScore: "1", matches: []),
        WorldCupEdition(year: 1974, country: "Alemanha Ocidental", winner: "Alemanha Ocidental", vice: "Holanda", winnerScore: "2", viceScore: "1", matches: []),
        WorldCupEdition(year: 1970, country: "México", winner: "Brasil", vice: "Itália", winnerScore: "4", viceScore: "1", matches: []),
        WorldCupEdition(year: 1966, country: "Inglaterra", winner: "Inglaterra", vice: "Alemanha Ocidental", winnerScore: "4", viceScore: "2", matches: []),
        WorldCupEdition(year: 1962, country: "Chile", winner: "Brasil", vice: "Tchecoslováquia", winnerScore: "3", viceScore: "1", matches: []),
        WorldCupEdition(year: 1958, country: "Suécia", winner: "Brasil", vice: "Suécia", winnerScore: "5", viceScore: "2", matches: []),
        WorldCupEdition(year: 1954, country: "Suíça", winner: "Alemanha Ocidental", vice: "Hungria", winnerScore: "3", viceScore: "2", matches: []),
        WorldCupEdition(year: 1950, country: "Brasil", winner: "Uruguai", vice: "Brasil", winnerScore: "2", viceScore: "1", matches: []),
        WorldCupEdition(year: 1938, country: "França", winner: "Itália", vice: "Hungria", winnerScore: "4", viceScore: "2", matches: []),
        WorldCupEdition(year: 1934, country: "Itália", winner: "Itália", vice: "Tchecoslováquia", winnerScore: "2", viceScore: "1", matches: []),
        WorldCupEdition(year: 1930, country: "Uruguai", winner: "Uruguai", vice: "Argentina", winnerScore: "4", viceScore: "2", matches: [])
    ]
}
