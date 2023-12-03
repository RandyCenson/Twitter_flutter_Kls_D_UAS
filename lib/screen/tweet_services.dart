

class TweetModel {
  final String namaPengguna;
  final String username;
  final String body;
  final String url;
  final List<String> image;
  final String verified;
  final String otomatis;
  final DateTime createdAt;
  final List<String> comment;
  final List<String> retweet;
  final List<String> like;
  final int view;
  final String FotoPengguna;

  TweetModel({
    required this.FotoPengguna,
    required this.namaPengguna,
    required this.username,
    required this.body,
    required this.url,
    required this.image,
    required this.verified,
    required this.otomatis,
    required this.createdAt,
    required this.comment,
    required this.retweet,
    required this.like,
    required this.view,
  });
}



class TweetService {
  
  static List<TweetModel> getTweet() {

    return <TweetModel>[
      
      TweetModel(
        FotoPengguna: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Ophelia_1894.jpg/640px-Ophelia_1894.jpg',
        namaPengguna: 'Rocky_Ackerman🍉',
        username: 'NESVERLAND',
        body:
            'buat yang masih penasaran sama awal mula meme template "dan naga" yak semua berawal dari user twitter satu ini 😭 jujur gw masih ngakak tiap liat screenshootan ini sumpah 😭',
        url: '',
        image: ['assets/images/image2.jpeg',],
        verified: 'no',
        otomatis: '',
        createdAt: DateTime.now(),
        comment: ['NESVERLAND', 'Marvel', 'Penguin🐧',],
        retweet: ['NESVERLAND', 'Marvel'],
        like: ['NESVERLAND', 'Marvel'],
        view: 2200,
      ),
      TweetModel(
        FotoPengguna: 'https://asset-a.grid.id/crop/0x0:0x0/800x600/photo/2018/11/13/4155295260.jpg',
        namaPengguna: 'Marvel Entertaintment',
        username: 'Marvel',
        body:
            'Tom Hiddleston discusses Loki and Mobius friendship throughout Season 2: "Mobius and Loki are kind an odd couple, but they found a friendship. They make each other better."',
        url: 'https://t.co/WkwT1lYuTJ',
        image: [],
        verified: 'yellow',
        otomatis: '',
        createdAt: DateTime.now(),
        comment: ['Marvel', 'NESVERLAND', 'Penguin🐧', 'tang_kira', 'AXISgsm',],
        retweet: ['Marvel', 'NESVERLAND', 'Penguin🐧', 'tang_kira', 'AXISgsm',],
        like: ['Marvel', 'NESVERLAND', 'Penguin🐧', 'tang_kira', 'AXISgsm'],
        view: 384100,
      ),
      TweetModel(
        FotoPengguna: 'https://stickershop.line-scdn.net/stickershop/v1/product/16736817/LINEStorePC/main.png?v=1',
        namaPengguna: 'Why you should have a penguin',
        username: 'Penguin🐧',
        body:
            'Hiiii!!!',
        url: '',
        image: ['assets/images/image3.jpeg',
                'assets/images/image4.jpeg',
                'assets/images/image5.jpeg',
                'assets/images/image6.jpeg',
                'assets/images/image7.jpeg',
                'assets/images/image8.jpeg',
        ],
        verified: 'no',
        otomatis: '',
        createdAt: DateTime.now(),
        comment: ['Penguin', 'NESVERLAND'],
        retweet: ['Penguin'],
        like: ['Penguin', 'NESVERLAND', 'tang_kira',],
        view: 327,
      ),
      TweetModel(
        FotoPengguna: 'https://e1.pxfuel.com/desktop-wallpaper/1021/577/desktop-wallpaper-foto-aesthetic-hitam.jpg',
        namaPengguna: 'Bintang',
        username: 'tang_kira',
        body:
            'Kok ga ada yang merhatiin anak saya? Anak umur 3 tahun loh. Seorang ibu di Korea Selatan curhat ke tetangganya karena anaknya yang berusia 3 tahun naik lift sendiri di apartemen dari lantai 3 ke lantai 30. Sampai sang ibu panik banget nyariin anaknya dari satu lantai ke lantai lain. Akhirnya petugas keamanan yang nganter anak itu pulang lagi ke ruangan apartemen dia.',
        url: '',
        image: [],
        verified: 'no',
        otomatis: 'NESVERLAND',
        createdAt: DateTime.now(),
        comment: ['tang_kira', 'Penguin🐧',],
        retweet: ['tang_kira', 'Penguin🐧',],
        like: ['tang_kira', 'NESVERLAND',],
        view: 1511,
      ),
      TweetModel(
        FotoPengguna: 'https://imgx.sonora.id/crop/0x0:0x0/700x465/photo/2023/04/26/ilustrasi-axisjpg-20230426064036.jpg',
        namaPengguna: 'AXIS',
        username: 'AXISgsm',
        body: 'Bisa atur waktu internet pas main sosmed, gak perlu takut kuota terbuang sia-sia!',
        url: 'https://www.axis.co.id/produk/paket-internet/paket-teng-go?utm_source=WM_TWITTER&utm_medium=video_CPM_Video&utm_campaign=AXIS_2038IDWM141506TAC-WEB-TENGGO&utm_content=2038IDWM141506TAC-WEB-TENGGO',
        image: [],
        verified: 'blue',
        otomatis: '',
        createdAt: DateTime.now(),
        comment: ['AXISgsm',],
        retweet: ['AXISgsm',],
        like: ['AXISgsm', 'NESVERLAND', 'tang_kira'],
        view: 9830,
      ),
    ];  
    
    
  }
}

