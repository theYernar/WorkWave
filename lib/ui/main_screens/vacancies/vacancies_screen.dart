import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/data/places_data.dart';

class VacanciesScreen extends StatelessWidget {
  const VacanciesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final placesData = PlacesData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Вакансии'
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children:  placesData.places.values.map((place) {
              return place.vacancies.isNotEmpty ? 
                Column(
                  children: List.generate(place.vacancies.length, (index) {
                    final vacancy = place.vacancies[index];
          
                    return IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(14)
                        ),

                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 15),
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
                                Icon(HugeIcons.strokeRoundedLocation01, color: AppColors.deepPurple,),
                                const SizedBox(width: 8,),
                                Expanded(
                                  child: Text(
                                    place.address,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14,),
                            Row(
                              children: [
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.deepPurple,
                                        borderRadius: BorderRadius.circular(14)
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 13),
                                              child: Text(
                                                'Откликнуться',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){},
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  )
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.deepPurple),
                                        borderRadius: BorderRadius.circular(14)
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 14),
                                              child: Text(
                                                'Показать на карте',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.deepPurple
                                                ),
                                              ),
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){
                                          
                                                context.go(AppRoutes.map, extra: place);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  )
                                ),
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
                );
            }).toList()
          ),
        ),
      )
    );
  }
}