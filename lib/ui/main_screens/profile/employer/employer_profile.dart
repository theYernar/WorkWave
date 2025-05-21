import 'package:flutter/material.dart';
import 'package:workwave/data/user_role.dart';

class EmployerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Профиль Работодателя'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Реализовать переход на экран настроек
              print('Настройки работодателя');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Верхняя часть профиля с логотипом и названием компании
            Container(
              padding: const EdgeInsets.all(24),
              // color: Colors.green.shade700,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    // backgroundColor: Colors.white,
                    child: Icon(Icons.business_center, size: 60, color: Colors.green.shade700),
                    // Можно использовать NetworkImage для логотипа компании
                    // backgroundImage: NetworkImage('URL_ВАШЕГО_ЛОГОТИПА'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'ТОО "Инновационные Решения"', // Название компании
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                  const Text(
                    'Алматы, Казахстан', // Местоположение
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ActionChip(
                    label: const Text('Редактировать профиль', style: TextStyle(color: Colors.green)),
                    avatar: Icon(Icons.edit, color: Colors.green.shade700, size: 18),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      // TODO: Переход на экран редактирования профиля
                      print('Редактирование профиля работодателя');
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
                    title: 'Мои Вакансии',
                    icon: Icons.work_outline,
                    children: [
                      _buildListItem(context, 'Junior Flutter Developer', '5 откликов', Icons.people_outline, Colors.orange),
                      _buildListItem(context, 'UI/UX Designer (стажировка)', 'Активна', Icons.visibility_outlined, Colors.green),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.greenAccent),
                          label: const Text('Создать вакансию', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {
                            print('Создать вакансию');
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.greenAccent),
                          label: const Text('Все вакансии', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {
                            print('Все вакансии');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildProfileSection(
                    context,
                    title: 'Новые Отклики',
                    icon: Icons.inbox_outlined,
                    children: [
                      _buildListItem(context, 'Петров А.В. (Flutter Developer)', '2 часа назад', Icons.person_add_alt_1_outlined, Colors.purple),
                      _buildListItem(context, 'Иванова Е.С. (UI/UX Designer)', 'Вчера', Icons.person_add_alt_1_outlined, Colors.purple),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.greenAccent),
                          label: const Text('Все отклики', style: TextStyle(color: Colors.greenAccent)),
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
                    title: 'Сообщения',
                    icon: Icons.message_outlined,
                    children: [
                      _buildListItem(context, 'Студент: Анна Смирнова', 'По поводу вакансии...', Icons.chat_bubble_outline, Colors.blue),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.greenAccent),
                          label: const Text('Все сообщения', style: TextStyle(color: Colors.greenAccent)),
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
                        print('Выход из аккаунта работодателя');


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
                Icon(icon, color: Colors.green.shade700, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
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