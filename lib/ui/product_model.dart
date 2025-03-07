class Category {
  final String image, name;
  Category({required this.image, required this.name});
}

List<Category> categories = [
  Category(
    image: 'hotcoffee.png',
    name: 'Hot Drinks',
  ),
  Category(
    image: 'icedcoffee.png',
    name: 'Cold Drinks',
  ),
  Category(
    image: 'teas.png',
    name: 'Tea',
  ),
  Category(
    image: 'cookie.png',
    name: 'Food',
  ),
];

class Product {
  final String image, name;
  final double price;
  final Category category;
  final String description;
  final int calories;
  final String? milkType;
  final List<String> ingredients;

  Product({
    required this.category,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.calories,
    this.milkType,
    required this.ingredients,
  });
}

List<Product> products = [
  // Food Items
  Product(
    image: 'bakery/bakery6.png',
    name: 'Chocolate Muffin',
    category: categories[3],
    price: 4.15,
    description:
        "Rich, decadent double chocolate muffin made with premium cocoa and chocolate chips. A chocolate lover's dream for any time of day.",
    calories: 420,
    ingredients: [
      'Wheat Flour',
      'Premium Cocoa',
      'Chocolate Chips',
      'Butter',
      'Brown Sugar',
      'Eggs',
      'Vanilla Extract',
      'Sour Cream'
    ],
  ),
  Product(
    image: 'bakery/bakery7.png',
    name: 'Club Sandwich',
    category: categories[3],
    price: 8.95,
    description:
        'A classic club sandwich made with roasted turkey breast, bacon, lettuce, tomato, and mayonnaise on toasted white bread.',
    calories: 520,
    ingredients: [
      'Turkey Breast',
      'Bacon',
      'Lettuce',
      'Tomato',
      'Mayonnaise',
      'White Bread'
    ],
  ),
  Product(
    image: 'bakery/bakery1.png',
    name: 'Blueberry Muffin',
    category: categories[3],
    price: 3.95,
    description:
        'A moist, tender muffin loaded with wild blueberries and a hint of lemon zest. Perfect for breakfast or an afternoon treat.',
    calories: 380,
    ingredients: [
      'Wheat Flour',
      'Wild Blueberries',
      'Butter',
      'Sugar',
      'Eggs',
      'Lemon Zest',
      'Vanilla Extract'
    ],
  ),
  Product(
    image: 'bakery/bakery2.png',
    name: 'Butter Croissant',
    category: categories[3],
    price: 3.45,
    description:
        'Flaky, buttery layers of hand-rolled pastry, baked to golden perfection. A classic French breakfast pastry.',
    calories: 260,
    ingredients: [
      'French Butter',
      'Wheat Flour',
      'Yeast',
      'Sugar',
      'Salt',
      'Milk'
    ],
  ),
  Product(
    image: 'bakery/bakery3.png',
    name: 'Blueberry Scone',
    category: categories[3],
    price: 3.75,
    description:
        'Buttery, crumbly scone packed with plump blueberries and finished with a sweet vanilla glaze.',
    calories: 320,
    ingredients: [
      'Wheat Flour',
      'Butter',
      'Blueberries',
      'Heavy Cream',
      'Sugar',
      'Vanilla Glaze'
    ],
  ),
  Product(
    image: 'bakery/bakery5.png',
    name: 'Pumpkin Cream Cheese Muffin',
    category: categories[3],
    price: 4.25,
    description:
        'Spiced pumpkin muffin with a sweet cream cheese filling, topped with pumpkin seeds.',
    calories: 420,
    ingredients: [
      'Pumpkin Puree',
      'Cream Cheese',
      'Wheat Flour',
      'Spices',
      'Sugar',
      'Pumpkin Seeds'
    ],
  ),
  Product(
    image: 'bakery/bakery4.png',
    name: 'Petite Vanilla Bean Scone',
    category: categories[3],
    price: 2.95,
    description:
        'Mini vanilla-flavored scone with a sweet vanilla bean glaze. A delightful bite-sized treat.',
    calories: 120,
    ingredients: [
      'Wheat Flour',
      'Butter',
      'Vanilla Beans',
      'Heavy Cream',
      'Sugar',
      'Vanilla Glaze'
    ],
  ),

  // Cold Drinks
  Product(
    image: 'drinks/drink8.png',
    name: 'Chocolate Chip Frappuccino',
    category: categories[1],
    price: 6.25,
    description:
        'Rich mocha-flavored sauce meets up with chocolaty chips, milk and ice for a blender bash.',
    calories: 410,
    milkType: 'Whole Milk',
    ingredients: [
      'Mocha Sauce',
      'Milk',
      'Ice',
      'Whipped Cream',
      'Chocolate Chips'
    ],
  ),
  Product(
    image: 'drinks/drink2.png',
    name: 'Caramel Macchiato Frappuccino',
    category: categories[1],
    price: 5.45,
    description:
        'Sweet and creamy blend of coffee, milk, and rich caramel brulee sauce, topped with whipped cream and crunchy caramel pieces.',
    calories: 420,
    milkType: 'Whole Milk',
    ingredients: [
      'Coffee',
      'Caramel Brulee Sauce',
      'Milk',
      'Ice',
      'Whipped Cream',
      'Caramel Brulee Topping'
    ],
  ),
  Product(
    image: 'drinks/drink7.png',
    name: 'Iced White Mocha',
    category: categories[1],
    price: 5.95,
    description:
        'Iced white mocha, creamy milk, few pumps of vanilla all it takes for a perfect blend of sweetness & coffee.',
    calories: 244,
    milkType: 'Coconut Milk',
    ingredients: [
      'Vanilla',
      'Mocha',
      'Ice',
      'Whipped Cream',
      'Caramel Drizzle Topping'
    ],
  ),
  Product(
    image: 'drinks/drink5.png',
    name: 'Dulce De Leche Frap',
    category: categories[1],
    price: 5.45,
    description:
        'A creamy blend of caramel sauce, coffee, and milk, topped with whipped cream and salted pistachio topping.',
    calories: 380,
    milkType: 'Whole Milk',
    ingredients: [
      'Coffee',
      'Caramel Sauce',
      'Milk',
      'Ice',
      'Whipped Cream',
      'Salted Pistachio Topping'
    ],
  ),
  Product(
    image: 'drinks/drink4.png',
    name: 'Strawberry Açaí',
    category: categories[1],
    price: 4.95,
    description:
        'Strawberry açaí refresher with coconut milk and real strawberry pieces.',
    calories: 140,
    milkType: 'Coconut Milk',
    ingredients: [
      'Strawberry Açaí Base',
      'Coconut Milk',
      'Ice',
      'Freeze-dried Strawberries'
    ],
  ),
  Product(
    image: 'drinks/drink6.png',
    name: 'Strawberry-Creme Frappuccino',
    category: categories[1],
    price: 5.25,
    description:
        'Sweet strawberry puree blended with milk and ice, topped with whipped cream.',
    calories: 370,
    milkType: 'Whole Milk',
    ingredients: [
      'Strawberry Puree',
      'Milk',
      'Ice',
      'Whipped Cream',
      'Classic Syrup'
    ],
  ),
  Product(
    image: 'drinks/drink1.png',
    name: 'Evolution Fresh Watermelon',
    category: categories[1],
    price: 4.95,
    description:
        'Refreshing cold-pressed watermelon juice blend with a hint of lemon and mint.',
    calories: 160,
    ingredients: ['Watermelon Juice', 'Lemon Juice', 'Mint', 'Natural Flavors'],
  ),

  // Hot Coffee
  Product(
    image: 'hot coffee/hot coffee5.png',
    name: 'Honey-Shaken Flat White Mocha',
    category: categories[0],
    price: 4.95,
    description:
        'Ristretto shots of espresso with steamed almond milk and honey syrup for a touch of sweetness.',
    calories: 120,
    milkType: 'Almond Milk',
    ingredients: ['Espresso', 'Almond Milk', 'Honey Blend'],
  ),
  Product(
    image: 'hot coffee/hot coffee3.png',
    name: 'Toffee Nut Coffee',
    category: categories[0],
    price: 4.45,
    description:
        'Holiday special featuring espresso with steamed milk, peppermint and chocolate.',
    calories: 320,
    milkType: 'Whole Milk',
    ingredients: [
      'Espresso',
      'Steamed Milk',
      'Peppermint Syrup',
      'Chocolate Sauce',
      'Whipped Cream'
    ],
  ),
  Product(
    image: 'hot coffee/hot coffee2.png',
    name: 'Cappuccino',
    category: categories[0],
    price: 4.25,
    description:
        "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick foam. A classic drink that's stood the test of time.",
    calories: 140,
    milkType: 'Whole Milk',
    ingredients: ['Espresso', 'Steamed Milk', 'Milk Foam'],
  ),
  Product(
    image: 'hot coffee/hot coffee4.png',
    name: 'Pike Place Roast',
    category: categories[0],
    price: 3.75,
    description:
        'Our signature medium roast coffee with notes of chocolate and toasted nuts.',
    calories: 5,
    ingredients: ['Pike Place Roast Coffee', 'Hot Water'],
  ),
  Product(
    image: 'hot coffee/hot coffee1.png',
    name: 'Caffe Americano',
    category: categories[0],
    price: 3.95,
    description:
        'Espresso shots topped with hot water create a light layer of crema for an authentically rich cup with depth and nuance.',
    calories: 15,
    ingredients: ['Espresso', 'Hot Water'],
  ),

  // Tea
  Product(
    image: 'hot teas/hot teas1.png',
    name: 'Chai Tea Latte',
    category: categories[2],
    price: 4.45,
    description:
        'Black tea infused with cinnamon, clove, and other warming spices combined with steamed milk for the perfect balance of sweet and spicy.',
    calories: 240,
    milkType: 'Whole Milk',
    ingredients: [
      'Black Tea',
      'Cinnamon',
      'Cardamom',
      'Ginger',
      'Clove',
      'Star Anise',
      'Steamed Milk',
      'Honey'
    ],
  ),
  Product(
    image: 'hot teas/hot teas2.png',
    name: 'Chai Tea',
    category: categories[2],
    price: 3.95,
    description:
        'Black tea infused with warm spices including cinnamon, cardamom, cloves and ginger.',
    calories: 0,
    ingredients: [
      'Black Tea',
      'Cinnamon',
      'Cardamom',
      'Ginger',
      'Clove',
      'Star Anise'
    ],
  ),
  Product(
    image: 'hot teas/hot teas3.png',
    name: "Emperor's Clouds & Mist",
    category: categories[2],
    price: 3.75,
    description:
        'Light, delicate green tea grown at 3,500 feet in the mountains of China. Soft, subtle sweetness.',
    calories: 0,
    ingredients: ['Green Tea Leaves'],
  ),
  Product(
    image: 'hot teas/hot teas4.png',
    name: 'Honey Citrus Mint Tea',
    category: categories[2],
    price: 3.95,
    description:
        'A soothing blend of mint tea, lemonade and honey. Perfect for cold days.',
    calories: 130,
    ingredients: [
      'Jade Citrus Mint™ Green Tea',
      'Peach Tranquility® Herbal Tea',
      'Honey Blend',
      'Lemonade'
    ],
  ),
  Product(
    image: 'hot teas/hot teas5.png',
    name: 'Matcha Tea Latte',
    category: categories[2],
    price: 4.75,
    description:
        'Smooth and creamy matcha sweetened just right and served with steamed milk. A perfect zen-like boost to your day.',
    calories: 200,
    milkType: 'Whole Milk',
    ingredients: ['Ceremonial Grade Matcha', 'Steamed Milk', 'Simple Syrup'],
  ),
];

final List<Product> allProducts =
    products; // or define your full product list here
