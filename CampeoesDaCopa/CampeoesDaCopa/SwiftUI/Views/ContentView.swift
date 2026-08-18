//
//  ContentView.swift
//  CampeoesDaCopa
//
//  Main content view with Liquid Glass design for Copa 2026
//

import SwiftUI

struct ContentView: View {
    @State private var selectedEdition: WorldCupEdition?
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Animated gradient background
                copa2026Gradient()
                
                // Liquid flow effect overlay
                liquidFlowEffect()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Header Section
                        headerSection
                        
                        // Featured Copa 2026 Card
                        featuredCard
                        
                        // Champions List Title
                        listTitle
                        
                        // Champions Grid
                        championsGrid
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showDetail) {
                if let edition = selectedEdition {
                    DetailView(edition: edition)
                }
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("🏆")
                .font(.system(size: 60))
            
            Text("Campeões da Copa")
                .font(.custom("Helvetica-Bold", size: 32))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
            
            Text("Rumo ao Mundial 2026")
                .font(.custom("Helvetica", size: 18))
                .foregroundColor(.white.opacity(0.9))
            
            // Liquid glass badge
            GlassCardView(intensity: 0.5, cornerRadius: 15) {
                HStack(spacing: 8) {
                    Image(systemName: "globe.americas.fill")
                        .foregroundColor(.white)
                    Text("EUA • México • Canadá 2026")
                        .font(.custom("Helvetica-Bold", size: 14))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 30)
    }
    
    // MARK: - Featured Card (Copa 2026)
    private var featuredCard: some View {
        GlassCardView(intensity: 0.8, cornerRadius: 30) {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Copa 2026")
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text("2026")
                            .font(.custom("Helvetica-Bold", size: 48))
                            .foregroundColor(.white)
                        
                        Text("Espanha Campeã!")
                            .font(.custom("Helvetica-Bold", size: 16))
                            .foregroundColor(.yellow)
                        
                        Text("48 Seleções • 104 Jogos")
                            .font(.custom("Helvetica", size: 12))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // Trophy icon with glow
                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [
                                        Color.yellow.opacity(0.6),
                                        Color.orange.opacity(0.3),
                                        Color.clear
                                    ]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: 50
                                )
                            )
                            .frame(width: 100, height: 100)
                        
                        Text("🏆")
                            .font(.system(size: 50))
                    }
                }
                
                // Progress bar to 2026
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Resultado Final")
                            .font(.custom("Helvetica", size: 12))
                            .foregroundColor(.white.opacity(0.8))
                        Spacer()
                        Text("Espanha 1-0 Argentina")
                            .font(.custom("Helvetica-Bold", size: 12))
                            .foregroundColor(.yellow)
                    }
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.2))
                                .frame(height: 8)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.yellow, .orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geometry.size.width * 1.0, height: 8)
                        }
                    }
                    .frame(height: 8)
                }
            }
            .padding(25)
        }
        .padding(.vertical, 10)
    }
    
    // MARK: - List Title
    private var listTitle: some View {
        HStack {
            Rectangle()
                .fill(Color.white.opacity(0.5))
                .frame(height: 2)
            
            Text("HISTÓRICO DE CAMPEÕES")
                .font(.custom("Helvetica-Bold", size: 14))
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal, 12)
            
            Rectangle()
                .fill(Color.white.opacity(0.5))
                .frame(height: 2)
        }
        .padding(.vertical, 20)
    }
    
    // MARK: - Champions Grid
    private var championsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(WorldCupEdition.sampleData) { edition in
                ChampionCard(edition: edition)
                    .onTapGesture {
                        selectedEdition = edition
                        showDetail = true
                    }
            }
        }
    }
}

// MARK: - Champion Card Component
struct ChampionCard: View {
    let edition: WorldCupEdition
    
    var body: some View {
        GlassCardView(intensity: 0.6, cornerRadius: 20) {
            VStack(spacing: 12) {
                HStack {
                    // Year badge
                    Text("\(edition.year)")
                        .font(.custom("Helvetica-Bold", size: 24))
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    // Country flag placeholder
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 40, height: 40)
                        
                        Text(genericFlagEmoji(for: edition.winner))
                            .font(.system(size: 20))
                    }
                }
                
                Divider()
                    .background(Color.white.opacity(0.3))
                
                VStack(spacing: 6) {
                    Text(edition.winner)
                        .font(.custom("Helvetica-Bold", size: 16))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    HStack(spacing: 4) {
                        Text(edition.winnerScore)
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.green)
                        
                        Text("vs")
                            .font(.custom("Helvetica", size: 10))
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text(edition.viceScore)
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.red.opacity(0.8))
                    }
                    
                    Text("🆚 \(edition.vice)")
                        .font(.custom("Helvetica", size: 12))
                        .foregroundColor(.white.opacity(0.7))
                        .lineLimit(1)
                }
                
                // Host country indicator
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(edition.country)
                        .font(.custom("Helvetica", size: 10))
                        .foregroundColor(.white.opacity(0.6))
                        .lineLimit(1)
                }
            }
            .padding(16)
        }
    }
    
    // Helper function for flag emojis
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
            "Espanha": "🇪🇸"
        ]
        
        return flagMap[country, default: "🌍"]
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
