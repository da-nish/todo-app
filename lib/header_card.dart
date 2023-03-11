import 'package:flutter/material.dart';

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
              image: AssetImage("assets/images/header_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width*1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.menu_sharp),
                    const SizedBox(height: 16),
                    Text(
                      "title",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("15 Sept 2022"),
                      ],
                    )),
                    Container(
                      height: 4,
                      width: 200,
                      color: Colors.blue,
                    )
                  ],
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
                        children: const [
                          Text("10"),
                          SizedBox(width: 10),
                          Text("15"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("title"),
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
