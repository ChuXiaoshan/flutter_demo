import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogsPageState();
  }
}

class _DialogsPageState extends State<DialogsPage> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () async {
                String result = await _simpleAlertDialog1(context);
                if (result == null) {
                  print("取消");
                } else {
                  print(result);
                }
              },
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert1", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () async {
                int result = await _simpleAlertDialog2(context);
                print(result);
              },
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert2", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () async {
                int result = await _listAlertDialog(context);
                print(result);
              },
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert3", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () async {
                bool delete = await _showDeleteConfirmDialog2(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $delete");
                }
              },
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert4", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> _simpleAlertDialog1(BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除", style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.of(context).pop("文件已删除"),
            ),
          ],
        );
      },
    );
  }

  Future<int> _simpleAlertDialog2(BuildContext context) async {
    return showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            title: const Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('English'),
                ),
              ),
            ],
          );
        });
  }

  Future<int> _listAlertDialog(BuildContext context) {
    return showDialog<int>(
      context: context,
      builder: (context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  }),
            ),
          ],
        );

        var child1 = UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280, maxHeight: 500),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
        return Dialog(child: child);
        // return child1;
      },
    );
  }

  Future<bool> _showDeleteConfirmDialog2(BuildContext context) {
    withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取 消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删 除"),
              onPressed: () => Navigator.of(context).pop(withTree),
            ),
          ],
        );
      },
    );
  }
}
