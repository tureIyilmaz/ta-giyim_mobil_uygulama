import 'dart:math';

import 'package:flutter/material.dart';

class FoodModel {
  final String categoryName;
  final String name;
  final Image image;
  final double rating;
  final double price;
  final bool discount;
  bool isFavorite;
  bool isCompare;

  // ignore: non_constant_identifier_names
  FoodModel.FoodItem({
    required this.categoryName,
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.discount,
    this.isFavorite = false,
    this.isCompare = false,
  });
}

Random random = Random();

List<FoodModel> foodData = [
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Skechers Summits Erkek Siyah Spor Ayakkabı",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71fIqAC4M8L.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 4.4,
    price: 2899.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Skechers Erkek Max Protect Yürüyüş Ayakkabısı",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71N58I+caeL._AC_SX395_SY395_.jpg'),
    rating: 4.5,
    price: 2899.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "PUMA AMG Trinity Spor Ayakkabı Unisex Yetişkin",
    image: Image.network(
        'https://m.media-amazon.com/images/I/713TqTQr04L.__AC_SY395_SX395_QL70_ML2_.jpg'),
    rating: 4.0,
    price: 2335.90,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "PUMA Court Ultra Lite Tenis Ayakkabısı Unisex Yetişkin",
    image: Image.network(
        'https://m.media-amazon.com/images/I/716JLm-EExL.__AC_SY395_SX395_QL70_ML2_.jpg'),
    rating: 4.4,
    price: 1708.90,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Under Armour Erkek UA Charged Assert 10 Koşu Ayakkabısı",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51Y2TUFrpFL.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 4.2,
    price: 1449.35,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Erkek UA Charged Pursuit 3 Koşu Ayakkabısı",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51NAfSLsnUL.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 4.0,
    price: 1297.18,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Under Armour UA Charged Pursuit 3 Koşu Ayakkabısı Erkek",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71IFz3BsiiL._AC_SY695_.jpg'),
    rating: 3.9,
    price: 1444.16,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "Under Armour Kadın UA W HOVR Infinite 5 Spor Ayakkabı",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61urrO9Hp9L._AC_SY695_.jpg'),
    rating: 4.3,
    price: 1950.34,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "adidas TERREX TRAILMAKER W Outdoor Ayakkabı Kadın",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61ahuZKsSeL.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 5.0,
    price: 3020.44,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name:
        "Adidas Çocuk Günlük Ayakkabı Bb1930 Terrex Ax2R Cf K Siyah/Siyah/Sarı 28",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51TeMfPjSSL.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 4.7,
    price: 2499.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "adidas Kadın Terrex Voyager 21 C Ayakkabı, Blilil/Beaora/Almpnk",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71SKEouSXeL.__AC_SX395_SY395_QL70_ML2_.jpg'),
    rating: 4.5,
    price: 1413.88,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ayakkabı",
    name: "adidas Adistar Cushion Unisex Günlük Ayakkabı IG1739 Siyah",
    image: Image.network(
        'https://m.media-amazon.com/images/I/5186ySGcCZL.__AC_SY395_SX395_QL70_ML2_.jpg'),
    rating: 4.7,
    price: 5949.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "Uzun, Kolsuz, Vücut Çizgilerini Vurgulayan, Kadın Elbisesi",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51tJsab-sxL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 2.8,
    price: 350.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "Tommy Hilfiger Tjm Alaska Puffer Erkek Diş Giyim, Lacivert, L",
    image: Image.network(
        'https://m.media-amazon.com/images/I/810LF0ns6WL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 4.4,
    price: 4999.59,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "Cascade Ridge II Erkek Softshell Ceket",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51BAdjCk2jL.__AC_SY445_SX342_QL70_ML2_.jpg'),
    rating: 3.6,
    price: 7999.00,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "Koton Basic Tişört Bisiklet Yaka Kısa Kollu Tişört Erkek",
    image: Image.network(
        'https://m.media-amazon.com/images/I/619WENK3dgL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 5.0,
    price: 182.90,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "Basic Polo Yaka Tişört Dar Kesim Düğmeli Kısa Kollu",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71GEuNmljVL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 4.2,
    price: 359.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "DeFacto Erkek Regular Fit Polo Yaka Uzun Kollu Gömlek",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71SO8NImFLL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 5.0,
    price: 194.09,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "DeFacto DeFactoFit Slim Fit Sporcu Dokuma Şort",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61ut3sITaDL.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 4.5,
    price: 176.59,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Kıyafet",
    name: "DeFacto Erkek DeFactoFit Slim Fit Jogger",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61AEYlAaM3L.__AC_SX342_SY445_QL70_ML2_.jpg'),
    rating: 4.2,
    price: 219.79,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Lacoste 12.12 Studio Erkek Kuvars Saat",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71Wd8Rfdv3L._AC_SX569_.jpg'),
    rating: 4.2,
    price: 7192.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Reebok RV-THR-G9-PBPB-BY Kol Saati, Siyah, Standart",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51TFXNtg6IL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.8,
    price: 1299.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "PUMA Erkekler Remix Paslanmaz Çelik Saat",
    image: Image.network(
        'https://m.media-amazon.com/images/I/81PJ-UUsP7L.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 3.9,
    price: 1199.99,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Lacoste Silikon Kayışlı Erkekler Analog Kuvars İzle",
    image: Image.network(
        'https://m.media-amazon.com/images/I/81EISfa2aoS.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.3,
    price: 260.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Lacoste Erkek Saati analog kuvars 32018496",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61FhSdC5TxL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.4,
    price: 6999.99,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Puma Time Üniseks Kol Saati PU-SUEDE",
    image: Image.network(
        'https://m.media-amazon.com/images/I/71T8YkB1PgL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 3.8,
    price: 4950.45,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "TH1791917 Erkek Kol Saati",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61QjPZJ61-L.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.3,
    price: 3850.45,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Saat",
    name: "Tommy Hilfiger Saat Kayışı 22 mm Metal Siyah - 679001120, Kayış",
    image: Image.network(
        'https://m.media-amazon.com/images/I/41nCQLGkqnL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.1,
    price: 120.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name: "Karanfil Pırlanta Altın Kolye",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61BnH+AiLEL._AC_SY300_SX300_.jpg'),
    rating: 4.8,
    price: 7800.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name: "JUJU 14 Ayar Summer Night Gold Bileklik gold S",
    image: Image.network(
        'https://m.media-amazon.com/images/I/513QAQyX8-L.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.3,
    price: 799.99,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name: "0.40 Karat Pırlanta Tektaş Yüzük 8 Ayar",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51LNGo7lUPL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.2,
    price: 24449.19,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name: "Lizay Pırlanta 1.17 Karat Pırlanta Damla Yakut Kolye Beyaz",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51u4NGnjS9L.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.1,
    price: 29999.00,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name: "Lacoste Halskette für Damen Kollektion CROCODILE",
    image: Image.network(
        'https://m.media-amazon.com/images/I/61M3HwjUdqL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.5,
    price: 4999.99,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name:
        "Kristallwerk, Bayan takı seti 925 ayar gümüş Swarovski Elements kristal renk vitrail Medium, Kristal.",
    image: Image.network(
        'https://m.media-amazon.com/images/I/514Pml65i1L.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 3.8,
    price: 4750.45,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name:
        "Madam Matmazel Swarovski Kadınlar için Gümüş Kübik Zirkonya Kolye, 925 Ayar Gümüş Takı, Hediye",
    image: Image.network(
        'https://m.media-amazon.com/images/I/41eXGhu22BL.__AC_SX300_SY300_QL70_ML2_.jpg'),
    rating: 4.7,
    price: 4500.49,
    discount: Random().nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Takı",
    name:
        "Madam Matmazel Kelebek Gümüş Kadın Kolye, 925 Ayar Gümüş,Butterfly, Rose Kaplama, Kadın, Kız, Arkadaş, Anneler Günü, Hediye",
    image: Image.network(
        'https://m.media-amazon.com/images/I/51BUfHfq8XL._AC_SY625_.jpg'),
    rating: 4.1,
    price: 780.67,
    discount: Random().nextBool(),
  ),
];
