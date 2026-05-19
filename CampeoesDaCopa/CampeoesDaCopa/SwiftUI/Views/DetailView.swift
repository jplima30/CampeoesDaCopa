//
//  DetailView.swift
//  CampeoesDaCopa
//
//  Detail view for each World Cup edition with Liquid Glass design
//

import SwiftUI

struct DetailView: View {
    let edition: WorldCupEdition
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background gradient
            copa2026Gradient()
            
            ScrollView {
                VStack(spacing: 25) {
                    // Header with year and trophy
                    headerSection
                    
                    // Final Match Card
                    finalMatchCard
                    
                    // Tournament Info
                    tournamentInfo
                    
                    // Historical Context
                    historicalContext
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
        .overlay(
            // Close button
            HStack {
                VStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.white.opacity(0.8))
                            .shadow(radius: 3)
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
            }
        )
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 15) {
            // Trophy animation
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.yellow.opacity(0.4),
                                Color.orange.opacity(0.2),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: 80
                        )
                    )
                    .frame(width: 150, height: 150)
                
                Text("🏆")
                    .font(.system(size: 80))
                    .scaleEffect(1.2)
            }
            
            // Year badge
            GlassCardView(intensity: 0.7, cornerRadius: 20) {
                Text("COPA DE \(edition.year)")
                    .font(.custom("Helvetica-Bold", size: 28))
                    .foregroundColor(.yellow)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 20)
            }
            
            // Host country
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.white.opacity(0.8))
                
                Text(edition.country)
                    .font(.custom("Helvetica", size: 16))
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 60)
        .padding(.bottom, 20)
    }
    
    // MARK: - Final Match Card
    private var finalMatchCard: some View {
        GlassCardView(intensity: 0.85, cornerRadius: 30) {
            VStack(spacing: 20) {
                Text("FINAL")
                    .font(.custom("Helvetica-Bold", size: 20))
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.bottom, 10)
                
                // Teams and score
                HStack(spacing: 30) {
                    // Winner
                    VStack(spacing: 10) {
                        Text(genericFlagEmoji(for: edition.winner))
                            .font(.system(size: 50))
                        
                        Text(edition.winner)
                            .font(.custom("Helvetica-Bold", size: 16))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Score
                    VStack(spacing: 5) {
                        Text(edition.winnerScore)
                            .font(.custom("Helvetica-Bold", size: 32))
                            .foregroundColor(.yellow)
                        
                        Text("X")
                            .font(.custom("Helvetica", size: 16))
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text(edition.viceScore)
                            .font(.custom("Helvetica-Bold", size: 32))
                            .foregroundColor(.red.opacity(0.8))
                    }
                    
                    // Vice
                    VStack(spacing: 10) {
                        Text(genericFlagEmoji(for: edition.vice))
                            .font(.system(size: 50))
                        
                        Text(edition.vice)
                            .font(.custom("Helvetica-Bold", size: 16))
                            .foregroundColor(.red.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                }
                
                // Champion badge
                if edition.winner != "Em Breve" {
                    GlassCardView(intensity: 0.5, cornerRadius: 15) {
                        HStack(spacing: 8) {
                            Text("👑")
                            Text("CAMPEÃO")
                                .font(.custom("Helvetica-Bold", size: 14))
                        }
                        .foregroundColor(.yellow)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 16)
                    }
                }
            }
            .padding(25)
        }
    }
    
    // MARK: - Tournament Info
    private var tournamentInfo: some View {
        GlassCardView(intensity: 0.7, cornerRadius: 25) {
            VStack(spacing: 15) {
                Text("INFORMAÇÕES DO TORNEIO")
                    .font(.custom("Helvetica-Bold", size: 16))
                    .foregroundColor(.white.opacity(0.9))
                
                Divider()
                    .background(Color.white.opacity(0.3))
                
                InfoRow(icon: "trophy.fill", label: "Campeão", value: edition.winner)
                InfoRow(icon: "star.fill", label: "Vice-Campeão", value: edition.vice)
                InfoRow(icon: "globe", label: "Sede", value: edition.country)
                
                if edition.year == 2026 {
                    InfoRow(icon: "flag.checkered", label: "Status", value: "Em Preparação")
                    InfoRow(icon: "number.circle", label: "Seleções", value: "48 (Confirmado)")
                } else {
                    InfoRow(icon: "calendar", label: "Ano", value: "\(edition.year)")
                }
            }
            .padding(20)
        }
    }
    
    // MARK: - Historical Context
    private var historicalContext: some View {
        GlassCardView(intensity: 0.6, cornerRadius: 25) {
            VStack(alignment: .leading, spacing: 15) {
                Text("CONTEXTO HISTÓRICO")
                    .font(.custom("Helvetica-Bold", size: 16))
                    .foregroundColor(.white.opacity(0.9))
                
                Divider()
                    .background(Color.white.opacity(0.3))
                
                if edition.year == 2026 {
                    historicalText2026
                } else if edition.year == 2022 {
                    historicalText2022
                } else if edition.year == 2014 {
                    historicalText2014
                } else if edition.year == 2002 {
                    historicalText2002
                } else if edition.year == 1970 {
                    historicalText1970
                } else if edition.year == 1950 {
                    historicalText1950
                } else {
                    genericHistoricalText
                }
            }
            .padding(20)
        }
    }
    
    private var historicalText2026: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("A Copa do Mundo de 2026 será histórica!")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Primeira Copa com 48 seleções")
            BulletPoint(text: "Realizada em 3 países: EUA, México e Canadá")
            BulletPoint(text: "104 jogos no total")
            BulletPoint(text: "16 cidades-sede na América do Norte")
        }
    }
    
    private var historicalText2022: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("A Argentina conquistou seu terceiro título em uma das finais mais emocionantes da história!")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Messi finalmente levantou a taça")
            BulletPoint(text: "Final decidiu nos pênaltis após 3-3")
            BulletPoint(text: "Mbappé fez hat-trick na França")
        }
    }
    
    private var historicalText2014: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("A Alemanha venceu seu quarto título no Brasil, em uma campanha dominante.")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "7x1 histórico contra o Brasil na semifinal")
            BulletPoint(text: "Götze marcou o gol da vitória na final")
            BulletPoint(text: "Primeiro título unificado da Alemanha")
        }
    }
    
    private var historicalText2002: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("O Brasil conquistou o Pentacampeonato na Ásia!")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Ronaldinho Fenômeno se redimiu")
            BulletPoint(text: "Rivaldo e Ronaldo brilharam")
            BulletPoint(text: "Kleberison defendeu pênalti na final")
        }
    }
    
    private var historicalText1970: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("O tricampeonato do Brasil no México é considerado por muitos como a melhor equipe de todos os tempos!")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Pelé, Jairzinho, Tostão, Rivelino e Gérson")
            BulletPoint(text: "Futebol arte em sua máxima expressão")
            BulletPoint(text: "Brasil ganhou a taça Jules Rimet definitivamente")
        }
    }
    
    private var historicalText1950: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("O Maracanaço! O Uruguai chocou o Brasil na final disputada no Maracanã.")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Mais de 200 mil pessoas no estádio")
            BulletPoint(text: "Brasil precisava apenas de um empate")
            BulletPoint(text: "Virada uruguaia por 2-1")
        }
    }
    
    private var genericHistoricalText: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Uma edição memorável da Copa do Mundo que entrou para a história do futebol.")
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            
            BulletPoint(text: "Momentos inesquecíveis")
            BulletPoint(text: "Grandes jogadores brilharam")
            BulletPoint(text: "Legado para o futebol mundial")
        }
    }
    
    // MARK: - Helper Functions
    func genericFlagEmoji(for country: String) -> String {
        let flagMap: [String: String] = [
            "Brasil": "🇧🇷",
            "Alemanha": "🇩🇪",
            "Alemanha Ocidental": "🇩🇪",
            "Argentina": "🇦🇷",
            "França": "🇫🇷",
            "Itália": "🇮🇹",
            "Espanha": "🇪🇸",
            "Inglaterra": "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
            "Uruguai": "🇺🇾",
            "Holanda": "🇳🇱",
            "Croácia": "🇭🇷",
            "Suécia": "🇸🇪",
            "Suíça": "🇨🇭",
            "Portugal": "🇵🇹",
            "México": "🇲🇽",
            "Rússia": "🇷🇺",
            "Catar": "🇶🇦",
            "Em Breve": "⭐"
        ]
        
        return flagMap[country, default: "🌍"]
    }
}

// MARK: - Supporting Components
struct InfoRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.yellow)
                .frame(width: 25)
            
            Text(label)
                .font(.custom("Helvetica", size: 14))
                .foregroundColor(.white.opacity(0.7))
            
            Spacer()
            
            Text(value)
                .font(.custom("Helvetica-Bold", size: 14))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct BulletPoint: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundColor(.yellow)
            
            Text(text)
                .font(.custom("Helvetica", size: 13))
                .foregroundColor(.white.opacity(0.75))
        }
    }
}

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(edition: WorldCupEdition.sampleData[0])
        }
    }
}
