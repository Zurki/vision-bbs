import SwiftUI

struct CartView: View {
    @Binding var cartItems: [CartItem]
    
    @State private var showConfirmationDialog = false
    @State private var selectedProduct: Product? = nil
    
    var body: some View {
        VStack {
            Text("Shopping Cart")
                .font(.title)
                .padding()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cartItems) { item in
                        CartItemRow(item: item)
                    }
                }
                .padding()
            }
            
            if !cartItems.isEmpty {
                VStack {
                    Text("Total: $\(totalPrice, specifier: "%.2f")")
                        .font(.headline)
                        .padding()
                    
                    Button(action: {
                        // Handle checkout
                        print("Proceeding to checkout")
                        // Show confirmation dialog
                        showConfirmationDialog = true
                    }) {
                        Text("Checkout")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .tint(LinearGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .padding()
                    .confirmationDialog("Confirm Purchase", isPresented: $showConfirmationDialog, actions: {
                        Button("Confirm Purchase", role: .destructive) {
                            cartItems.removeAll()  // Clear the cart
                        }
                        Button("Cancel", role: .cancel) {}
                    }, message: {
                        Text("Are you sure you want to complete this purchase?")
                    })
                }
                .background(.ultraThinMaterial)
            }
        }
        .frame(width: 300)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white.opacity(0.3), lineWidth: 0.5)
                }
        }
        .shadow(radius: 5)
        .cornerRadius(15)
    }
    
    private var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}

struct CartItemRow: View {
    let item: CartItem
    
    var body: some View {
        HStack {
            Image(systemName: item.product.imageName)
                .font(.title2)
            
            VStack(alignment: .leading) {
                Text(item.product.name)
                    .font(.headline)
                Text("$\(item.product.price, specifier: "%.2f") × \(item.quantity)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text("$\(item.product.price * Double(item.quantity), specifier: "%.2f")")
                .font(.headline)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(8)
    }
} 
