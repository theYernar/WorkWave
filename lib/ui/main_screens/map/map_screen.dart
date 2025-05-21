import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:latlong2/latlong.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/data/places_data.dart';

class MapScreen extends StatefulWidget {
  final PlaceMarker? targetPlace; 

  const MapScreen({Key? key, this.targetPlace}) : super(key: key);
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  // Проверка интернет-соединения
  // Future<bool> checkInternetConnection() async {
  //   final connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return false;
  //   }
  //   return await InternetConnectionChecker().hasConnection;
  // }

  // void onCheckConnectionPressed() async {
  //   bool hasInternet = await checkInternetConnection();
  //   if (!hasInternet) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         padding: const EdgeInsets.all(20),
  //         content: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.red,
  //             borderRadius: BorderRadius.circular(14),
  //           ),
  //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //           child: const Text(
  //             'Нет подключения к интернету',
  //             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  //           ),
  //         ),
  //         duration: const Duration(seconds: 5),
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //       ),
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // onCheckConnectionPressed();
    _updateMarkers();


    
    // Если передано место, показать его
    if (widget.targetPlace != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _goToTargetPlace(widget.targetPlace!);
      });
    }
  }

  void _goToTargetPlace(PlaceMarker place) {
    _animatedMapController.animateTo(
      dest: place.location,
      zoom: 17,
      customId: useTransformer ? _useTransformerId : null,
    );

    setState(() {
      selectedMarkerId = place.id;
    });

    _showModalBottomSheet(place);
  }

  static const _useTransformerId = 'useTransformerId';
  bool useTransformer = true;

  // ValueNotifier для обновления списка AnimatedMarker на карте
  final markers = ValueNotifier<List<AnimatedMarker>>([]);

  // Контроллер карты с анимациями
  late final _animatedMapController = AnimatedMapController(vsync: this);

  // Если пользователь вызвал метод goToMyLocation, здесь будет храниться его координата
  LatLng? _userLocation;
  ValueNotifier<bool> userLocationEnabled = ValueNotifier<bool>(false);

  // Для отслеживания выбранной метки
  String? selectedMarkerId;

  @override
  void dispose() {
    markers.dispose();
    _animatedMapController.dispose();
    super.dispose();
  }

  void zoomIn() {
    _animatedMapController.animatedZoomIn(
      customId: useTransformer ? _useTransformerId : null,
    );
  }

  void zoomOut() {
    _animatedMapController.animatedZoomOut(
      customId: useTransformer ? _useTransformerId : null,
    );
  }

  Future<void> goToMyLocation() async {
    // onCheckConnectionPressed();

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        userLocationEnabled.value = false;
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final latLng = LatLng(position.latitude, position.longitude);

    _userLocation = latLng;

    setState(() {
      userLocationEnabled.value = true;
    });
    _animatedMapController.animateTo(
      dest: latLng,
      zoom: 16,
      customId: useTransformer ? _useTransformerId : null,
    );
    _updateMarkers();
  }

  /// Обновление общего списка маркеров (как для заданных мест, так и для метки пользователя)
  void _updateMarkers() {
    List<AnimatedMarker> allMarkers = [];
    // Построение маркеров из словаря с местами
    allMarkers.addAll(_buildPlaceMarkers());

    // Добавление пользовательской метки, если координаты известны
    if (_userLocation != null) {
      allMarkers.add(
        AnimatedMarker(
          point: _userLocation!,
          builder:
              (context, animation) => ScaleTransition(
                scale: animation,
                child: ValueListenableBuilder(
                  valueListenable: userLocationEnabled,
                  builder: (_, value, __) {
                    return Image.asset(
                      'assets/icons/gps.png',
                      width: 32,
                      color: value ? Colors.blue : Colors.grey,
                    );
                  },
                ),
              ),
        ),
      );
    }
    markers.value = allMarkers;
  }

  void openFullscreenImage(BuildContext context, String imageUrl) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Фотография",
      transitionDuration: Duration(milliseconds: 50),
      pageBuilder: (context, animation, secondaryAnimation) {
        return InteractiveViewer(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder:
                    (context, error, stackTrace) =>
                        Icon(Icons.error, size: 40, color: Colors.white),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  _showModalBottomSheet(PlaceMarker place) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  place.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(HugeIcons.strokeRoundedCancel01),
                              ),
                            ],
                          ),
                          Text(
                            place.type,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.deepPurple
                            ),
                          ),
            
                          const SizedBox(height: 4,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(HugeIcons.strokeRoundedLocation01),
                              const SizedBox(width: 5,),
                              Expanded(
                                child: Text(
                                  place.address,
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ],
                          ),
            
                          const SizedBox(height: 15,),
            
                          place.imageUrl.isNotEmpty 
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Фотографии (${place.imageUrl.length})',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Icon(HugeIcons.strokeRoundedCamera01, color: AppColors.deepPurple,)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: place.imageUrl.length,
                                  itemBuilder:(context, index) {
                                    final image = place.imageUrl[index];
                                    return Container(
                                      width: 180,
                                      margin: const EdgeInsets.only(right: 10),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.network(
                                            image, 
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                                return Center(child: CircularProgressIndicator(color: AppColors.blue));
                                              },
                                              errorBuilder:(context, error, stackTrace) => Icon(HugeIcons.strokeRoundedRssError, size: 40,),
                                          ),
            
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){
                                                openFullscreenImage(context, image);
                                              },
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ),
                            ],
                          ) 
                          
                          : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColors.silver,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppColors.grey,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    'Фотографии нету',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Ваканции (${place.vacancies.length})',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Icon(
                                HugeIcons.strokeRoundedWork, 
                                color: AppColors.deepPurple,
                              ),
                            ],
                          ),
            
                          SizedBox(height: 10,),
                          place.vacancies.isNotEmpty ? 
                          Column(
                            
                            children: List.generate(place.vacancies.length, (index) {
                              final vacancy = place.vacancies[index];
            
                              return IntrinsicHeight(
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(14)
                                  ),
            
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vacancy.title,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Text(
                                        '${vacancy.salary} 〒',
                                        style: TextStyle(
                                          fontSize: 18
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        vacancy.description,
                                        style: TextStyle(
                                          fontSize: 16
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Почта: ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
            
                                          Text(
                                            vacancy.contacts.email,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                         
                                      Row(
                                        children: [
                                          Text(
                                            'Номер телефона: ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Text(
                                            vacancy.contacts.phone,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )
                          
                          
                          
                          : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColors.silver,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.work_off_rounded,
                                    color: AppColors.grey,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    'Ваканции нету',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final placesData = PlacesData();

  List<AnimatedMarker> _buildPlaceMarkers() {
    return placesData.places.values.map((place) {
      return AnimatedMarker(
        // width: 200,
        // height: 200,
        point: place.location,
        builder: (context, animation) {
          return GestureDetector(
            onTap: () {
              setState(() {
                // При повторном тапе снимаем выбор, иначе выбираем данную метку
                selectedMarkerId =
                    selectedMarkerId == place.id ? null : place.id;
              });

              if (selectedMarkerId == place.id) {
                _showModalBottomSheet(place);
              }
            },
            child: SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  // Маркер всегда находится в нижней части
                  Positioned(
                    top: -10,
                    child: Image.asset(
                      'assets/icons/marker.png',
                      width: 30,
                      color: AppColors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList();
  }

  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body: 
     Stack(
        children: [
          FlutterMap(
            mapController: _animatedMapController.mapController,
            options: MapOptions(
              initialCenter: LatLng(43.238949, 76.889709),
              initialZoom: 13.0,
              maxZoom: 17,
              minZoom: 9,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.cityleans',
              ),
              ValueListenableBuilder(
                valueListenable: markers,
                builder: (_, markerList, __) {
                  return AnimatedMarkerLayer(
                    markers: markerList,
                  );
                },
              ),
            ],
          ),
          // Кнопки зума справа
          Align(
            alignment: Alignment.centerRight,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: zoomIn,
                      padding:
                          const EdgeInsets.all(14),
                      icon: Icon(
                        HugeIcons.strokeRoundedAdd01,
                        color: Colors.white,
                        size: 24,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 15),
                    IconButton(
                      onPressed: zoomOut,
                      padding:
                          const EdgeInsets.all(14),
                      icon: Icon(
                        HugeIcons.strokeRoundedMinusSign,
                        color: Colors.white,
                        size: 24,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Кнопка навигации (поиск местоположения)
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [


                    ValueListenableBuilder(
                      valueListenable: userLocationEnabled,
                      builder: (_,value,__) {
                        return IconButton(
                          onPressed: goToMyLocation,
                          padding:
                              const EdgeInsets.all(14),
                          icon: Image.asset(
                            'assets/icons/navigator.png',
                            width: 24,
                            color: value ? Colors.blue : Colors.white,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black45,
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
