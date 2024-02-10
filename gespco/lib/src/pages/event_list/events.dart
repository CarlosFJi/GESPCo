import 'package:flutter/material.dart';
import 'package:gespco/src/pages/event_list/events_controller.dart';
import 'package:gespco/src/services/readJson/readJson.dart';
import 'package:gespco/src/services/storage/firestore_.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _State();
}

class _State extends State<EventPage> {
  bool activated = false;

  List<DataEvent> _dataToDisplay = [];
  List<dynamic> listEvent = [];
  final controller = ControllerEvents();
  final readJson = readingJson();
  final List<DataEvent> _eventListDummy = <DataEvent>[
    /*
    DataEvent(context: Context(description: "des", title: "Title", id: "ev00")),
    DataEvent(
        context: Context(description: "des1", title: "Title1", id: "ev01")),
    DataEvent(
        context: Context(description: "des2", title: "Title2", id: "ev02"))
        */
  ];

  List<dynamic> getEvents() {
    readingJson().readCounter();
    controller.readEventsJson().then((v) => {
          setState(() {
            listEvent = v["data"];
          })
        });
    return listEvent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Firebase Firestore"))),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        _dataToDisplay =
                            await Firestore.getEvents("events_managed");
                        final events = getEvents();
                        _eventListDummy.add(
                            DataEvent(context: Context.fromMap(events[0])));
                        print("EVENTS: $_dataToDisplay");
                        print("EVENTS2: $events");

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
                height: 10,
                child: listEvent.isEmpty
                    ? const Text("Please click below button to get the data")
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(listEvent.length, (index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                listEvent[index]["title"].toString();
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
              (activated)
                  ? const Text("No data")
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _dataToDisplay.length,
                          itemBuilder: (ctx, index) {
                            return Text(_dataToDisplay[index].toString());
                          }))
            ])));
  }
}
