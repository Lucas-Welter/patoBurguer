import 'package:flutter/material.dart';
import 'package:pato_burguer/models/product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  abrirLink(var linkUrl) async {
    launchUrlString(linkUrl);
  }

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, 0.8),
                        end: Alignment(0, 0),
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.6),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 10),
              Text(
                'R\$ ${product.price}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
                width: double.infinity,
                child: Text(
                  "Venha comer com a gente:",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.center,
                child: Ink.image(
                  image: const AssetImage(
                    'assets/images/wpp.png',
                  ),
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTap: () =>
                        abrirLink("whatsapp://send?phone=+556740028922"),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Ink.image(
                  image: const AssetImage(
                    'assets/images/inst.png',
                  ),
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTap: () => abrirLink(""),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
