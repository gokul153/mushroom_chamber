class Product {
  int id;
  String image;
  String title;
  double price;
  String temp;
  String hum;
  String desc;
  bool isFavorated;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.temp,
    required this.hum,
    required this.desc,
    required this.isFavorated,
  });

  static List<Product> product = [
    Product(
      id: 0,
      image: 'assets/images/mango.png',
      title: 'MANGO',
      price: 29.99,
      hum: '60-70%',
      temp: '24°C to 30°C.',
      isFavorated: true,
      desc:
          '   India is the major mango producing country in the world with an annual production of 8.50 million tonnes from an area of one million hectares. Mango is basically a tropical plant but endures wide range of temperature. It grows well under tropical and sub-tropical conditions. It gives profitable yield in semi-arid conditions, especially with irrigation.\n\n   The mango flowers and fruits during dry season, which is characterized by absence of rainfall. Rain or cloudy weather at the time of flowering causes considerable damage to mango as it adversely affects flowering and fruit set and increases incidence of pests and diseases. It grows where temperature drops as low as 0°C. And as high as 46°C. However, it thrives best at temperature around 27°C. It grows well both in low (25 cm) and high (250 cm) rainfall areas. However with annual rainfall around 75 cm, it grows without irrigation.',
    ),
    Product(
      id: 1,
      image: 'assets/images/banana.png',
      title: 'BANANA',
      price: 25.99,
      hum: '75-85%',
      temp: '15ºC - 35ºC',
      isFavorated: false,
      desc:
          '   Banana is a globally important fruit crop with 97.5 million tones of production.Maharashtra ranks first in production with 60 T/ha. Banana contributes 37% to total fruit production in India. Banana occupy 20% area among the total area under crop in India.\n\n    Banana is basically a tropical crop, grows well in temperature range of 13ºC – 38ºC with RH regime of 75-85%. In India this crop is being cultivated in climate ranging from humid tropical to dry mild subtropics through selection of appropriate varieties like Grandnaine. Chilling injury occurs at temperatures below 12ºC. The normal growth of the banana begins at 18ºC, reaches optimum at 27ºC, then declines and comes to a halt at 38ºC. Higher temperature causes sun scorching. High velocity wind which exceeds 80 km phrs damages the crop.',
    ),
    Product(
      id: 2,
      image: 'assets/images/tomato.png',
      title: 'TOMATO',
      price: 22.99,
      hum: '85-90%',
      temp: '16- 29° C',
      isFavorated: false,
      desc:
          '   Tomato is the most widely cultivated crop in India. Tomato is a very important vegetable crop regarding both income and nutrition. Tomatoes are predominantly summer crops, but it can be cultivated throughout the year.\n\n    The tomato is warm season crop. The temperature of 20-25 °C is considered to be ideal for tomato cultivation, and the excellent quality red color is developed in tomatoes at 21-24 °C temperature. It grows very well on a wide range of soils, but it grows well on deep, well-drained soils with good drainage ability. Sandy loam to medium black soils is considered to be best suitable for Tomato cultivation.',
    ),
    Product(
      id: 3,
      image: 'assets/images/Rice.png',
      title: 'RICE',
      price: 24.99,
      hum: '60-80 %',
      temp: '22- 32° C',
      isFavorated: false,
      desc:
          '   Rice is the most important food crop of India covering about one-fourth of the total cropped area and providing food to about half of the Indian population. Punjab has made tremendous progress in rice productivity and production during the past 45 years. Due to use of high yielding varieties and new technology Punjab has given the title of "Rice Bowl of India".\n\n   Rice is grown under varying conditions in India from 8° to 25° N latitude and from sea level to about 2,500 metre altitude. It is a tropical plant and requires high heat and high humidity for its successful growth. The temperature should be fairly high at mean monthly of 24°C. It should be 20°- 22°C at the time of sowing, 23°-25°C during growth and 25°-30°C at the harvesting time. The average annual rainfall required by rice is 150 cm.',
    ),
    Product(
      id: 4,
      image: 'assets/images/cotton.png',
      title: 'COTTON',
      price: 30.99,
      hum: '65% to 75%.',
      temp: '21- 30° C',
      isFavorated: false,
      desc:
          '   Cotton is the most important fibre crop not only of India but of the entire world. It provides the basic raw material (cotton fibre) to cotton textile industry.Its seed (binola) is used in vanaspati industry and can also be used as part of fodder for milch cattle to get better milk.\n\n   Cotton is the crop of tropical and sub-tropical areas and requires uniformly high temperature varying between 21°C and 30°C. The growth of cotton is retarded when the temperature falls below 20°C. Frost is enemy number one of the cotton plant and it is grown in areas having at least 210 frost free days in a year.',
    ),
    Product(
      id: 5,
      image: 'assets/images/wheat.png',
      title: 'WHEAT',
      price: 19.99,
      hum: '50-60% ',
      temp: '20- 25° C',
      isFavorated: false,
      desc:
          '   Wheat, in India, is best grown as a rabi or winter season crop since the conditions during that time are conducive for growth and ensures maximum yield. Since wheat is capable of tolerating severe cold it resumes growth in summer after being dormant in winter.\n\n   Wheat is a widely adaptable crop that can be grown in climates ranging from temperate to tropical and cold northern parts. In addition it can be cultivated anywhere from land on sea level to an altitude of up to 3300 meters. Places with a cool, moist weather for most part of the year followed by a short, dry and warm spell is most suited for wheat cultivation. This type of weather condition permits appropriate maturing and ripening of grains. However, areas with heavy rainfall, moist and warm climate are not suited for commercial wheat farming.',
    ),
  ];

  //Get the favorated items
  static List<Product> getFavoritedPlants() {
    List<Product> travelList = Product.product;
    return travelList.where((element) => element.isFavorated == true).toList();
  }
}
