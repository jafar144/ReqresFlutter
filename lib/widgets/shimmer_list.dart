import 'package:flutter/material.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.baseColorShimmer,
                    highlightColor: AppColors.highlightColorShimmer,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.baseColorShimmer,
                        highlightColor: AppColors.highlightColorShimmer,
                        child: Container(
                          width: 150,
                          height: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Shimmer.fromColors(
                        baseColor: AppColors.baseColorShimmer,
                        highlightColor: AppColors.highlightColorShimmer,
                        child: Container(
                          width: 200,
                          height: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
