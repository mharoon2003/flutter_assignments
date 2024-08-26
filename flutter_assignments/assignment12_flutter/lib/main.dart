import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Ten Libraries of Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 200,
              backgroundImage: NetworkImage('assets/flutter2.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Top Eight Libraries of Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Library> libraries = [
    Library('Provider',
        '''A state management library. A wrapper around InheritedWidget to make them easier to use and more reusable. By using provider instead of manually writing InheritedWidget, you get:
         1: simplified allocation/disposal of resources
         2: lazy-loading
         3: a vastly reduced boilerplate over making a new class every time
         4: devtool friendly – using Provider, the state of your application will be visible in the Flutter devtool
         5: a common way to consume these InheritedWidgets (See Provider.of/Consumer/Selector)
         6: increased scalability for classes with a listening mechanism that grows exponentially in complexity (such as ChangeNotifier, which is O(N) for dispatching notifications).
''',
        'assets/provider.png', ExampleProvider(),
    "https://pub.dev/packages?q=provider"),

    Library('Dio', '''A powerful HTTP client for Dart. A powerful HTTP networking package for Dart/Flutter, supports Global configuration, Interceptors, FormData, Request cancellation, File uploading/downloading, Timeout, Custom adapters, Transformers, etc.''',
        'assets/flutter2.png', ExampleDio(),
    "https://pub.dev/packages?q=dio"),

    Library('Flutter_bloc', '''A predictable state management library. Widgets that make it easy to integrate blocs and cubits into Flutter. Built to work with package:bloc.
     BlocBuilder :
  BlocBuilder is a Flutter widget which requires a bloc and a builder function. BlocBuilder handles building the widget in response to new states. BlocBuilder is very similar to StreamBuilder but has a more simple API to reduce the amount of boilerplate code needed. The builder function will potentially be called many times and should be a pure function that returns a widget in response to the state.''',
        'assets/flutter_bloc.png', ExampleBloc(),
    "https://pub.dev/packages/flutter_bloc"),

    Library('Cached_network_image', '''Image caching library. A flutter library to show images from the internet and keep them in the cache directory. 
    How to use :
The CachedNetworkImage can be used directly or through the ImageProvider. Both the CachedNetworkImage as CachedNetworkImageProvider have minimal support for web. It currently doesn't include caching.''',
        'assets/flutter2.png', ExampleCacheImage(),
    "https://pub.dev/packages/cached_network_image"),

    Library('URL_launcher', 'Flutter plugin for launching a URL. Supports web, phone, SMS, and email schemes.',
        'assets/flutter2.png', ExampleUrlLauncher(),
    "https://pub.dev/packages/url_launcher"),

    Library('Google_fonts', 'Custom fonts from Google Fonts.',
        'assets/googlefonts.jpg', ExampleGoogleFonts(),
    "https://pub.dev/packages/google_fonts"),


    Library('Local_auth', '''Authenticate using device biometric. This Flutter plugin provides means to perform local, on-device authentication of the user.
On supported devices, this includes authentication with biometrics such as fingerprint or facial recognition.''',
        'assets/fonts.jpg', ExampleLocalAuth(),
    "https://pub.dev/packages/local_auth"),

    Library('Shared_preferences', '''Persist simple data locally. Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.). Data may be persisted to disk asynchronously, and there is no guarantee that writes will be persisted to disk after returning, so this plugin must not be used for storing critical data.''',
        'assets/flutter2.png', ExampleSharedPreferences(),
    "https://pub.dev/packages/shared_preferences"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Libraries'),
      backgroundColor: Colors.teal[100],),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pink[100],
        child: ListView.builder(
          itemCount: libraries.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.teal[200],
              margin: EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(libraries[index].imageUrl),
                ),
                title: Text(libraries[index].name),
               // subtitle: Text(libraries[index].description),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(library: libraries[index])));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final Library library;

  DetailPage({required this.library});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(title: Text(widget.library.name),
      backgroundColor: Colors.teal[200],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: EdgeInsets.all(5),
            color: Colors.pink[100],

            child: Column(
              children: [
                Text(widget.library.description,
                    style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Example of Library'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => widget.library.example));
                      },
                    ),
                    SizedBox(width: 4,),

                    ElevatedButton(
                      child: Text('more about'),
                      onPressed: () {
                        launchURL(widget.library.link);
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}




class Library {
  final String name;
  final String description;
  final String imageUrl;
  final Widget example;
  final String link;

  Library(this.name, this.description, this.imageUrl, this.example, this.link);
}

// Example Pages
class ExampleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: Scaffold(

        appBar: AppBar(title: Text('Example: Provider'),
        backgroundColor: Colors.teal[200],),
        body: Container(
          margin: EdgeInsets.all(4),
          width: double.infinity,
          height: double.infinity,
          color: Colors.pink[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Counter>(
                  builder: (context, counter, child) => Text(
                    'Counter Value: ${counter.value}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.read<Counter>().increment(),
                  child: Text('Increment Counter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

class ExampleDio extends StatelessWidget {
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: Dio'),
      backgroundColor: Colors.teal[200],),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');//it open a new website as a dialog message
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Response'),
                    content: Text(response.data.toString()),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),//it goes to the previous page
                      ),
                    ],
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: Text('Fetch Data'),
          ),
        ),
      ),
    );
  }
}

class ExampleBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Example: Flutter_bloc'),
        backgroundColor: Colors.teal[200],),
        body: Container(
          margin: EdgeInsets.all(4),
          width: double.infinity,
          height: double.infinity,
          color: Colors.pink[100],
          child: Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Counter Value: $count', style: TextStyle(fontSize: 24)),
                    ElevatedButton(
                      onPressed: () => context.read<CounterCubit>().increment(),
                      child: Text('Increment Counter'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

class ExampleCacheImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: Cached_network_image')),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: Center(
          child: CachedNetworkImage(
            imageUrl: 'https://www.pexels.com/photo/brown-wooden-dock-414612/',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class ExampleUrlLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: URL_launcher'),
      backgroundColor: Colors.teal[200],),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: ListView(
          children: [
            SizedBox(height: 4,),
            
            ListTile(
              hoverColor: Colors.pink[200],
              title: Text('Open Flutter Website'),
              onTap: () => _launchURL('https://flutter.dev'),
            ),

            SizedBox(height: 4,),
            ListTile(
              hoverColor: Colors.pink[200],
              title: Text('Open Dart Website'),
              onTap: () => _launchURL('https://dart.dev'),
            ),

            SizedBox(height: 4,),
            ListTile(
              hoverColor: Colors.pink[200],
              title: Text('Open GitHub'),
              onTap: () => _launchURL('https://github.com'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ExampleGoogleFonts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: Google_fonts'),
      backgroundColor: Colors.teal[200],),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: Center(
          child: Text(
            'Hello, Google Fonts!',
            style: GoogleFonts.lobster(fontSize: 24),
          ),
        ),
      ),
    );
  }
}




class ExampleLocalAuth extends StatefulWidget {
  @override
  _ExampleLocalAuthState createState() => _ExampleLocalAuthState();
}

class _ExampleLocalAuthState extends State<ExampleLocalAuth> {
  final LocalAuthentication _auth = LocalAuthentication();
  String _status = 'Not authenticated';

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _auth.authenticate(
          localizedReason: 'Authenticate to access this feature',
          options: AuthenticationOptions(stickyAuth: true));
    } catch (e) {
      print(e);
    }

    setState(() {
      _status = authenticated ? 'Authenticated' : 'Failed to authenticate';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: Local_auth'),
      backgroundColor: Colors.teal[200],),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_status, style: TextStyle(fontSize: 24)),
              ElevatedButton(
                onPressed: _authenticate,
                child: Text('Authenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleSharedPreferences extends StatefulWidget {
  @override
  _ExampleSharedPreferencesState createState() =>
      _ExampleSharedPreferencesState();
}

class _ExampleSharedPreferencesState extends State<ExampleSharedPreferences> {
  String _data = '';
  final TextEditingController _controller = TextEditingController();

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', _controller.text);
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = prefs.getString('key') ?? 'No data found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example: Shared_preferences'),
      backgroundColor: Colors.teal[200],),
      body: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_data, style: TextStyle(fontSize: 24)),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter Data',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                )),
              ),

              SizedBox(height: 6,),

              ElevatedButton(
                onPressed: _saveData,
                child: Text('Save Data'),
              ),

              SizedBox(height: 6,),

              ElevatedButton(
                onPressed: _loadData,
                child: Text('Load Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//class ExampleImagePicker extends StatefulWidget {
//   @override
//   _ExampleImagePickerState createState() => _ExampleImagePickerState();
// }
//
// class _ExampleImagePickerState extends State<ExampleImagePicker> {
//   ImagePicker _picker = ImagePicker();
//   XFile? _image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Example: Image_picker')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null ? Text('No image selected.') : Image.file(File(_image!.path)),
//             ElevatedButton(
//               onPressed: () async {
//                 final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//                 setState(() {
//                   _image = pickedFile;
//                 });
//               },
//               child: Text('Pick Image from Gallery'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//Library('Image_picker', 'Select images from the gallery or camera. A Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera.',
//         'https://via.placeholder.com/100', ExampleImagePicker(),
//     "https://pub.dev/packages/image_picker"),



//class ExamplePathProvider extends StatefulWidget {
//   @override
//   _ExamplePathProviderState createState() => _ExamplePathProviderState();
// }
//
// class _ExamplePathProviderState extends State<ExamplePathProvider> {
//   String _path = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _getPath();
//   }
//
//   Future<void> _getPath() async {
//     final directory = await getApplicationDocumentsDirectory();
//     setState(() {
//       _path = directory.path;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Example: Path_provider'),
//       backgroundColor: Colors.teal[200],),
//       body: Container(
//         margin: EdgeInsets.all(4),
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.pink[100],
//         child: Center(
//           child: Text('Document directory: $_path', style: TextStyle(fontSize: 16)),
//         ),
//       ),
//     );
//   }
// }

// Library('Path_provider', 'Access files on the device. A Flutter plugin for finding commonly used locations on the filesystem. Supports Android, iOS, Linux, macOS and Windows. Not all methods are supported on all platforms.',
//         'assets/provider.png', ExamplePathProvider(),
//     "https://pub.dev/packages/path_provider"),