import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS_ARIFIN MULQA MAULANA',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF00695C)),
      ),
      home: HomeScreen(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    final double relStrength = 1.0 - (strength / 900);
    swatch[strength] = Color.fromRGBO(
      r,
      g,
      b,
      relStrength,
    );
  }
  return MaterialColor(color.value, swatch);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MovieListScreen(),
    TvShowListScreen(),
    FavoriteScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nobar Skuuy'),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.teal.shade700, // Warna background bottom navigation bar
        unselectedItemColor:
            Colors.teal.shade200, // Warna ikon ketika tidak dipilih
        selectedItemColor: Colors.indigo.shade400,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'TV Shows',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  final List<String> movies = [
    'Transformers: Rise of the Beasts 2023',
    'Spider-Man: Across the Spider-Verse 2023',
    'TEENAGE MUTANT NINJA TURTLES: MUTANT MAYHEM 2023',
    'Suzume 2022',
    'OPPENHEIMER 2023',
    // Tambahkan film lainnya
  ];

  final List<String> movieDescriptions = [
    'Action/Sci-fi ‧ 2h 7m',
    'Action/Sci-fi ‧ 2h 20m',
    'Sci-fi/Comedy ‧ 1h 40m',
    'Adventure/Animation ‧ 2h 2m',
    'Thriller/Thriller ‧ 3 hours',
    // Tambahkan deskripsi film lainnya
  ];

  final List<String> movieImages = [
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7229d393-c3b8-4703-a41e-e876546d2612/dfvitui-eec5c072-fa77-4c23-8682-03ddbfabfdd3.jpg/v1/fit/w_828,h_1226,q_70,strp/transformers__rise_of_the_beasts_official_poster_by_kingtchalla_dynasty_dfvitui-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzAwMCIsInBhdGgiOiJcL2ZcLzcyMjlkMzkzLWMzYjgtNDcwMy1hNDFlLWU4NzY1NDZkMjYxMlwvZGZ2aXR1aS1lZWM1YzA3Mi1mYTc3LTRjMjMtODY4Mi0wM2RkYmZhYmZkZDMuanBnIiwid2lkdGgiOiI8PTIwMjUifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.OxBKUzkkLA_qQ-TzPTmk_By5ks99HrRJ6WQO1dUAYyI', // URL gambar Transformers
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d0265531-23a9-4893-8264-9a17a0f1ac88/dfyt8e9-d374fc16-53fa-43b9-9d90-9dc9ecd52d0b.jpg/v1/fit/w_800,h_1000,q_70,strp/spider_man_across_the_spiderverse_by_godzillafanblue2021_dfyt8e9-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAwMCIsInBhdGgiOiJcL2ZcL2QwMjY1NTMxLTIzYTktNDg5My04MjY0LTlhMTdhMGYxYWM4OFwvZGZ5dDhlOS1kMzc0ZmMxNi01M2ZhLTQzYjktOWQ5MC05ZGM5ZWNkNTJkMGIuanBnIiwid2lkdGgiOiI8PTgwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.RFLA7AQuGXyGqgny32V8cQwInoFO4MitWNJjxw_8hAg', // URL gambar Movie 2
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7229d393-c3b8-4703-a41e-e876546d2612/dfxtdv7-4f528e6e-ceb5-4f42-80d5-23d6a6f156d0.jpg/v1/fit/w_750,h_1112,q_70,strp/tmnt__mutant_mayhem_official_poster_by_kingtchalla_dynasty_dfxtdv7-375w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjA0OCIsInBhdGgiOiJcL2ZcLzcyMjlkMzkzLWMzYjgtNDcwMy1hNDFlLWU4NzY1NDZkMjYxMlwvZGZ4dGR2Ny00ZjUyOGU2ZS1jZWI1LTRmNDItODBkNS0yM2Q2YTZmMTU2ZDAuanBnIiwid2lkdGgiOiI8PTEzODIifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.OLoDSB4Xif8hYuHKZkBF4o8OGris-xOif-ewwIkmGkM', // URL gambar Movie 3
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4dae1c26-c4b7-4f55-bcaa-0716a893efce/dfhjkqg-dfcafacc-b993-4a73-9464-46948d0b8bd2.jpg/v1/fill/w_800,h_999,q_70,strp/suzume_no_tojimari__poster_design__by_yureisen_dfhjkqg-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTU4OCIsInBhdGgiOiJcL2ZcLzRkYWUxYzI2LWM0YjctNGY1NS1iY2FhLTA3MTZhODkzZWZjZVwvZGZoamtxZy1kZmNhZmFjYy1iOTkzLTRhNzMtOTQ2NC00Njk0OGQwYjhiZDIuanBnIiwid2lkdGgiOiI8PTEyNzEifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.9m5sTRz0wvk5UGyeleHPC3vCd__V7XT_-uXiLH85-eg', // URL gambar Movie 4
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f9ec4b4e-d85f-4773-adac-ecd9fc1a528e/dfz30vt-965392b6-0b2b-4443-a41b-89a89c0b9b69.jpg/v1/fit/w_828,h_1310,q_70,strp/oppenheimer_poster_by_mygiahuy11_dfz30vt-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTU4MyIsInBhdGgiOiJcL2ZcL2Y5ZWM0YjRlLWQ4NWYtNDc3My1hZGFjLWVjZDlmYzFhNTI4ZVwvZGZ6MzB2dC05NjUzOTJiNi0wYjJiLTQ0NDMtYTQxYi04OWE4OWMwYjliNjkuanBnIiwid2lkdGgiOiI8PTEwMDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.v_erv6-l4Eam9apJLFr3YucDIT-PiydxIGaqF0IwhI8', // URL gambar Movie 5
    // Tambahkan URL gambar untuk film lainnya
  ];

  void _onMovieSelected(BuildContext context, String movieTitle) {
    // Implementasi untuk menanggapi ketika item dipilih
    int selectedIndex = movies.indexOf(movieTitle);
    String selectedDescription = movieDescriptions[selectedIndex];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Movie Selected'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You selected: $movieTitle'),
              SizedBox(height: 8.0),
              Text('Genre/Duration: $selectedDescription'),
              SizedBox(height: 8.0),
              Center(
                child: Image.network(
                  movieImages[selectedIndex],
                  height: 284.4,
                  width: 160.0,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _addToFavorites(movieTitle, selectedDescription,
                          movieImages[selectedIndex]);
                      Navigator.pop(context);
                    },
                    child: Text('Add to Favorites'),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
          // ...
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movies[index]),
          subtitle: Text(movieDescriptions[index]),
          leading: Image.network(
            movieImages[index],
            width: 27.0,
            height: 40.0,
            fit: BoxFit.cover,
          ),
          onTap: () {
            _onMovieSelected(context, movies[index]);
          },
        );
      },
    );
  }
}

// Tambahkan metode berikut untuk menangani penambahan ke favorit

void _addToFavorites(String title, String description, String image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? favoriteList = prefs.getStringList('favoriteList') ?? [];

  String newItem = '$title|$description|$image';
  favoriteList.add(newItem);

  prefs.setStringList('favoriteList', favoriteList);

  print('Added to favorites: $title');
}

class TvShowListScreen extends StatelessWidget {
  final List<String> tvShows = [
    'All of Us Are Dead',
    'Tokyo Ghoul: re',
    'Kingdom',
    'The Silent Sea',
    'The Uncanny Counter',
    // Tambahkan acara TV lainnya
  ];

  final List<String> tvShowDescriptions = [
    'Horror ‧ 1 season',
    'Animation ‧ 2 seasons',
    'Drama ‧ 2 seasons',
    'Sci-fi ‧ 1 season',
    'Drama ‧ 2 seasons',
    // Tambahkan deskripsi acara TV lainnya
  ];

  final List<String> tvShowImages = [
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/795bdf8c-becf-4990-8b9e-fe88ff8e7af5/dezflo8-9d18e597-297d-43f0-9c12-fb89be1f21b4.jpg/v1/fit/w_828,h_1276,q_70,strp/all_of_us_are_dead_by_carmen17dh_dezflo8-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYyOCIsInBhdGgiOiJcL2ZcLzc5NWJkZjhjLWJlY2YtNDk5MC04YjllLWZlODhmZjhlN2FmNVwvZGV6ZmxvOC05ZDE4ZTU5Ny0yOTdkLTQzZjAtOWMxMi1mYjg5YmUxZjIxYjQuanBnIiwid2lkdGgiOiI8PTEwNTcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.Tn-uxE3Kl1f88vi4X-8HyndmdHVgEZMg1Rf2RfnFd6w',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f5bb4019-a87c-4e92-af14-c651157a6614/dac7813-edbcd0cb-3156-47e0-a0ba-d29c4321b09e.jpg/v1/fit/w_828,h_1252,q_70,strp/tokyo_ghoul_re_86__the_one_eyed_king_by_ar_ua_dac7813-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYwMCIsInBhdGgiOiJcL2ZcL2Y1YmI0MDE5LWE4N2MtNGU5Mi1hZjE0LWM2NTExNTdhNjYxNFwvZGFjNzgxMy1lZGJjZDBjYi0zMTU2LTQ3ZTAtYTBiYS1kMjljNDMyMWIwOWUuanBnIiwid2lkdGgiOiI8PTEwNTgifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.yInOeB2QI2ekS_fZ693HDTSitclDLTbmQrC1xIJDVTg',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/23938e98-9474-4616-9c5e-f441c696594a/deq40d8-8b73b550-67e3-40a0-b641-284426025a7a.jpg/v1/fit/w_640,h_948,q_70,strp/kingdom_season_3_fanmade_poster_kang_haneul_by_ellaprk_deq40d8-375w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTQ4IiwicGF0aCI6IlwvZlwvMjM5MzhlOTgtOTQ3NC00NjE2LTljNWUtZjQ0MWM2OTY1OTRhXC9kZXE0MGQ4LThiNzNiNTUwLTY3ZTMtNDBhMC1iNjQxLTI4NDQyNjAyNWE3YS5qcGciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.yidP8PH6YB9Or4Qv0gsSewmaniArZyZ7d5mNwv-i6Lc',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c54b004-9dbd-44b7-8031-08fadd6517c1/dex64tr-fb7f72f4-f6fa-40f9-b3ed-ed57bb12e96c.png/v1/fit/w_512,h_512/the_silent_sea_2021_v1dss_by_ungrateful601010_dex64tr-375w-2x.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvMmM1NGIwMDQtOWRiZC00NGI3LTgwMzEtMDhmYWRkNjUxN2MxXC9kZXg2NHRyLWZiN2Y3MmY0LWY2ZmEtNDBmOS1iM2VkLWVkNTdiYjEyZTk2Yy5wbmciLCJ3aWR0aCI6Ijw9NTEyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.TXougc-DKnlRm9yqlmnb4e2t1aBFEa7BhEZJ4jnzRIo',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/67ed3c5d-d122-4eea-8821-b3722b0b2c25/deco93u-d92b8272-0356-4d32-b9dc-0d9d3bbb0b52.png/v1/fit/w_512,h_512/the_uncanny_counter_v01_by_aly70_deco93u-375w-2x.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNjdlZDNjNWQtZDEyMi00ZWVhLTg4MjEtYjM3MjJiMGIyYzI1XC9kZWNvOTN1LWQ5MmI4MjcyLTAzNTYtNGQzMi1iOWRjLTBkOWQzYmJiMGI1Mi5wbmciLCJ3aWR0aCI6Ijw9NTEyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.rGThJESLOXy5HbQTV6HJo6gTA_m2W4AKf27JVEROOck',
    // Tambahkan URL gambar untuk acara TV lainnya
  ];

  void _onTvShowSelected(BuildContext context, String tvShowTitle) {
    // Implementasi untuk menanggapi ketika item dipilih
    int selectedIndex = tvShows.indexOf(tvShowTitle);
    String selectedDescription = tvShowDescriptions[selectedIndex];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Title'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title: $tvShowTitle'),
              SizedBox(height: 8.0),
              Text('Genre/Series: $selectedDescription'),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: Image.network(
                  tvShowImages[selectedIndex],
                  height: 284.4,
                  width: 160.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _addToFavorites(tvShowTitle, selectedDescription,
                          tvShowImages[selectedIndex]);
                      Navigator.pop(context);
                    },
                    child: Text('Add to Favorites'),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Shows'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: tvShows.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onTvShowSelected(context, tvShows[index]);
            },
            child: Card(
              color: Colors.teal.shade600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      tvShowImages[index],
                      height: 275.5,
                      width: 155.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            tvShows[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade50,
                            ),
                          ),
                        ),
                        Center(child: SizedBox(height: 4.0)),
                        Center(
                            child: Text(
                          tvShowDescriptions[index],
                          style: TextStyle(color: Colors.teal.shade50),
                        )),
                      ],
                    ),
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

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                ),
                ListTile(
                  title: Text('Item 2'),
                ),
                ListTile(
                  title: Text('Item 3'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  child: Center(
                    child: Text('Grid Item 1'),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text('Grid Item 2'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFavoriteItem(String title, String description, String image) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          image,
          height: 150.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(description),
            ],
          ),
        ),
      ],
    ),
  );
}

// ...

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text('Search Result 1')),
                ListTile(title: Text('Search Result 2')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name = 'Arifin Mulqa Maulana';
  final String nim = '21552011425';
  final String projectShortcomings =
      'Sebagian tombol tidak berfungsi karena keterbatasan waktu pada tiap mata kuliah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/tes.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'NIM: $nim',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Project Shortcomings:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                projectShortcomings,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
