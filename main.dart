import "package:flutter/material.dart";
void main()=>runApp(Myapp());
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: "Swipe DEmo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> data=["aa","bb","cc","dd","ee","ff","gg","hh","ii","jj"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SWIPE DEMO"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
            String item=data[i];
            return Dismissible(
              key: Key(item),
              onDismissed: (DismissDirection dir){
                setState(()=>this.data.removeAt(i));
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Text(dir==DismissDirection.startToEnd?"Item removed":"Item Liked"),
                    action: SnackBarAction(
                        label: "UNDO",
                        onPressed: (){
                          setState(()=>this.data.insert(i, item));
                        }
                    ),
                  ),
                );

              },
              background: Container(
                child: Icon(Icons.delete),
                color: Colors.red,
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: Container(
                child: Icon(Icons.thumb_up),
                color: Colors.green,
                alignment: Alignment.centerRight,
              ),
              child: ListTile(
                title: Text("${data[i]}"),
              ),
            );
          }
      ),
    );
  }
}
