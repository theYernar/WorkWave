import 'package:flutter/material.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/data/user_role.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Профиль Студента'),

        // foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Реализовать переход на экран настроек
              print('Настройки студента');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Верхняя часть профиля с аватаром и именем
            Container(
              padding: const EdgeInsets.all(24),
              // color: Colors.blue.shade700,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    // backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 60, color: Colors.blue.shade700),
                    // Можно использовать NetworkImage для аватара пользователя
                    // backgroundImage: NetworkImage('URL_ВАШЕГО_АВАТАРА'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Yernar Almasuly',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Almaty Polytechnic College', // Учебное заведение
                    style: TextStyle(
                      fontSize: 16,
                      // color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ActionChip(
                    label: const Text('Редактировать профиль', style: TextStyle(color: AppColors.deepPurple)),
                    avatar: Icon(Icons.edit, color: Colors.blue.shade700, size: 18),
                    // backgroundColor: Colors.white,
                    onPressed: () {
                      // TODO: Переход на экран редактирования профиля
                      print('Редактирование профиля студента');
                    },
                  ),
                ],
              ),
            ),
            // Основное содержимое профиля
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'Мои Навыки',
                    icon: Icons.lightbulb_outline,
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: const [
                          Chip(label: Text('Flutter')),
                          Chip(label: Text('Dart')),
                          Chip(label: Text('UI/UX Design')),
                          Chip(label: Text('Problem Solving')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.blueAccent),
                          label: const Text('Добавить навык', style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () {
                            print('Добавить навык');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'Мои Отклики',
                    icon: Icons.mail_outline,
                    children: [
                      _buildListItem(context, 'Стажировка в Google', 'Отправлено: 10.05.2024', Icons.check_circle_outline, Colors.green),
                      _buildListItem(context, 'Вакансии Frontend Developer', 'Просмотрено: 08.05.2024', Icons.visibility_outlined, Colors.blue),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blueAccent),
                          label: const Text('Все отклики', style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () {
                            print('Все отклики');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'Рекомендации',
                    icon: Icons.recommend_outlined,
                    children: [
                      _buildListItem(context, 'Курс по Figma', 'Бесплатный', Icons.school_outlined, Colors.orange),
                      _buildListItem(context, 'Вебинар по AI', 'Завтра в 19:00', Icons.event_note_outlined, Colors.purple),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blueAccent),
                          label: const Text('Все рекомендации', style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () {
                            print('Все рекомендации');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        
                        currentUserRole.value = UserRole.employer;

                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        side: const BorderSide(color: Colors.redAccent),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text('Выйти из аккаунта'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, {required String title, required IconData icon, required List<Widget> children}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue.shade700, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String subtitle, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}