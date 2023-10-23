import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import '../generated/l10n.dart';
import '../modules/settings/cubit.dart';
import '../shared/components/diseases_data.dart';
import '../shared/components/components.dart';
import '../shared/components/consistant.dart';
import '../shared/cubit/states.dart';
import '../shared/style/colors.dart';

class BrainTumorDetection extends StatefulWidget {
  const BrainTumorDetection({super.key});

  @override
  State<BrainTumorDetection> createState() => _BrainTumorDetectionState();
}

class _BrainTumorDetectionState extends State<BrainTumorDetection> {
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
                title: Text(S.of(context).Brain_Tumor_Detection),
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
                          child: builduttomUpload(context, index: 1),
                        ),
                        someInstructionBuilder(context),
                        DataOfDiseases(
                          context,
                          isShowMore: cubit.showMoreMap[0] ?? false,
                          nameDisease: isArabic() ? brainDataAr : brainDataEn,
                          index: 0,
                          icon: cubit.icon,
                          backgroundCol: SettingCubit.get(context).isDark
                              ? color1_Dark
                              : color1,
                          img: 'mcdc7_brain_cancer-8col.jpg',
                          nameTitleOfImg:
                              isArabic() ? 'ورم في المخ' : 'Brain Tumor',
                          contantOfImg: isArabic()
                              ? "يمكن أن يتشكل ورم الدماغ في خلايا الدماغ (كما هو موضح)، أو يمكن أن يبدأ في مكان آخر وينتشر إلى الدماغ. ومع نمو الورم، فإنه يخلق ضغطًا على أنسجة المخ المحيطة ويغير وظيفتها، مما يسبب علامات وأعراض مثل الصداع والغثيان ومشاكل في التوازن."
                              : 'A brain tumor can form in the brain cells (as shown), or it can begin elsewhere and spread to the brain. As the tumor grows, it creates pressure on and changes the function of surrounding brain tissue, which causes signs and symptoms such as headaches, nausea and balance problems.',
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
                            backgroundCol: color2, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[1] ?? false), index: 1);
                        },
                            index: 1,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[2] ?? false,
                            backgroundCol: color3,
                            img: 'ds00266_ds00810_im03440_bn7_lobesthu_jpg.jpg',
                            nameTitleOfImg:
                                isArabic() ? "فصوص الدماغ" : 'Brain lobes',
                            contantOfImg: isArabic()
                                ? "كل جانب من دماغك يحتوي على أربعة فصوص. الفص الجبهي مهم للوظائف المعرفية والتحكم في الحركة أو النشاط التطوعي. يعالج الفص الجداري المعلومات المتعلقة بدرجة الحرارة والذوق واللمس والحركة، في حين أن الفص القذالي مسؤول بشكل أساسي عن الرؤية. يعالج الفص الصدغي الذكريات ويدمجها مع أحاسيس التذوق والصوت والبصر واللمس."
                                : 'Each side of your brain contains four lobes. The frontal lobe is important for cognitive functions and control of voluntary movement or activity. The parietal lobe processes information about temperature, taste, touch and movement, while the occipital lobe is primarily responsible for vision. The temporal lobe processes memories, integrating them with sensations of taste, sound, sight and touch.',
                            onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[2] ?? false), index: 2);
                        },
                            index: 2,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[3] ?? false,
                            backgroundCol: color4, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[3] ?? false), index: 3);
                        },
                            index: 3,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[4] ?? false,
                            backgroundCol: color5, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[4] ?? false), index: 4);
                        },
                            index: 4,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[5] ?? false,
                            backgroundCol: color6, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[5] ?? false), index: 5);
                        },
                            index: 5,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[6] ?? false,
                            backgroundCol: color7, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[6] ?? false), index: 6);
                        },
                            index: 6,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                        SizedBox(
                          height: 20,
                        ),
                        DataOfDiseases(context,
                            icon: cubit.icon,
                            isShowMore: cubit.showMoreMap[7] ?? false,
                            backgroundCol: color8, onPress: () {
                          cubit.showMore(
                              more: !(cubit.showMoreMap[7] ?? false), index: 7);
                        },
                            index: 7,
                            nameDisease:
                                isArabic() ? brainDataAr : brainDataEn),
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
