//
//  LiquidGlassModifier.swift
//  CampeoesDaCopa
//
//  Custom modifiers for Liquid Glass design effect
//

import SwiftUI

// MARK: - Liquid Glass Background Effect
struct LiquidGlassBackground: ViewModifier {
    var intensity: Double = 0.7
    var blurRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.4 * intensity),
                                Color.white.opacity(0.1 * intensity)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.8),
                                        Color.white.opacity(0.2),
                                        Color.clear
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
    }
}

// MARK: - Glass Card View
struct GlassCardView<Content: View>: View {
    let content: Content
    var intensity: Double = 0.7
    var cornerRadius: CGFloat = 25
    
    init(intensity: Double = 0.7, cornerRadius: CGFloat = 25, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.intensity = intensity
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.4 * intensity),
                                Color.white.opacity(0.1 * intensity)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.9),
                                        Color.white.opacity(0.3),
                                        Color.clear
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
                    .shadow(color: Color.black.opacity(0.15), radius: 15, x: 0, y: 8)
            )
    }
}

// MARK: - Liquid Flow Animation
struct LiquidFlowEffect: ViewModifier {
    @State private var animate = false
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Canvas { context, size in
                        for i in 0..<5 {
                            let path = Circle().path(in: CGRect(
                                x: animate ? CGFloat(i) * size.width / 5 : -size.width / 5,
                                y: size.height / 2 - 50,
                                width: 100,
                                height: 100
                            ))
                            
                            context.fill(
                                path,
                                with: .color(.white.opacity(0.1))
                            )
                        }
                    }
                    .blur(radius: 30)
                    .animation(
                        Animation.easeInOut(duration: 3).repeatForever(autoreverses: false),
                        value: animate
                    )
                    .onAppear {
                        animate = true
                    }
                }
            )
    }
}

// MARK: - View Extensions
extension View {
    func liquidGlassBackground(intensity: Double = 0.7, blurRadius: CGFloat = 20) -> some View {
        modifier(LiquidGlassBackground(intensity: intensity, blurRadius: blurRadius))
    }
    
    func liquidFlowEffect() -> some View {
        modifier(LiquidFlowEffect())
    }
}

// MARK: - Gradient Background for Copa 2026
struct Copa2026Gradient: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.0, green: 0.4, blue: 0.8),      // Deep Blue
                        Color(red: 0.0, green: 0.6, blue: 0.9),      // Sky Blue
                        Color(red: 0.2, green: 0.8, blue: 0.6),      // Teal
                        Color(red: 0.4, green: 0.9, blue: 0.4)       // Green
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
    }
}

extension View {
    func copa2026Gradient() -> some View {
        modifier(Copa2026Gradient())
    }
}
