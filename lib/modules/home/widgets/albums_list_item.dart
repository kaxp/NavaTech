import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_nava/config/assets/app_images.dart';
import 'package:tech_nava/constants/spacing_constants.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';

class AlbumsListItem extends StatelessWidget {
  const AlbumsListItem({
    required this.albums,
    super.key,
  });

  final AlbumsResponse albums;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSpacingMedium,
            vertical: kSpacingXSmall,
          ),
          child: Text(
            albums.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
              scrollDirection: Axis.horizontal,
              itemCount: null, // using null to make infinite scroll
              itemBuilder: (context, index) {
                final actualIndex = index % albums.images.length;
                final image = albums.images[actualIndex];
                final leftPadding =
                    actualIndex == 0 ? kSpacingZero : kSpacingXSmall;

                return Padding(
                  padding: EdgeInsets.only(left: leftPadding),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: CachedNetworkImage(
                      imageUrl: image.url,
                      height: 180,
                      width: 120,
                      fit: BoxFit.cover,
                      errorWidget: (context, image, _) =>
                          AppImages.icErrorPlaceholder(
                        height: 180,
                        widget: 120,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
