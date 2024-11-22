import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/homepage_bloc/homepage_bloc.dart' as homepage_bloc;
import 'package:local_events/blocs/homepage_bloc/homepage_event.dart' as homepage_event;
import 'package:local_events/blocs/homepage_bloc/homepage_state.dart' as homepage_state;
import 'package:local_events/model/category.dart';
import 'package:local_events/styleguide.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<homepage_bloc.HomePageBloc, bool>((bloc) {
      final state = bloc.state;
      return state is homepage_state.HomePageLoaded && state.selectedCategoryId == category.id; // This should work now
    });

    return GestureDetector(
      onTap: () {
        // Create and dispatch the event without casting
        context.read<homepage_bloc.HomePageBloc>().add(
          homepage_event.LoadEventsForCategory(isSelected ? null : category.id),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : const Color(0x99FFFFFF),
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              style: isSelected ? selectedTextStyle : categoryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
