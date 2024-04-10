import 'package:flutter/material.dart';
import 'dart:ui';

double obtenerAnchoPantalla() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  print(window.physicalSize.width / window.devicePixelRatio);
  // ignore: deprecated_member_use
  return window.physicalSize.width / window.devicePixelRatio;
}

class containerStyle {
  static BoxConstraints customBoxConstraints(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.9;

    if (obtenerAnchoPantalla() >= 480) {
      return BoxConstraints(minWidth: 100, maxWidth: 480);
    } else {
      return BoxConstraints(minWidth: 100, maxWidth: maxWidth);
    }
  }

  static BoxConstraints customBoxConstraints2(BuildContext context) {
    double maxWidth2 = MediaQuery.of(context).size.width * 0.9 - 150;

    if (obtenerAnchoPantalla() >= 480) {
      return BoxConstraints(minWidth: 100, maxWidth: 300);
    } else {
      return BoxConstraints(minWidth: 20, maxWidth: maxWidth2);
    }
  }
}

// context, imagen, titulo, descripción, funcion1, textoBoton1, funcion2, textoBoton2
class CustomModal extends StatefulWidget {
  final String imagen;
  final String title;
  final String descripcion;
  final String textoboton1;
  final Function funcion1;
  final String textoboton2;
  final Function funcion2;

  const CustomModal(
      {super.key,
      required this.imagen,
      required this.title,
      required this.descripcion,
      required this.textoboton1,
      required this.funcion1,
      required this.textoboton2,
      required this.funcion2});

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  @override
  Widget build(BuildContext context) {
    final boton1;
    final boton2;
    if (widget.textoboton1 == "") {
      boton1 = false;
    } else {
      boton1 = true;
    }
    if (widget.textoboton2 == "") {
      boton2 = false;
    } else {
      boton2 = true;
    }

    final rutaImagen = widget.imagen;

    return Center(
      child: Container(
          constraints: containerStyle.customBoxConstraints(context),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1, // Ocupa 33% del ancho del Row
                      child: Image.asset(rutaImagen)
                      // Image.asset('assets/Recurso 1-8.png'),
                      ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 2, // Ocupa el doble del ancho de la imagen (66%)
                    child: Container(
                      constraints:
                          containerStyle.customBoxConstraints2(context),
                      padding: EdgeInsets.only(
                          top: 20, left: 0, right: 20, bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontFamily: "NunitoBold",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff707070)),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 25.0),
                          Text(widget.descripcion,
                              style: TextStyle(
                                  fontFamily: "NunitoRegular",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff707070)),
                              textAlign: TextAlign.right),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  // Image.asset("assets/Recurso 1-8.png", width:150.0 ),
                ],
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 0, left: 0, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // displayButton1(widget.funcion1, widget.textoboton1),

                    Visibility(
                      visible: boton1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff00B0DA),
                            padding: EdgeInsets.only(
                                top: 12, left: 12, right: 12, bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          widget.funcion1();
                        },
                        child: Text(widget.textoboton1,
                            style: TextStyle(
                                fontFamily: "NunitoBold",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff))),
                      ),
                    ),

                    SizedBox(width: 20.0),

                    Visibility(
                      visible: boton2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff62C2FE),
                            padding: EdgeInsets.only(
                                top: 12, left: 12, right: 12, bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          print(widget.funcion2);
                          // alertmodalclose(context);s
                          widget.funcion2();
                        },
                        child: Text(widget.textoboton2,
                            style: TextStyle(
                                fontFamily: "NunitoBold",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  void noFunction() {}

  alertmodalclose() {
    print("context");
    Navigator.of(context).pop(); // Cerrar la modal al presionar el botón
  }

}

