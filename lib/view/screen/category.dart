import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/shared/colors.dart';
import 'package:project_bills/core/shared/text_styles.dart';
import 'package:project_bills/core/widget/loading_in_dicator.dart';

import '../../controller/category_controller/category_cubit.dart';
import 'category_view.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text('ابرز الفئات', style: TextStyles.font22mainColorW600),
              SizedBox(height: 10),
              Expanded(
                child: context.read<CategoryCubit>().categoriesList == null
                    ? Center(
                        child: LoadingIndicator(
                          color: ProjectColors.mainColor,
                          size: 40,
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.3 / 2),
                        itemBuilder: (context, index) => Card(
                              color: ProjectColors.whiteColor,
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryView()));
                                },
                                child: Container(
                                  // height: 400,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              'assets/images/logo.png'),
                                          height: 70,
                                          width: 70),
                                      Text('${context.read<CategoryCubit>().categoriesList!.data[index].categoryName}',
                                          style:
                                              TextStyles.font16mainColorBold),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        itemCount: context
                            .read<CategoryCubit>()
                            .categoriesList!
                            .data
                            .length),
              )
            ],
          ),
        );
      },
    );
  }
}
