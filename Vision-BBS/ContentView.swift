//
//  ContentView.swift
//  Vision-BBS
//
//  Created by Henk Hornschuh on 14.11.24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    let products = Product.sampleProducts
    @State private var cartItems: [CartItem] = []
    
    var body: some View {
        HStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    Text("Vision BBS Shop")
                        .font(.largeTitle)
                        .padding()
                    
                    // Main content
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 300))
                    ], spacing: 20) {
                        ForEach(products) { product in
                            ProductCard(product: product, cartItems: $cartItems)
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                    .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white.opacity(0.3), lineWidth: 0.5)
                }
        }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            // Cart View
            CartView(cartItems: $cartItems)
        }
        .padding()
        .background {
            Color.black.opacity(0.1)
                .ignoresSafeArea()
        }
    }
}

// Update ProductCard to use Product model
struct ProductCard: View {
    let product: Product
    @Binding var cartItems: [CartItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.2))
                .frame(height: 200)
                .overlay(
                    Image(systemName: product.imageName)
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(String(format: "$%.2f", product.price))
                    .font(.subheadline)
                    .foregroundColor(.blue)
                Text(product.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Button(action: {
                    if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
                    cartItems[index].quantity += 1
                } else {
                    cartItems.append(CartItem(product: product, quantity: 1))
                }
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
                .tint(LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
