// mongosh
use capstone

db.products.insertOne({
  sku: "LAP-002",
  name: "Gaming Laptop 16",
  price: 1899.99,
  category: "Computers",
  attributes: {
    cpu: "Ryzen 9",
    ram_gb: 32,
    gpu: "RTX 4080",
    screen_hz: 240
  }
})

db.products.createIndex({ "attributes.gpu": 1 })
db.products.find({ "attributes.gpu": "RTX 4080" })