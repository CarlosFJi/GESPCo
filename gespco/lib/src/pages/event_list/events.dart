
import 'package:flutter/material.dart';
import 'package:gespco/src/pages/event_list/event_info.dart';
import 'package:gespco/src/pages/event_list/event_list.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:animated_card/animated_card.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _State();
}

class _State extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: ThemeColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: EventInfoWidget(key: UniqueKey()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Eventos", style: FontStyles.titleBoldHeading),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: ThemeColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: EventList(key: UniqueKey()),
          ),
        ],
      ),
    );
  }
}
    /*
    Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Eventos")),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).popAndPushNamed("/home"),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        /*
                                await Firestore.addOrUpdateWithId(
                            "events_managed", "0", _eventListDummy[0].toMap());
                        await Firestore.addOrUpdateWithId(
                            "events_managed", "1", _eventListDummy[1].toMap());

                        _dataToDisplay = await Firestore.getAllEntries("cars");
                        setState(() {});

  
                        */
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Dummy data added!")));
                        }
                      },
                      icon: Icon(Icons.add,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        activated = !activated;
                        /*
                        await Firestore.deleteEntry("cars", "4");
                        await Firestore.deleteEntry("cars", "3");
                        await Firestore.deleteEntry("cars", "2");
                        await Firestore.deleteEntry("cars", "1");
                        await Firestore.deleteEntry("cars", "0");

                        _dataToDisplay = await Firestore.getAllEntries("cars");
                        setState(() {});

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("All data deleted!")));
                        }
                        */
                      },
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        // _dataToDisplay =
                        //  await Firestore.getAllEntriesSortedByName("cars");
                        setState(() {});

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Data sorted by name")));
                        }
                      },
                      icon: Icon(Icons.sort_by_alpha,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        /*
                        _dataToDisplay =
                            await Firestore.getAllEntriesFilteredByPrice(
                                "cars");
                                */
                        setState(() {});

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:
                                      Text("Data filtered by price > 60000")));
                        }
                      },
                      icon: Icon(Icons.filter_alt,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ]),
              Container(
                height: 50,
                child: listEvent.isEmpty
                    ? const Text("Please click below button to get the data")
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(listEvent.length, (index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                print(
                                    "HI: ${listEvent[index]["title"].toString()}");
                              },
                              title: Text(listEvent[index]["title"].toString()),
                              subtitle: Text(
                                  listEvent[index]["descripcion"].toString()),
                            ),
                          );
                        }),
                      ),
              ),
              //(_dataToDisplay.isEmpty)
              (listEvent.isEmpty)
                  ? const Text("No data")
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _dataToDisplay.length,
                          itemBuilder: (ctx, index) {
                            return Text(_dataToDisplay[index].toString());
                          }))
            ])));
  }
  */

