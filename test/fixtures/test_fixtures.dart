import '../../lib/models/product.dart';
import '../../lib/models/cart.dart';
import '../../lib/models/cart_item.dart';

class TestFixtures {
  static final testProduct = Product(
    productId: '491436',
    merchantCategoryId: '0209040401',
    skuId: '491436',
    position: '1',
    isPrimeEligible: false,
    displayName: 'Taladro 3/8Pulg Percutor 20V 2Vel',
    brand: 'BLACK+DECKER',
    model: 'BCD704C1-B3',
    media: const MediaModel(
      id: '491436',
      type: 'SKU',
      onImageHover: 'ZOOM',
    ),
    badges: const [],
    fastShippingLabels: const FastShippingLabelsModel(
      hdSameDayZones: false,
      hdNextDayZones: true,
      ccSameDayZones: false,
      ccNextDayZones: true,
    ),
    events: const [
      EventModel(
        description: 'Envio gratis',
        value: 'https://images.sodimac.com/v3/assets/blt2f8082df109cfbfb/bltddf552d90076cf52/6615a63e1952f0c89dfc1666/Badge_FreeShiping_New.svg',
      ),
    ],
    prices: const [
      PriceModel(
        label: '',
        type: 'NORMAL',
        symbol: '\$',
        price: '275.900',
        unit: 'Und',
        priceWithoutFormatting: 275900,
      ),
    ],
    totalReviews: '20',
    rating: '4.2',
    variants: const [],
    multiPurposeIcon: const {},
    bankBadge: const BankBadgeModel(
      type: 'BANK_PROMOTION',
      value: 'https://images.sodimac.com/v3/assets/blt2f8082df109cfbfb/blt895c0ba10a84c8af/6503334cb8c6d62beb0e66ab/Badge_reciclaje.svg',
    ),
    highlights: const [
      HighlightModel(key: 'Modelo', value: 'BCD704C1-B3'),
      HighlightModel(key: 'Tipo', value: 'Taladro inalámbrico'),
      HighlightModel(key: 'Ancho', value: '10.8 cm'),
      HighlightModel(key: 'Largo', value: '16.4 cm'),
      HighlightModel(key: 'Alto', value: '15.7 cm'),
    ],
    accumulativePoints: const [],
    isPromoted: true,
    isInternational: 'false',
    installments: const {},
    mediaUrls: const [
      'https://media.falabella.com/sodimacCO/491436/public',
      'https://media.falabella.com/sodimacCO/491436_1/public',
      'https://media.falabella.com/sodimacCO/491436_10/public',
      'https://media.falabella.com/sodimacCO/491436_11/public',
      'https://media.falabella.com/sodimacCO/491436_2/public',
      'https://media.falabella.com/sodimacCO/491436_3/public',
    ],
  );

  static final testProduct2 = Product(
    productId: '491437',
    merchantCategoryId: '0209040401',
    skuId: '491437',
    position: '2',
    isPrimeEligible: true,
    displayName: 'Test Product 2',
    brand: 'TEST BRAND',
    model: 'TEST-MODEL-2',
    media: const MediaModel(
      id: '491437',
      type: 'SKU',
      onImageHover: 'ZOOM',
    ),
    badges: const ['NEW'],
    fastShippingLabels: const FastShippingLabelsModel(
      hdSameDayZones: true,
      hdNextDayZones: true,
      ccSameDayZones: true,
      ccNextDayZones: true,
    ),
    events: const [],
    prices: const [
      PriceModel(
        label: '',
        type: 'NORMAL',
        symbol: '\$',
        price: '150.000',
        unit: 'Und',
        priceWithoutFormatting: 150000,
      ),
    ],
    totalReviews: '10',
    rating: '4.5',
    variants: const [],
    multiPurposeIcon: const {},
    bankBadge: null,
    highlights: const [
      HighlightModel(key: 'Modelo', value: 'TEST-MODEL-2'),
      HighlightModel(key: 'Tipo', value: 'Test Product'),
    ],
    accumulativePoints: const [],
    isPromoted: false,
    isInternational: 'false',
    installments: const {},
    mediaUrls: const ['https://example.com/image.jpg'],
  );

  static final testCartItems = [
    CartItem(product: testProduct, quantity: 2),
    CartItem(product: testProduct2, quantity: 1),
  ];

  static final testCart = Cart(items: testCartItems);
  
  static final emptyCart = Cart(items: const []);
}
