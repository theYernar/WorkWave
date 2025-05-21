import 'package:latlong2/latlong.dart';
import 'package:workwave/data/vacancies_data.dart';

class PlaceMarker {
  final String id;
  final String name;
  final String type;
  final String address;
  final List<String> imageUrl;
  final LatLng location;

  final List<VacanciesData> vacancies;

  PlaceMarker({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.imageUrl,
    required this.location,

    required this.vacancies,
  });
}

class PlacesData {
  final Map<String, PlaceMarker> places = {
    '1': PlaceMarker(
      id: '1',
      name: 'Almaty Polytechnic College',
      type: '​Колледжи',
      address: 'Тастак-1 м-н. Ауэзовский район',
      imageUrl: [
        'https://i7.photo.2gis.com/photo-gallery/5ce4f158-d4c5-4569-a8bc-6f59df2dac74.jpg',
        'https://i7.photo.2gis.com/photo-gallery/c324fbbb-1ea7-4ebe-88c5-8b04f3533774.jpg',
        'https://i2.photo.2gis.com/images/branch/0/30258560079253228_2b94.jpg',
      ],
      location: LatLng(43.249425, 76.862418),

      vacancies: [
        VacanciesData(
          id: 1,
          title: 'Преподаватель Python',
          salary: 'от 240.000',
          description: '''
📌 Присоединяйтесь к нашей команде!
Мы ищем увлечённого преподавателя Python, который поможет студентам освоить программирование с нуля. Работа в дружелюбной образовательной среде с гибким подходом к обучению.
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01', 
            email: 'polytech@gmail.com'
          ),
          postedDate: DateTime(2025),
        ),
        VacanciesData(
          id: 2,

          title: 'Электромонтажник',
          salary: 'от 240 000',
          description: '''
⚡️ Требуется электромонтажник!
Монтаж и обслуживание электрических сетей колледжа. 
Если умеете прокладывать кабель, читать схемы и строго соблюдать технику безопасности — присоединяйтесь к нашей команде!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01',
            email: 'polytech@gmail.com',
          ),
          postedDate: DateTime(2025),
        ),
      ]

    ),
    '2': PlaceMarker(
      id: '2',
      type: '​Колледжи',
      address: '​Абая проспект, 52г. Бостандыкский район',
      name: 'Инновационный технический колледж',
      imageUrl: [],
      location: LatLng(43.23794, 76.913727),


      vacancies: [
        VacanciesData(
          id: 3,

          title: 'Преподаватель Web Разработки',
          salary: 'от 260.000',
          description: '''
🌐 Ищем преподавателя Web-разработки!
Помогайте студентам осваивать HTML, CSS, JavaScript и современные фреймворки. Если вы умеете объяснять просто и вдохновлять — ждём вас в нашей команде!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01', 
            email: 'itcollege@gmail.com'
          ),
          postedDate: DateTime(2025),
        ),
        VacanciesData(
          id: 4,

          title: 'Сантехник',
          salary: 'от 260 000',
          description: '''
🛠️ Ищем сантехника!
Обслуживание и ремонт систем водоснабжения и отопления колледжа. 
Если у вас «золотые руки» и вы умеете быстро устранять течи — ждём вас!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01',
            email: 'itcollege@gmail.com',
          ),
          postedDate: DateTime(2025),
        ),
        VacanciesData(
          id: 5,

          title: 'Механик-ремонтник оборудования',
          salary: 'от 340 000',
          description: '''
🔧 Нужен механик-ремонтник!
Диагностика, смазка и мелкий ремонт тренажёров и другого спортивного оборудования. 
Любите технику и уверенно держите инструмент? Тогда вы — наш человек!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01',
            email: 'avantgarde@gmail.com',
          ),
          postedDate: DateTime(2025),
        ),
      ],


    ),
    '3': PlaceMarker(
      id: '3',
      name: 'Bahadur',
      type: 'Барбершоп',
      address: '5-й микрорайон, 19Б. Ауэзовский район',
      imageUrl: [
        'https://i2.photo.2gis.com/images/branch/0/30258560109990179_45dc.jpg',
        'https://i3.photo.2gis.com/images/branch/0/30258560101148243_762e.jpg',
        'https://i0.photo.2gis.com/images/branch/0/30258560101148237_20ff.jpg',
        'https://i5.photo.2gis.com/images/branch/0/30258560101148252_9c9a.jpg',
      ],
      location: LatLng(43.229304, 76.864787),

      vacancies: [
        VacanciesData(
          id: 6,

          title: 'Барбер',
          salary: 'от 300.000',
          description: '''
💈 Требуется барбер в современную студию!
Если ты любишь своё дело, владеешь техниками мужских стрижек и умеешь общаться с клиентами — мы ждём тебя в нашей команде!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01', 
            email: 'bahadur@gmail.com'
          ),
          postedDate: DateTime(2025),
        ),
      ]
    ),
    '4': PlaceMarker(
      id: '4',
      name: 'Avantgarde',
      type: 'Фитнес-клуб',
      address: 'Улица Навои, 7. Ауэзовский район',
      imageUrl: [
        'https://i3.photo.2gis.com/photo-gallery/ba76c17e-642e-4122-8e8b-a5af12ee3f93.jpg',
        'https://ams2-cdn.2gis.com/raws/1204665653005385728/691218e3-1454-4d5b-a5c9-7e390253e784/3/ru/',
        'https://i7.photo.2gis.com/photo-gallery/af16a9b6-8021-450e-9f27-afa84c7435e2.jpg',
        'https://i9.photo.2gis.com/images/branch/0/30258560172356375_cfc1.jpg',
      ],
      location: LatLng(43.228752, 76.889695),


      vacancies: [
        VacanciesData(
          id: 7,

          title: 'Фитнес тренер',
          salary: 'от 340.000',
          description: '''
🏋️ В нашу команду нужен фитнес-тренер!
Ищем активного и мотивирующего специалиста, который поможет клиентам достигать своих целей. Если спорт — твоя страсть, мы ждём именно тебя!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01', 
            email: 'avantgarde@gmail.com'
          ),
          postedDate: DateTime(2025),
        ),
      ]

    ),
    '5': PlaceMarker(
      id: '5',
      name: 'okadzaki.kz',
      type: 'Кафе',
      address: '​Абая проспект, 160 к5. Бостандыкский район',
      imageUrl: [
        'https://i1.photo.2gis.com/photo-gallery/fa1a4f42-736a-40f3-9fa3-874452331a5e.jpg',
        'https://i3.photo.2gis.com/photo-gallery/f324f782-af55-4561-8fa9-4e25b206a9c2.jpg',
        'https://i9.photo.2gis.com/photo-gallery/2c6c5eb7-598d-4308-885e-cf0f6266a358.jpg',
      ],
      location: LatLng(43.2374, 76.881857),

      vacancies: [
        VacanciesData(
          id: 8,

          title: 'Сушист',
          salary: 'от 320.000',
          description: '''
🍣 Ищем сушиста в команду okadzaki.kz!
Если ты любишь японскую кухню, умеешь готовить роллы и хочешь работать в дружной команде — мы ждём тебя!
''',
          contacts: ContactData(
            phone: '+7 707 737 01 01', 
            email: 'okadzaki@gmail.com'
          ),
          postedDate: DateTime(2025),
        ),
      ]
    ),
  };
}
