enum NavigationItem { home, apps, tvMovies, music, games, about }

extension NavigationItemExtension on NavigationItem {
  String get label {
    switch (this) {
      case NavigationItem.home:
        return 'home';
      case NavigationItem.games:
        return 'games';
      case NavigationItem.tvMovies:
        return 'media';
      case NavigationItem.music:
        return 'unreal engine';
      case NavigationItem.apps:
        return 'apps';
      case NavigationItem.about:
        return 'about';
    }
  }
}
