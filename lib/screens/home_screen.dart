import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prj_reqres/bloc/home/home_cubit.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:prj_reqres/common/navigation.dart';
import 'package:prj_reqres/data/model/users_response.dart';
import 'package:prj_reqres/widgets/shimmer_list.dart';
import '../bloc/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<HomeCubit, CommonState>(
        builder: (context, state) {
          switch (state) {
            case Loading():
              return const ShimmerList();
            case Success():
              final UsersResponse usersResponse = state.data;
              return _showHomeContent(context, usersResponse.data);
            case Error():
              return Center(child: Text(state.message));
          }
        },
      ),
    );
  }

  Widget _showHomeContent(BuildContext context, List<User> users) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _buildItemList(context, users[index]);
          },
          itemCount: users.length,
        ),
      ),
    );
  }

  Widget _buildItemList(BuildContext context, User user) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          Navigation.detail,
          pathParameters: {'id': user.id.toString()},
        );
      },
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showZoomImage(context, user);
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(48)),
                  child: CachedNetworkImage(
                    imageUrl: user.avatar,
                    fit: BoxFit.contain,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showZoomImage(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: user.avatar,
                    fit: BoxFit.contain,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
