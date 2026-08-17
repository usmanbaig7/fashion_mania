import '../models/product.dart';

/// Stand-in extra gallery angles — every product reuses these until real
/// per-product shots are available.
const List<String> _extraShots = <String>[
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
];

const List<Product> mockProducts = <Product>[
  Product(
    id: 'p1',
    name: 'Brown Suede Jacket',
    category: 'girls',
    subCategory: 'casual',
    price: 83.97,
    images: <String>['assets/images/brown suede jacket.jpg', ..._extraShots],
    sizes: <String>['S', 'M', 'L'],
    colors: <String>['Brown', 'Beige'],
    description:
        'Soft suede jacket cut to a relaxed fit, with a lightly padded '
        'lining that holds its shape through the season. Finished with '
        'antique brass hardware and deep side pockets, it layers easily '
        'over knitwear on cooler evenings.',
    rating: 4.8,
  ),
  Product(
    id: 'p2',
    name: 'Checked Flannel Shirt',
    category: 'boys',
    subCategory: 'casual',
    price: 120.00,
    images: <String>['assets/images/checked flannel shirt.jpg', ..._extraShots],
    sizes: <String>['M', 'L', 'XL'],
    colors: <String>['Red', 'Navy'],
    description:
        'Brushed cotton flannel in a classic check, woven from a mid-weight '
        'yarn that softens with every wash. A straight hem and chest pocket '
        'keep it easy to wear open or buttoned.',
    rating: 4.6,
  ),
  Product(
    id: 'p3',
    name: 'Floral Summer Dress',
    category: 'girls',
    subCategory: 'dress',
    price: 64.50,
    images: <String>['assets/images/floral summer dress.jpg', ..._extraShots],
    sizes: <String>['XS', 'S', 'M'],
    colors: <String>['Cream', 'Rose'],
    description:
        'Flowing midi dress in a hand-drawn floral print, gathered at the '
        'waist for a soft silhouette. The lightweight viscose drapes well in '
        'warm weather and packs without creasing.',
    rating: 4.9,
  ),
  Product(
    id: 'p4',
    name: 'Classic Two-Piece Suit',
    category: 'boys',
    subCategory: 'suit',
    price: 189.99,
    images: <String>[
      'assets/images/classic two piece suit.jpg',
      ..._extraShots,
    ],
    sizes: <String>['S', 'M', 'L'],
    colors: <String>['Charcoal', 'Navy'],
    description:
        'Tailored two-piece cut from a fine wool blend, with a half-canvas '
        'front that keeps the jacket clean through the chest. Flat-front '
        'trousers finish the set for weddings and formal events.',
    rating: 4.7,
  ),
  Product(
    id: 'p5',
    name: 'Knit Cardigan',
    category: 'girls',
    subCategory: 'casual',
    price: 55.00,
    images: <String>['assets/images/knit cardigan.jpg', ..._extraShots],
    sizes: <String>['S', 'M', 'L'],
    colors: <String>['Cream', 'Grey'],
    description:
        'Chunky knit cardigan with a button front and dropped shoulders for '
        'an easy, oversized feel. Ribbed cuffs and hem hold the shape of the '
        'heavier gauge yarn.',
    rating: 4.4,
  ),
  Product(
    id: 'p6',
    name: 'Denim Overshirt',
    category: 'boys',
    subCategory: 'casual',
    price: 74.25,
    images: <String>['assets/images/denim overshirt.jpg', ..._extraShots],
    sizes: <String>['M', 'L', 'XL'],
    colors: <String>['Indigo'],
    description:
        'Mid-weight denim overshirt with twin chest pockets, sitting between '
        'a shirt and a light jacket. The rigid cotton breaks in over time and '
        'fades along the seams.',
    rating: 4.5,
  ),
];
