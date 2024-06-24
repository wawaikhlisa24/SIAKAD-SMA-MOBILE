import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pembelajaran'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          MateriCard(
            title: 'Matematika',
            description: 'Materi Kelas XII',
            onTap: () => _navigateToDetail(
              context, 
              'Matematika', 
              'Matematika, adalah bidang ilmu, yang mencakup studi tentang topik-topik seperti bilangan, rumus dan struktur terkait, bangun dan ruang tempat mereka berada, dan besaran serta perubahannya.', 
              ['d33u16SxB0Y', 'AlrOq3W7IZ4', 'uKbShS7bl2M','FqYIq9kdshM','t5r8-4frZUI']
            ),
          ),
          MateriCard(
            title: 'Bahasa Inggris',
            description: 'Materi Kelas XII',
            onTap: () => _navigateToDetail(
              context, 
              'Bahasa Inggris', 
              'Bahasa Inggris adalah sebuah bahasa Jermanik yang pertama kali dituturkan di Inggris pada Abad Pertengahan Awal dan saat ini merupakan bahasa yang paling umum digunakan di seluruh dunia.', 
              ['owC80a8xHT4','k2_2H3qT9q0','yOlbujCKRGU','_AVFVkAj_CU','S68acfiXcd0']
            ),
          ),
          MateriCard(
            title: 'Pemrograman',
            description: 'Materi Kelas XII',
            onTap: () => _navigateToDetail(
              context, 
              'Pemrograman', 
              'Pemrograman adalah proses menulis, menguji, dan memelihara kode instruksi yang ditujukan untuk mengendalikan perilaku komputer.', 
              ['OL9BDf_lNzs', 'I-pbjWd9EHo', 'B1q2q3aDnRY','_YjAGWZG_SI','RAAd1TelBls']
            ),
          ),
          MateriCard(
            title: 'Bahasa Indonesia',
            description: 'Materi Kelas XII',
            onTap: () => _navigateToDetail(
              context, 
              'Bahasa Indonesia', 
              'Kamu akan mempelajari segala hal tentang bahasa mulai dari bagaimana pembentukan suatu kata, pengucapan kata yang benar, tata kalimat, juga yang lainnya.', 
              ['_cLskKGndYg', '-wt_UcqQU0A', 'MQR8vXg8eP4','bh19b5wdL5c','MSCNEGjb5zE']
            ),
          ),
          MateriCard(
            title: 'Kimia',
            description: 'Materi Kelas XII',
            onTap: () => _navigateToDetail(
              context, 
              'Kimia', 
              'Kimia adalah ilmu yang mempelajari mengenai komposisi, struktur, dan sifat zat atau materi dari skala atom hingga molekul serta transformasi dan interaksi mereka untuk membentuk materi yang ditemukan di kehidupan sehari-hari.', 
              ['UBU0cpv-AHg', '0vMWdYJQXfY', 'aBx9pkOusMA','jurRtGKA9sw','VXZp9upbD7M']
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String title, String description, List<String> videoIds) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MateriDetailPage(title: title, description: description, videoIds: videoIds),
      ),
    );
  }
}

class MateriCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const MateriCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MateriDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> videoIds;

  const MateriDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.videoIds,
  }) : super(key: key);

  @override
  _MateriDetailPageState createState() => _MateriDetailPageState();
}

class _MateriDetailPageState extends State<MateriDetailPage> {
  late YoutubePlayerController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoIds[_currentIndex],
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _onVideoTap(int index) {
    setState(() {
      _currentIndex = index;
      _controller.load(widget.videoIds[_currentIndex]);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.green,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                player,
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.videoIds.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Materi ${index + 1}'),
                        onTap: () => _onVideoTap(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
