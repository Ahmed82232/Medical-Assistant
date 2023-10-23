import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import '../generated/l10n.dart';
import '../shared/components/components.dart';
import '../shared/components/consistant.dart';
import '../shared/components/diseases_data.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../shared/style/colors.dart';

class AlzheimerDetection extends StatefulWidget {
  const AlzheimerDetection({super.key});

  @override
  State<AlzheimerDetection> createState() => _AlzheimerDetectionState();
}

class _AlzheimerDetectionState extends State<AlzheimerDetection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).Alzheimer_Detection),
                centerTitle: true,
                backgroundColor: SettingCubit.get(context).isDark
                    ? appBarDarkColor
                    : colorAppBarDiseasesScreens,
                elevation: 5,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: builduttomUpload(context, index: 2),
                        ),
                        someInstructionBuilder(context),
                        DataOfDiseases(
                          context,
                          isShowMore: cubit.showMoreMap[0] ?? false,
                          nameDisease:
                              isArabic() ? alzheimerDataAr : alzheimerDataEn,
                          index: 0,
                          icon: cubit.icon,
                          backgroundCol: SettingCubit.get(context).isDark
                              ? color1_Dark
                              : color1,
                          onPress: () {
                            cubit.showMore(
                                more: !(cubit.showMoreMap[0] ?? false),
                                index: 0);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[1] ?? false,
                            backgroundCol: color5, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[1] ?? false), index: 1);
                        },
                            index: 1,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[2] ?? false,
                            backgroundCol: color4, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[2] ?? false), index: 2);
                        },
                            index: 2,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[3] ?? false,
                            backgroundCol: color6, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[3] ?? false), index: 3);
                        },
                            index: 3,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[4] ?? false,
                            backgroundCol: color3, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[4] ?? false), index: 4);
                        },
                            index: 4,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[5] ?? false,
                            backgroundCol: color7, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[5] ?? false), index: 5);
                        },
                            index: 5,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[6] ?? false,
                            backgroundCol: color8, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[6] ?? false), index: 6);
                        },
                            index: 6,
                            nameDisease:
                                isArabic() ? alzheimerDataAr : alzheimerDataEn),
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
