import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFBFCFC),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/details.png'),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/gridiant.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'اليوم العالمي للغة بريل',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'SukarBold'),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                child:
                                    Image.asset('assets/images/shareIcon.png'),
                                onTap: () {},
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/calender.png'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'مارس - 20 مارس',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff707070),
                                fontFamily: 'SukarBold'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
              child: Text(
                'يحتفل بيوم حقوق الإنسان في 10 كانون الأول/ديسمبر من كل عام. ويرمز هذا اليوم لليوم الذي اعتمدت فيه الجمعية العامة في عام 1948 الإعلان العالمي لحقوق الإنسان. وفي هذا العام، ينظم يوم حقوق الإنسان حملة تستمر عاما كاملا للاحتفال بالذكرى السنوية السبعين المقبلة للإعلان العالمي لحقوق الإنسان، وهي وثيقة تاريخية أعلنت حقوقا غير قابلة للتصرف حيث يحق لكل شخص أن يتمتع بها كإنسان - بغض النظر عن العرق أو اللون أو الدين أو الجنس أو اللغة أو الرأي السياسي أو غيره أو الأصل القومي أو الاجتماعي أو الثروة أو المولد أو أي وضع آخر. وهي الوثيقة الأكثر ترجمة في العالم، وهي متاحة بأكثر من 500 لغة',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff707070),
                  fontFamily: 'cairoRegular',
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 34,
                width: 140,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Color(0xff116B7B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/site.png'),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'زيارة الموقع',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'SukarRegular'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
