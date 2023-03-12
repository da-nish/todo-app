import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/core/utils/date_extension.dart';
import 'package:todoapp/core/values/app_assets.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // width: double.infinity,
      // color: Colors.red,
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.headerBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width*1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: SvgPicture.asset(
                            AppAssets.menuIcon,
                            height: 28,
                            color: AppColors.white,
                          )),
                      const SizedBox(height: 16),
                      Text(
                        "Your\nThings",
                        style: AppTextStyle.h1Regular(color: AppColors.white),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.now().dateFormat(),
                            style: AppTextStyle.h6Regular(
                                color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: Dimens.grid4)
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  width: MediaQuery.of(context).size.width * .4,
                  color: Colors.black.withAlpha(60),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.center,

                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "10",
                                style: AppTextStyle.h2Regular(
                                    color: AppColors.white),
                              ),
                              Text(
                                "Personal",
                                style: AppTextStyle.h6Regular(
                                    color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "16",
                                style: AppTextStyle.h2Regular(
                                    color: AppColors.grey2),
                              ),
                              Text(
                                "Business",
                                style: AppTextStyle.h6Regular(
                                    color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.circle_outlined,
                                  size: 16, color: AppColors.textSecondary),
                              const SizedBox(width: 4),
                              Text(
                                "65% done",
                                style: AppTextStyle.h6Regular(
                                    color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8)
                        ],
                      )

                      // Spacer(),
                      // Expanded(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       const Text("title"),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
