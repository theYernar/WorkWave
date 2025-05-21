import 'package:flutter/material.dart';
import 'package:workwave/data/user_role.dart';

class InstitutionProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Профиль Учебного Заведения'),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Реализовать переход на экран настроек
              print('Настройки учебного заведения');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Верхняя часть профиля с логотипом и названием заведения
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.purple.shade700,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 60, color: Colors.purple.shade700),
                    // Можно использовать NetworkImage для логотипа заведения
                    // backgroundImage: NetworkImage('URL_ВАШЕГО_ЛОГОТИПА'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Казахский Национальный Университет', // Название учебного заведения
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Алматы, Казахстан', // Местоположение
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ActionChip(
                    label: const Text('Редактировать профиль', style: TextStyle(color: Colors.purple)),
                    avatar: Icon(Icons.edit, color: Colors.purple.shade700, size: 18),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      // TODO: Переход на экран редактирования профиля
                      print('Редактирование профиля учебного заведения');
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
                    title: 'Мои Программы',
                    icon: Icons.library_books_outlined,
                    children: [
                      _buildListItem(context, 'Бакалавриат по IT', 'Активна', Icons.check_circle_outline, Colors.green),
                      _buildListItem(context, 'Магистратура по Data Science', 'Новый набор', Icons.add_circle_outline, Colors.blue),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.purpleAccent),
                          label: const Text('Добавить программу', style: TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                            print('Добавить программу');
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.purpleAccent),
                          label: const Text('Все программы', style: TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                            print('Все программы');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'События и Новости',
                    icon: Icons.event_note_outlined,
                    children: [
                      _buildListItem(context, 'День открытых дверей', '25 мая 2024', Icons.calendar_today_outlined, Colors.orange),
                      _buildListItem(context, 'Конференция по ИИ', '10 июня 2024', Icons.mic_none_outlined, Colors.red),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.purpleAccent),
                          label: const Text('Добавить событие', style: TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                            print('Добавить событие');
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.purpleAccent),
                          label: const Text('Все события', style: TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                            print('Все события');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'Взаимодействие',
                    icon: Icons.forum_outlined,
                    children: [
                      _buildListItem(context, 'Вопросы от студентов', '3 новых вопроса', Icons.youtube_searched_for, Colors.blue),
                      _buildListItem(context, 'Запросы от работодателей', '1 новый запрос', Icons.business_center_outlined, Colors.teal),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.purpleAccent),
                          label: const Text('Все сообщения', style: TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                            print('Все сообщения');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Реализовать выход из аккаунта
                        print('Выход из аккаунта учебного заведения');


                        currentUserRole.value = UserRole.institution;
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
                Icon(icon, color: Colors.purple.shade700, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
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