import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_responisve_ui/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key key, this.scrollOffset = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Responsive(
            mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [
        Image.asset(Assets.netflixLogo0),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(title: 'TV Shows', onTap: () => print('TV Shows')),
              _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
              _AppBarButton(title: 'My List', onTap: () => print('My List')),
            ],
          ),
        ),
      ]),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [
        Image.asset(Assets.netflixLogo1),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(title: 'Home', onTap: () => print('Home')),
              _AppBarButton(title: 'TV Shows', onTap: () => print('TV Shows')),
              _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
              _AppBarButton(title: 'Latest', onTap: () => print('Latest')),
              _AppBarButton(title: 'My List', onTap: () => print('My List')),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => print('Search'),
                icon: Icon(Icons.search),
                iconSize: 28,
                color: Colors.white,
                padding: EdgeInsets.zero,
              ),
              _AppBarButton(title: 'KIDS', onTap: () => print('KIDS')),
              _AppBarButton(title: 'DVD', onTap: () => print('DVD')),
              IconButton(
                onPressed: () => print('Gift'),
                icon: Icon(Icons.card_giftcard),
                iconSize: 28,
                color: Colors.white,
                padding: EdgeInsets.zero,
              ),
              IconButton(
                onPressed: () => print('Notifications'),
                icon: Icon(Icons.notifications),
                iconSize: 28,
                color: Colors.white,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarButton({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
