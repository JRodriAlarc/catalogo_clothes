import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetallesProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetallesProducto();
}

class _DetallesProducto extends State<DetallesProducto> {
  String categoria = "Blusas",
      prenda = "Modelo G208",
      imgModelo =
          "https://raw.githubusercontent.com/JRodriAlarc/app_catalogo_flutter/main/assets/img/modelo_red.png",
      colores = "";

  List<String> coloresProductos = ["red", "orange", "green", "purple"];

  List<String> fotosProductos = [];

  _DetallesProducto() {
    fotosProductos = [
      imgModelo,
      "https://raw.githubusercontent.com/JRodriAlarc/app_catalogo_flutter/main/assets/img/modelo_orange.png",
      "https://raw.githubusercontent.com/JRodriAlarc/app_catalogo_flutter/main/assets/img/modelo_green.png",
      "https://raw.githubusercontent.com/JRodriAlarc/app_catalogo_flutter/main/assets/img/modelo_purple.png"
    ];
  }

  final styleCategoria = const TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF1a2f59));
  final styleModelo = const TextStyle(
      fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF1a2f59));

  Future<void> imgColores(imgColor) async {
    if (imgColor == coloresProductos[0]) {
      setState(() {
        imgModelo = fotosProductos[0];
      });
    } else if (imgColor == coloresProductos[1]) {
      setState(() {
        imgModelo = fotosProductos[1];
      });
    } else if (imgColor == coloresProductos[2]) {
      setState(() {
        imgModelo = fotosProductos[2];
      });
    } else if (imgColor == coloresProductos[3]) {
      setState(() {
        imgModelo = fotosProductos[3];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 360.0;

    final sizeIcon = 40 * scaleFactor;

    return Scaffold(
        backgroundColor: const Color(0xffe8f6fa),
        body: SafeArea(
            child: Stack(children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.16,
                      width: MediaQuery.of(context).size.width * 0.16,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff94d7ff),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.white,
                            size: sizeIcon,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(categoria,
                            style: GoogleFonts.quicksand(
                                textStyle: styleCategoria))),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Text(prenda,
                            style:
                                GoogleFonts.poppins(textStyle: styleModelo))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                child: Row(children: <Widget>[
                              CachedNetworkImage(
                                width:
                                    MediaQuery.of(context).size.width * 0.668,
                                imageUrl: imgModelo,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_outline_rounded,
                                  size: 50,
                                ),
                              )
                            ])),
                            Stack(
                              children: [
                                Positioned(
                                    child: Container(
                                        height: 208,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffd0e2ed),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 24, 12, 20),
                                        child: Column(children: <Widget>[
                                          SizedBox(
                                            height: 138,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: coloresProductos
                                                    .map((color) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 6),
                                                    height: 35,
                                                    width: 35,
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        String imgColor = color;
                                                        await imgColores(
                                                            imgColor);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        backgroundColor:
                                                            _getColorFromName(
                                                                color),
                                                      ),
                                                      child: null,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 6, 0, 0),
                                            height: 20,
                                            width: 35,
                                            child: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                          )
                                        ]))),
                              ],
                            ),
                          ]),
                    )
                  ])),
          Caracteristicas()
        ])));
  }
}

Color _getColorFromName(String nameColor) {
  switch (nameColor) {
    case "red":
      return Colors.red;
    case "orange":
      return Colors.orange;
    case "green":
      return Colors.green;
    case "purple":
      return Colors.purple;
    default:
      return Colors.white;
  }
}

class Caracteristicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.27,
        minChildSize: 0.27,
        maxChildSize: 0.32,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xfff8fdff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            child: Elementos(scrollController),
          );
        });
  }
}

class Elementos extends StatelessWidget {
  String descripcion =
          "La Colección Frida Orange es una colección Moderna y fresca, disenada por una joven diseñadora originaria de Zacualtipán.",
      tallas = "",
      precio = "269.00",
      codigo_barras = "https://tar.mx/apps/barras/barras.png";
  final ScrollController scrollController;
  Elementos(this.scrollController);

  List<String> tallasProducto = ["XS", "S", "M", "L", "XL"];

  final stylePrecio = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w800, color: Color(0xFF1a2f59));

  final styleSignoPrecio = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1a2f59));

  final styleTallas = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1a2f59));

  final styleSubtitles = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff1a2f59));

  final styleDescription = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.horizontal_rule_rounded,
                      color: Color(0xffbdc2cd),
                      size: 68,
                    ),
                  ]),
              Row(children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text("Descripción:",
                        style: GoogleFonts.poppins(textStyle: styleSubtitles))),
              ]),
              Column(children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      descripcion,
                      style: GoogleFonts.quicksand(textStyle: styleDescription),
                      textAlign: TextAlign.justify,
                    )),
              ]),
              Row(children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
                    child: Text("Tallas:",
                        style: GoogleFonts.poppins(textStyle: styleSubtitles))),
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ...tallasProducto
                          .map((tallas) => SizedBox(
                                height: 46,
                                width: 56,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      backgroundColor: const Color(0xffebeeef)),
                                  child: Text(
                                    tallas,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoCondensed(
                                        textStyle: styleTallas),
                                  ),
                                ),
                              ))
                          .toList(),
                    ]),
              ),
            ])),
        Row(children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(0, 32, 0, 0),
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: 75,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xffe0edf4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("\$",
                              style: GoogleFonts.poppins(
                                  textStyle: styleSignoPrecio)),
                        ),
                        Text(precio,
                            style: GoogleFonts.poppins(textStyle: stylePrecio)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: CachedNetworkImage(
                        width: 115,
                        imageUrl: codigo_barras,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error_outline_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ]))
        ])
      ],
    );
  }
}
