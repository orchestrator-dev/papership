import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/models/document.dart';

class DocumentListTile extends StatelessWidget {
  final Document document;
  final VoidCallback? onTap;

  const DocumentListTile({
    super.key,
    required this.document,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Assuming baseUrl is configured in Dio
    final dio = GetIt.I<Dio>();
    final baseUrl = dio.options.baseUrl.endsWith('/')
        ? dio.options.baseUrl.substring(0, dio.options.baseUrl.length - 1)
        : dio.options.baseUrl;
    final thumbUrl = '$baseUrl/api/documents/${document.id}/thumb/';

    // TODO: Fetch actual auth headers from AuthBloc/SecureStorage
    final headers = <String, String>{};

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: onTap,
      leading: SizedBox(
        width: 50,
        height: 70,
        child: CachedNetworkImage(
          imageUrl: thumbUrl,
          httpHeaders: headers,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(color: Colors.white),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        document.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text('Correspondent: ${document.correspondent ?? 'None'}'),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14),
              const SizedBox(width: 4),
              Text(document.created.split('T').first),
              const SizedBox(width: 8),
              const Icon(Icons.local_offer, size: 14),
              const SizedBox(width: 4),
              Text('${document.tags.length}'),
            ],
          ),
        ],
      ),
    );
  }
}

class DocumentListTileShimmer extends StatelessWidget {
  const DocumentListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(width: 50, height: 70, color: Colors.white),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(height: 16, width: double.infinity, color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(height: 14, width: 150, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(height: 14, width: 100, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
