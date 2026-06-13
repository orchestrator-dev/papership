import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/document.dart';
import '../../../../domain/models/document_filter.dart';
import '../bloc/document_list_cubit.dart';
import '../bloc/document_list_state.dart';
import '../widgets/document_list_tile.dart';
import '../../../upload/data/pending_upload_repository.dart';
import 'package:go_router/go_router.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({super.key});

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  late final DocumentListCubit _cubit;
  int _pendingUploadCount = 0;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.I<DocumentListCubit>();
    _scrollController.addListener(_onScroll);
    if (_cubit.state == const DocumentListState.initial()) {
      _cubit.loadDocuments();
    }
    _loadPendingCount();
  }

  Future<void> _loadPendingCount() async {
    final repo = GetIt.I<PendingUploadRepository>();
    final uploads = await repo.getPendingUploads();
    if (mounted) {
      setState(() {
        _pendingUploadCount = uploads.length;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _cubit.loadMore();
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      final currentFilter = _cubit.state.mapOrNull(
            loading: (s) => s.filter,
            loaded: (s) => s.filter,
            error: (s) => s.filter,
          ) ??
          const DocumentFilter();
      _cubit.updateFilter(currentFilter.copyWith(query: query.isEmpty ? null : query));
    });
  }

  void _showPlaceholderBottomSheet(String title) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        alignment: Alignment.center,
        child: Text('$title Filter (Placeholder)'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Documents'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => context.push('/settings'),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Search documents...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      ActionChip(
                        label: const Text('All'),
                        onPressed: () {
                          _cubit.updateFilter(const DocumentFilter());
                        },
                      ),
                      const SizedBox(width: 8),
                      ActionChip(
                        label: const Text('Tags ▾'),
                        onPressed: () => _showPlaceholderBottomSheet('Tags'),
                      ),
                      const SizedBox(width: 8),
                      ActionChip(
                        label: const Text('Correspondent ▾'),
                        onPressed: () => _showPlaceholderBottomSheet('Correspondent'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        body: BlocBuilder<DocumentListCubit, DocumentListState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => _buildShimmer(),
              loading: (s) => s.documents.isEmpty ? _buildShimmer() : _buildList(s.documents, true),
              loaded: (s) => s.documents.isEmpty ? _buildEmpty() : _buildList(s.documents, s.hasMore),
              error: (s) => s.documents.isEmpty
                  ? Center(child: Text('Error: ${s.message}'))
                  : _buildList(s.documents, false),
            );
          },
        ),
        floatingActionButton: Badge(
          isLabelVisible: _pendingUploadCount > 0,
          label: Text('$_pendingUploadCount'),
          child: FloatingActionButton(
            onPressed: () => context.push('/scan'),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<Document> documents, bool hasMore) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: documents.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == documents.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return DocumentListTile(document: documents[index]);
      },
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const DocumentListTileShimmer(),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No documents found',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
