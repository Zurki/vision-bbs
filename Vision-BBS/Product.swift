import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageName: String
    
    static let sampleProducts = [
        Product(
            name: "Vintage Computer",
            description: "Classic 8-bit computer from the golden age of BBSes",
            price: 299.99,
            imageName: "desktopcomputer"
        ),
        Product(
            name: "Retro Modem",
            description: "14.4k baud modem for authentic BBS connections",
            price: 89.99,
            imageName: "antenna.radiowaves.left.and.right"
        ),
        Product(
            name: "BBS Software Pack",
            description: "Complete suite of classic BBS software",
            price: 49.99,
            imageName: "externaldrive.fill"
        ),
        Product(
            name: "Mechanical Keyboard",
            description: "Clicky mechanical keyboard for authentic typing experience",
            price: 159.99,
            imageName: "keyboard"
        ),
        Product(
            name: "Retro Monitor",
            description: "CRT-style display with authentic phosphor glow",
            price: 199.99,
            imageName: "display"
        ),
        Product(
            name: "ASCII Art Collection",
            description: "Curated collection of classic BBS artwork",
            price: 29.99,
            imageName: "photo.artframe"
        )
    ]
} 