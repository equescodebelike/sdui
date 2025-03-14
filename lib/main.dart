// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file is hand-formatted.

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:remote/div.dart';
import 'package:rfw/formats.dart';
import 'package:rfw/rfw.dart';

const String urlPrefix =
    'https://raw.githubusercontent.com/flutter/packages/main/packages/rfw/example/remote/remote_widget_libraries';

void main() {
  runApp(const MaterialApp(home: RfwPage()));
}

class RfwPage extends StatefulWidget {
  const RfwPage({super.key});

  @override
  State<RfwPage> createState() => _RfwPageState();
}

class _RfwPageState extends State<RfwPage> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();

  // Normally this would be obtained dynamically, but for this example
  // we hard-code the "remote" widgets into the app.
  //
  // Also, normally we would decode this with [decodeLibraryBlob] rather than
  // parsing the text version using [parseLibraryFile]. However, to make it
  // easier to demo, this uses the slower text format.
  static final RemoteWidgetLibrary _remoteWidgets = parseLibraryFile('''
import core.material;
import core.widgets;
import local;

widget root = CustomScaffold(
  body: SingleChildScrollView(
    child: ContentBlock(
      child: Column(
        children: [
          H2(text: "15 марта"),
          CustomSpacer(),
          Paragraph(text: "— память преподобного Агафона Египетского. Его удивительное житие из книги «Малый патерик. Истории о древних подвижниках» и предлагаем для совместного чтения."),
          CustomSpacer(),
          Paragraph(text: "Под «предлагаем для совместного чтения»:"),
          CustomSpacer(),
          Paragraph(text: "Во времена святого Антония Великого жил в Египте один монах по имени Агафон. Говорят, что Агафон, когда был молод, посещал святого Антония. А у святого был от Бога дар видеть души людей, как мы видим лица. Итак, когда они поговорили, святой Антоний сказал юному Агафону, что он тоже станет святым и будет таким кротким и беззлобным, что не сможет замечать в людях плохого, но одно только хорошее."),
          CustomSpacer(),
          Paragraph(text: "Так оно и стало, ибо со временем отец Агафон стал таким кротким, что никогда ни на кого не сердился, сколько бы ему зла ни причиняли."),
          CustomSpacer(),
          Paragraph(text: "Итак, случилось со святым Агафоном следующее происшествие, из которого видно, каким терпеливым и кротким он стал. Пошел однажды святой в город продавать глиняные сосуды, которые делал своими руками в пустыне (мы забыли сказать, что отец Агафон был пустынником). Идя, он увидел на дороге прокаженного[1]. Прокаженный спросил его:"),
          CustomSpacer(),
          Paragraph(text: "— Куда ты идешь?"),
          CustomSpacer(),
          Paragraph(text: "— В город, чтобы продать эти сосуды, — ответил ему святой."),
          CustomSpacer(),
          Paragraph(text: "— Будь добр, — снова сказал прокаженный, — возьми и меня с собой."),
          CustomSpacer(),
          Paragraph(text: "— Давай! — согласился святой Агафон и, взвалив прокаженного себе на спину, с трудом дотащил его до города."),
          CustomSpacer(),
          Paragraph(text: "Когда они добрались до рынка, прокаженный снова говорит ему:"),
          CustomSpacer(),
          Paragraph(text: "— Положи меня туда, где будешь продавать сосуды."),
          CustomSpacer(),
          Paragraph(text: "Святой сделал, как просил больной, и не успел продать первый сосуд, как прокаженный опять накинулся на него:"),
          CustomSpacer(),
          Paragraph(text: "— Ты продал сосуд?"),
          CustomSpacer(),
          Paragraph(text: "— Да! — ответил отец Агафон."),
          CustomSpacer(),
          Paragraph(text: "— Если ты продал его, значит, у тебя есть деньги! Теперь купи мне хлеб на эти деньги!"),
          CustomSpacer(),
          Paragraph(text: "Святой ни мало не стал размышлять, пошел и купил прокаженному хлеба. Однако прокаженный не унимался. Как только отец Агафон продал следующий сосуд, прокаженный опять набросился:"),
          CustomSpacer(),
          Paragraph(text: "— Ты продал еще один сосуд? Купи мне винограду!"),
          CustomSpacer(),
          Paragraph(text: "И так продолжалось до самого вечера: как только святой продавал что-нибудь, прокаженный просил его купить ему то одно, то другое, пока не закончились и все сосуды, и деньги."),
          CustomSpacer(),
          Paragraph(text: "Когда стало вечереть, отец Агафон хотел было пойти домой. Прокаженный, однако, не давал ему спуску:"),
          CustomSpacer(),
          Paragraph(text: "— Ты хочешь уйти? Возьми и меня тоже и оставь там, где взял!"),
          CustomSpacer(),
          Paragraph(text: "Оставшись и без сосудов, и без денег, святой взвалил на спину прокаженного и медленно поплелся. Дойдя до места, где утром взял прокаженного, он бережно опустил его и хотел уже уйти. Но не успел сделать и шагу, как слышит за спиной такой приятный голос, что по всей земле не сыскать слаще и прекраснее его:"),
          CustomSpacer(),
          Paragraph(text: "— Благословен ты, Агафон, Господом неба и земли!"),
          CustomSpacer(),
          Paragraph(text: "Он повернулся посмотреть, кто это говорит, но не увидел никого."),
          CustomSpacer(),
          Paragraph(text: "Тогда святой Агафон понял, что прокаженный, которого он нес на спине, не был настоящим прокаженным, но Ангелом небесным, посланным от Бога испытать его кротость и терпение. От такой радости у отца Агафона как рукой сняло усталость. Он тихонько пошел к своей келье и много дней после этого все не мог оторвать помысла своего от произошедшего."),
          CustomSpacer(),
          Footnote(text: "[1] Прокаженный — человек, который страдал проказой. Это заболевание в основном выражается в поражении кожи. Такие люди в древности часто жили отдельно, изолированно от других. С ними почти никто не общался."),
        ],
      ),
    ),
  ),
);
  ''');

  static const LibraryName coreName = LibraryName(<String>['core', 'widgets']);
  static const LibraryName materialName = LibraryName(<String>['material', 'widgets']);
  static const LibraryName mainName = LibraryName(<String>['main']);
  static const LibraryName localName = LibraryName(<String>['local']);

  @override
  void initState() {
    super.initState();
    // Local widget library:
    _runtime.update(const LibraryName(<String>['core', 'widgets']), createCoreWidgets());
    _runtime.update(const LibraryName(<String>['core', 'material']), createMaterialWidgets());
    // Remote widget library:
    _runtime.update(mainName, _remoteWidgets);
    _runtime.update(localName, _createLocalWidgets());
    // Configuration data:

    _data.update('greet', <String, Object>{'name': 'World'});
    _data.update('image', <String, Object>{
      'image': 'https://avatars.mds.yandex.net/i?id=2aff19482031917efdd8b4514b02eb47-5233529-images-thumbs&n=13'
    });
  }

  static WidgetLibrary _createLocalWidgets() {
    return LocalWidgetLibrary(<String, LocalWidgetBuilder>{
      'GreenBox': (BuildContext context, DataSource source) {
        return ColoredBox(
          color: const Color(0xFF002211),
          child: source.child(<Object>['child']),
        );
      },
      'Image2': (BuildContext context, DataSource source) {
        final imageBase64 = source.v<String>(['image']) ?? '';
        return Container(
          margin: ArgumentDecoders.edgeInsets(source, ['margin']),
          child: imageBase64.isNotEmpty
              ? Image.network(
                  imageBase64,
                  height: 400,
                )
              : const Image(
                  image: AssetImage('assets/default.png'),
                ),
        );
      },
      'Hello': (BuildContext context, DataSource source) {
        return Center(
          child: Text(
            'Hello, ${source.v<String>(<Object>["name"])}!',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
      'H1': (context, source) => Text(
            source.v<String>(['text']) ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
      'H2': (context, source) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              source.v<String>(['text']) ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
      'Paragraph': (context, source) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              source.v<String>(['text']) ?? '',
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
      'ItalicText': (context, source) => Text(
            source.v<String>(['text']) ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
      'Footnote': (context, source) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              source.v<String>(['text']) ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
      'CustomSpacer': (context, source) => const SizedBox(height: 16),
      'ContentBlock': (context, source) => Container(
            margin: const EdgeInsets.all(16),
            child: source.child(['child']),
          ),
      'ImageBlock': (context, source) => Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Image.network(
              source.v<String>(['src']) ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
      'CustomScaffold': (context, source) => Scaffold(
            backgroundColor: const Color(0xFFfdeda4),
            appBar: AppBar(
              backgroundColor: const Color(0xFFfdeda4),
              title: const Text('Подробнее'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DivKitPage();
                  },
                )),
              ),
            ),
            body: source.child(['body']),
          ),
    });
  }

  // Widget example(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text(text: "Память преподобного Агафона Египетского"),
  //       ),
  //       body: SingleChildScrollView(
  //           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Padding(
  //           padding: EdgeInsets.all(16),
  //           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //             Container(decoration: BoxDecoration(image: Image.network(src)),)
  //             Text(
  //               text: "15 марта",
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //             ),
  //             _spacer(),
  //             _paragraph("— память преподобного Агафона Египетского. Его удивительное житие..."),
  //             _spacer(),
  //             _paragraph("Под «предлагаем для совместного чтения»:"),
  //             _spacer(),
  //             _paragraph("Во времена святого Антония Великого жил в Египте..."),
  //             // Повторить шаблон для всех остальных параграфов
  //             _spacer(),
  //             _paragraph("[1] Прокаженный — человек, который страдал проказой...",
  //                 style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
  //           ]),
  //         )
  //       ])));
  // }

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: _data,
      widget: const FullyQualifiedWidgetName(mainName, 'root'),
      onEvent: (String name, DynamicMap arguments) {
        // The example above does not have any way to trigger events, but if it
        // did, they would result in this callback being invoked.
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('вы нажали на кнопку')));
      },
    );
  }
}
