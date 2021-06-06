import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {

  MyListTile({
    this.methodName,
    this.pageName,
    this.comment,
    this.onTap,
  });

  final String? methodName;
  final String? pageName;
  final String? comment;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          methodName ?? '',
                          style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
                        ),
                        if (methodName != null && pageName != null)
                          Text(' to ', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal)),
                        Text(
                          pageName ?? '',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  if (comment != null)
                    SizedBox(height: 4,),
                  if (comment != null)
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(
                        comment!,
                        style: TextStyle(),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 8,),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
