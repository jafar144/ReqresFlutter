import 'package:flutter/material.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetail extends StatelessWidget {
  const ShimmerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.baseColorShimmer,
            highlightColor: AppColors.highlightColorShimmer,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(65),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Shimmer.fromColors(
            baseColor: AppColors.baseColorShimmer,
            highlightColor: AppColors.highlightColorShimmer,
            child: Container(
              width: 200,
              height: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Shimmer.fromColors(
            baseColor: AppColors.baseColorShimmer,
            highlightColor: AppColors.highlightColorShimmer,
            child: Container(
              width: 160,
              height: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
