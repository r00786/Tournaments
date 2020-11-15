import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:marquee_widget/marquee_widget.dart';
import 'package:tournaments/screens/tournaments/tournaments_bloc.dart';
import 'package:tournaments/screens/tournaments/tournaments_state.dart';

///Tournaments Widget
class TournamentsWidget extends StatefulWidget {
  @override
  TournamentsWidgetState createState() {
    return TournamentsWidgetState();
  }
}

///State for Tournaments Widget
class TournamentsWidgetState extends State<TournamentsWidget> {
  ///Scroll Controller for the tournaments list
  final _scrollController = ScrollController();

  ///tournaments bloc injection
  final _tournamentsBloc = kiwi.Container().resolve<TournamentsBloc>();

  ///this is boolean to check if the content of the list is loading or not
  bool _loadingResults = false;

  @override
  void initState() {
    super.initState();

    ///Setting the orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    ///Getting the first chunk of tournaments list
    _tournamentsBloc.getTournaments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/images/menu.png',
              height: 25,
              width: 25,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                "flying_wolf".tr(),
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CachedNetworkImage(
                  imageUrl: 'https://i.imgur.com/BoN9kdC.png',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                      width: 100,
                      height: 100,
                      child: Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Container(
                      width: 100,
                      height: 100,
                      child: Center(child: Icon(Icons.error))),
                ),
              ),
              Column(
                children: [
                  Text(
                    "name".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 8, right: 30, bottom: 8),
                        child: Row(
                          children: [
                            Text(
                              "score".tr(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "rating".tr(),
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 35, bottom: 35),
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      gradient: new LinearGradient(
                          colors: [
                            const Color(0xFFE68303),
                            const Color(0xFFECA502),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "34".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Marquee(
                        child: Text(
                          "tournaments_played".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 1, right: 1),
                  padding: EdgeInsets.only(top: 35, bottom: 35),
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      gradient: new LinearGradient(
                          colors: [
                            const Color(0xFF4E299B),
                            const Color(0xFFA053BC),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "09".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Marquee(
                        child: Text(
                          "tournaments_won".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 35, bottom: 35),
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      gradient: new LinearGradient(
                          colors: [
                            const Color(0xFFEC5646),
                            const Color(0xFFEF7B4F),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "26_percent".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Marquee(
                        child: Text(
                          "winning_percent".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "recommended".tr(),
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            ///Bloc builder to receive events from the bloc
            child: BlocBuilder(
                bloc: _tournamentsBloc,
                builder: (context, TournamentsState data) {
                  if (data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  ///When this event is fired the data is been fetched and successfully received due to that we make loading results false
                  _loadingResults = false;
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          return _handleScrollNotification(
                              scrollNotification, data.isLastPage);
                        },
                        child: ListView.separated(
                            itemCount: calculateListItemsSize(
                                data.items, data.isLastPage),
                            controller: _scrollController,
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                            itemBuilder: (context, index) {
                              if (index == data.items.length) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: CachedNetworkImage(
                                              fit: BoxFit.contain,
                                              imageUrl:
                                                  data.items[index].coverUrl,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      new BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            14.0),
                                                    topRight:
                                                        const Radius.circular(
                                                            14.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 80.0,
                                                      child: Center(
                                                          child:
                                                              CircularProgressIndicator())),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Container(
                                                      height: 80.0,
                                                      child: Center(
                                                          child: Icon(
                                                              Icons.error))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                data.items[index].prizes,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  bottom: 16.0,
                                                  right: 8.0),
                                              child: Text(
                                                data.items[index].name,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  );
                }),
          )
        ],
      ),
    );
  }

  ///method which returns extra index if more items are to be fetched from the server
  ///and if the last item is reached than the size of the items is returned
  calculateListItemsSize(items, isLastPage) {
    if (items.isEmpty) {
      return 0;
    }
    return isLastPage ? items.length : items.length + 1;
  }

  ///fetching more items if we have reached the end of the scroll
  bool _handleScrollNotification(ScrollNotification notification, isLastPage) {
    if (!_loadingResults && !isLastPage) {
      if (notification is ScrollEndNotification &&
          _scrollController.position.extentAfter == 0) {
        _loadingResults = true;
        _tournamentsBloc.getTournaments();
      }

      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
