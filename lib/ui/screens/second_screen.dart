import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';

class SecondScreen extends StatelessWidget {
  static String path = '/settings';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Header(text: 'bottom_nav_second'),
            LinkCard(
              title: 'github_card_title',
              icon: FluentIcons.diversity_24_regular,
              url: Uri.parse(
                  'https://github.com/anfeichtinger/flutter_production_boilerplate_riverpod'),
            ),
            const TextDivider(text: 'author_divider_title'),
            Center(
              child: Text(
                'Andreas Feichtinger',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(fontWeightDelta: 2),
              ),
            ),
            const SizedBox(height: 8),
            StaggeredGrid.count(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: <GridItem>[
                GridItem(
                  title: 'instagram_card_title',
                  icon: FluentIcons.camera_switch_24_regular,
                  url: Uri.parse('https://www.instagram.com/anfeichtinger'),
                ),
                GridItem(
                  title: 'donate_card_title',
                  icon: FluentIcons.heart_24_filled,
                  iconColor: Theme.of(context).colorScheme.tertiary,
                  url: Uri.parse(
                      'https://www.paypal.com/donate?hosted_button_id=EE3W7PS6AHEP8&source=url'),
                ),
                GridItem(
                  title: 'website_card_title',
                  icon: FluentIcons.desktop_24_regular,
                  url: Uri.parse('https://www.feichtinger.dev'),
                ),
              ],
            ),
            const TextDivider(text: 'packages_divider_title'),
            StaggeredGrid.count(
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 3 : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: <GridItem>[
                GridItem(
                  title: 'flutter_riverpod',
                  icon: FluentIcons.leaf_one_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_riverpod/versions/2.5.1'),
                  version: '2.5.1',
                ),
                GridItem(
                  title: 'path_provider',
                  icon: FluentIcons.puzzle_piece_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/path_provider/versions/2.1.4'),
                  version: '2.1.4',
                ),
                GridItem(
                  title: 'flutter_displaymode',
                  icon: FluentIcons.top_speed_24_filled,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_displaymode/versions/0.6.0'),
                  version: '0.6.0',
                ),
                GridItem(
                  title: 'easy_localization',
                  icon: FluentIcons.local_language_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/easy_localization/versions/3.0.7'),
                  version: '3.0.7',
                ),
                GridItem(
                  title: 'hive',
                  icon: FluentIcons.leaf_three_24_regular,
                  url:
                      Uri.parse('https://pub.dev/packages/hive/versions/2.2.3'),
                  version: '2.2.3',
                ),
                GridItem(
                  title: 'hive_flutter',
                  icon: FluentIcons.leaf_two_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/hive_flutter/versions/1.1.0'),
                  version: '1.1.0',
                ),
                GridItem(
                  title: 'lints',
                  icon: FluentIcons.code_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_lints/versions/4.0.0'),
                  version: '4.0.0',
                ),
                GridItem(
                  title: 'url_launcher',
                  icon: FluentIcons.share_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/url_launcher/versions/6.3.0'),
                  version: '6.3.0',
                ),
                GridItem(
                  title: 'fluentui_system_icons',
                  icon: FluentIcons.icons_24_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/fluentui_system_icons/versions/1.1.255'),
                  version: '1.1.255',
                ),
                GridItem(
                  title: 'flutter_staggered_grid_view',
                  icon: FluentIcons.grid_28_regular,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_staggered_grid_view/versions/0.7.0'),
                  version: '0.7.0',
                ),
              ],
            ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
