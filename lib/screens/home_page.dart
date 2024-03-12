import 'package:flutter/material.dart';
import 'package:task/src/home_page_controller.dart';
class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Task Manager", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body:ListView.builder(
            itemCount: controller.taskList.length,
            itemBuilder:(ctx, index){

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: InkWell(
              onLongPress:(){
                 setState(() {
                   controller.markComplete(index);
                 });
                },
              child: ExpansionTile(
                  title: Row(
                    children: [
                      Text(controller.taskList[index].taskName,
                        style: const TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(width: 30,),
                      controller.taskList[index].isComplete?
                      const Icon(Icons.one_k)

                          :const SizedBox.shrink()
                    ],
                  ),
                leading:const Icon(Icons.menu),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.taskList[index].taskDetails,
                      style: const TextStyle(fontSize: 16,),
                      textAlign: TextAlign.start,
                    ),
                  ),



                ],

              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(context: context, builder: (ctx){
            return   AlertDialog(
            title: const Text("Add new task"),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                      TextField(
                        controller: controller.taskTitleController,
                        decoration: const InputDecoration(
                          label: Text("title", style: TextStyle(fontSize: 20),),
                          hintText: 'Type your task title'
                        ),
                      ),
                      TextField(
                        controller: controller.taskDetailsController,
                        decoration: const InputDecoration(
                            label: Text("Task details", style: TextStyle(fontSize: 16),),
                            hintText: 'Type your task title'
                        ),
                      ),
                ],

              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                   controller.addNewTask();
                  });
                  Navigator.pop(context);

                },
                    child: const Text('Add new Task')),


              ],

            );

          });


        },
          backgroundColor: Colors.purple.shade700,
          child: const Icon(Icons.add, color: Colors.white, size: 25,),


        ),
      ),
    );
  }
}
