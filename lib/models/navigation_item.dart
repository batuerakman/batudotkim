enum NavigationItem { home, games, tvMovies, music, apps, about }

extension NavigationItemExtension on NavigationItem {
  String get label {
    switch (this) {
      case NavigationItem.home:
        return 'home';
      case NavigationItem.games:
        return 'games';
      case NavigationItem.tvMovies:
        return 'tv & movies';
      case NavigationItem.music:
        return 'music';
      case NavigationItem.apps:
        return 'apps';
      case NavigationItem.about:
        return 'about';
    }
  }
}
