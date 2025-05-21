import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/ui/main_screens/map/map_screen.dart'; // Предполагаем, что этот файл существует
import 'package:workwave/ui/main_screens/chat/chat_screen.dart'; // Предполагаем, что этот файл существует
import 'package:workwave/ui/main_screens/vacancies/vacancies_screen.dart'; // Предполагаем, что этот файл существует

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkWave', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: false,
        backgroundColor: AppColors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // TODO: Реализовать переход на экран уведомлений
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Уведомления скоро будут здесь!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Реализовать функцию поиска по всему приложению
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Поиск пока не реализован')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Приветствие и основной призыв
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.deepPurple,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Приветствуем, искатель возможностей!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Найди свою идеальную профессию, курсы или работу с WorkWave.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Переход на экран с вакансиями
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VacanciesScreen()),
                      );
                    },
                    icon: const Icon(Icons.work_outline, color: Colors.deepPurple),
                    label: const Text(
                      'Найти вакансии',
                      style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),

            
            const SizedBox(height: 20),

            // Быстрый доступ к ключевым функциям
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Быстрый доступ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAccessCard(
                        context,
                        icon: Icons.map_outlined,
                        label: 'Карта',
                        onTap: () {
                          context.go(AppRoutes.map);
                        },
                      ),
                      _buildQuickAccessCard(
                        context,
                        icon: Icons.forum_outlined,
                        label: 'ИИ-Ассистент',
                        onTap: () {
                          context.go(AppRoutes.chat);
                        },
                      ),
                      _buildQuickAccessCard(
                        context,
                        icon: Icons.calendar_month_outlined,
                        label: 'Мероприятия',
                        onTap: () {
                          // TODO: Переход на экран мероприятий
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Раздел мероприятий')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Раздел "Истории успеха"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Истории успеха',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  // SizedBox(
                  //   height: 230, // Высота для прокручиваемого списка
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 3, // Пример 3 историй
                  //     itemBuilder: (context, index) {
                  //       return _buildStoryCard(context, index);
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        // TODO: Переход на экран со всеми историями успеха
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Все истории успеха')),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.deepPurple),
                      label: const Text('Все истории', style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Лента мероприятий
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ближайшие мероприятия',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildEventCard(context, 'Фестиваль профессий "Будущее в наших руках"', '25 мая, Алматы', 'Откройте для себя новые возможности!'),
                  const SizedBox(height: 10),
                  _buildEventCard(context, 'Вебинар: "Как выбрать свой путь в IT"', '30 мая, Онлайн', 'Советы от ведущих экспертов.'),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        // TODO: Переход на экран со всеми мероприятиями
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Все мероприятия')),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.deepPurple),
                      label: const Text('Все мероприятия', style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: MediaQuery.of(context).size.width / 3.8,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoryCard(BuildContext context, int index) {
    List<String> titles = [
      'Путь от стажера до ведущего разработчика',
      'Как я открыла свою пекарню после техникума',
      'Успех в робототехнике: история Максима',
    ];
    List<String> images = [
      'https://via.placeholder.com/150/9c27b0/ffffff?text=История+1', // Пример URL изображения
      'https://via.placeholder.com/150/4caf50/ffffff?text=История+2',
      'https://via.placeholder.com/150/ff9800/ffffff?text=История+3',
    ];

    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias, // Для закругления изображения
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              images[index],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                titles[index],
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.play_circle_fill, color: Colors.red.shade600, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, String title, String dateLocation, String description) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.deepPurple.shade700),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 5),
                Text(
                  dateLocation,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade800),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Переход на детальный экран мероприятия
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Подробнее о "$title"')),
                  );
                },
                child: const Text('Подробнее', style: TextStyle(color: Colors.deepPurple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}