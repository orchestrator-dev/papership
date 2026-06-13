import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/result.dart';
import '../../data/remote/services/paperless_api_service_impl.dart';

class UploadRequest {
  final List<int> pdfBytes;
  final String title;
  final List<int>? tagIds;
  final int? correspondentId;
  final int? documentTypeId;
  final DateTime? createdDate;
  final String? asn;

  UploadRequest({
    required this.pdfBytes,
    required this.title,
    this.tagIds,
    this.correspondentId,
    this.documentTypeId,
    this.createdDate,
    this.asn,
  });
}

@injectable
class UploadDocumentUseCase {
  final PaperlessApiServiceImpl _apiService;

  UploadDocumentUseCase(this._apiService);

  Future<Result<String>> call(UploadRequest request) async {
    final multipartFile = MultipartFile.fromBytes(
      request.pdfBytes,
      filename: '${request.title}.pdf',
    );

    String? formattedDate;
    if (request.createdDate != null) {
      formattedDate = request.createdDate!.toIso8601String();
    }

    return _apiService.uploadDocument(
      multipartFile,
      title: request.title,
      tags: request.tagIds,
      correspondentId: request.correspondentId,
      documentTypeId: request.documentTypeId,
      createdDate: formattedDate,
      asn: request.asn,
    );
  }
}
