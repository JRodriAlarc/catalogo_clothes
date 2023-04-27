import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'detalles_producto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final styleNumPiezas = const TextStyle(
      fontSize: 17, color: Color(0xFF1a2f59), fontWeight: FontWeight.bold);
  final styleNameProduct = const TextStyle(
      fontSize: 15, color: Color(0xFF1a2f59), fontWeight: FontWeight.w900);
  final styleCatProduct = const TextStyle(
      fontSize: 15, color: Color(0xFFb5b8bf), fontWeight: FontWeight.bold);
  final styleCatProductSelect = const TextStyle(
      fontSize: 15, color: Color(0xFF1a2f59), fontWeight: FontWeight.w900);
  final styleTextCategoria = const TextStyle(
      fontSize: 40, color: Color(0xFF1a2f59), fontWeight: FontWeight.bold);
  final styleHintSearch =
      const TextStyle(fontSize: 16, color: Color(0xFFBDC2CD));
  final styleSearchBar = const TextStyle(
      fontSize: 16, color: Color(0xFF1a2f59), fontWeight: FontWeight.w600);

  List<String> categoriaProduct = ["Camisas", "Blusas", "Playeras"];

  late List<Map<String, dynamic>> productos;

  @override
  void initState() {
    super.initState();
    String jsonStr =
        '[{"nombre": "Navigo Zyro PF56", "piezas": 157, "imagen": "https://img.ltwebstatic.com/images3_pi/2021/11/17/1637110871076d3c8e11fb35a6a4fc6e2f3625928f.webp", "favorito": true}, {"nombre": "Joyride Setter C3", "piezas": 243, "imagen": "https://http2.mlstatic.com/D_NQ_NP_811401-MLM49023105257_022022-O.webp", "favorito": false}, {"nombre": "Luck Aerospace", "piezas": 97, "imagen": "https://qafacol.vteximg.com.br/arquivos/ids/452712-900-900/leggins-mujer-40230362-10_2.jpg?v=637636048187470000", "favorito": false}, {"nombre": "Kein Reto SE", "piezas": 412, "imagen": "https://cdn.shopify.com/s/files/1/0244/2887/1714/products/xpt038_a27dd951-83e3-4f41-bfd3-2db2c9348dfa.jpg?v=1679788751&width=823", "favorito": false}, {"nombre": "Victus Three 56", "piezas": 215, "imagen": "https://img.ltwebstatic.com/images3_pi/2021/04/19/16188054272140c9aec824e39b65e7fb8d5737d31f_thumbnail_900x.webp", "favorito": false}]';
    productos = json.decode(jsonStr).cast<Map<String, dynamic>>();
  }

  List<List<Map<String, dynamic>>> chunk(
      List<Map<String, dynamic>> list, int chunkSize) {
    return List.generate(
      (list.length / chunkSize).ceil(),
      (i) => list.skip(i * chunkSize).take(chunkSize).toList(),
    );
  }

  CollectionReference datosUsuario =
      FirebaseFirestore.instance.collection('clothes');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 360.0;

    final sizeIcon = 32 * scaleFactor;

    return Scaffold(
      backgroundColor: const Color(0xFFE8F6FA),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: GoogleFonts.poppins(textStyle: styleSearchBar),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintText: "Buscar Producto",
                  hintStyle: GoogleFonts.poppins(textStyle: styleHintSearch),
                  suffixIcon: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.078,
                    backgroundColor: const Color(0xFF93d5fd),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: sizeIcon,
                    ),
                  ),
                  suffixIconColor: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Categorías ",
              style: GoogleFonts.poppins(textStyle: styleTextCategoria),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    "Jeans",
                    style:
                        GoogleFonts.quicksand(textStyle: styleCatProductSelect),
                  ),
                ),
                ...categoriaProduct
                    .map((categoria) => TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            categoria,
                            style: GoogleFonts.quicksand(
                                textStyle: styleCatProduct),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            children: chunk(productos, 2)
                .map(
                  (sublista) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: sublista
                        .map(
                          (producto) => Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: MediaQuery.of(context).size.width * 0.59,
                              width: MediaQuery.of(context).size.width * 0.44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(25),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  splashColor: Colors.black26,
                                  onTap: () {
                                    print("object1");
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetallesProducto()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: Text(
                                                "${producto['piezas']} Pz",
                                                style: GoogleFonts.poppins(
                                                    textStyle: styleNumPiezas),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 28,
                                              color: const Color(0xFF00359E),
                                              //color: const Color(0xFF3736be),
                                              onPressed: () {
                                                setState(() {
                                                  producto['favorito'] =
                                                      !producto['favorito'];
                                                });
                                              },
                                              icon: producto['favorito']
                                                  ? const Icon(
                                                      Icons.favorite_rounded,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .favorite_outline_rounded,
                                                    ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: CachedNetworkImage(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.17,
                                              imageUrl: producto['imagen'],
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(
                                                Icons.error_outline_rounded,
                                                //color: Color(0xFF3736be),
                                                size: 50,
                                              ),
                                            )),
                                        const SizedBox(height: 8),
                                        Text(
                                          producto['nombre'],
                                          style: GoogleFonts.quicksand(
                                              textStyle: styleNameProduct),
                                        ),
                                        const SizedBox(height: 6),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
