import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({
    required this.secilenBurc,
    Key? key,
  }) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.pink;
  late PaletteGenerator generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            centerTitle: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.secilenBurc.burcAdi + ' Burcu ve Özellikleri ',
                    maxLines: 2,
                  )),
                ],
              ),
              centerTitle: true,
              background: Image.asset(
                'lib/assets/images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                  child: Text(widget.secilenBurc.burcDetayi,
                      style: Theme.of(context).textTheme.titleMedium)),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    generator = await PaletteGenerator.fromImageProvider(
        AssetImage('lib/assets/images/' + widget.secilenBurc.burcBuyukResim));
    appbarRengi = generator.dominantColor!.color;
    setState(() {});
    print(appbarRengi);
  }
}
