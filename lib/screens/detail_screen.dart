import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_reqres/bloc/detail/detail_cubit.dart';
import 'package:prj_reqres/bloc/detail/detail_state.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:prj_reqres/data/model/users_response.dart';
import 'package:prj_reqres/widgets/shimmer_detail.dart';

class DetailScreen extends StatefulWidget {
  final String idUser;

  const DetailScreen({
    super.key,
    required this.idUser,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DetailCubit>().getDetailUser(int.parse(widget.idUser));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail User",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            switch (state) {
              case Success():
                final User user = state.data;
                return _buildDetailUser(user);
              case Error():
                return Center(child: Text(state.message));
              default:
                return const ShimmerDetail();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDetailUser(User user) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(65)),
            child: CachedNetworkImage(imageUrl: user.avatar),
          ),
          const SizedBox(height: 16),
          Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user.email,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
