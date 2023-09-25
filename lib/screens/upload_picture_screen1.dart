import 'package:flutter/material.dart';
import 'package:senior_project/screens/upload_picture_screen2.dart';
import 'package:whatsapp_camera/whatsapp_camera.dart';
import 'dart:io';


class UploadPictureScreen1 extends StatefulWidget {
  const UploadPictureScreen1({Key? key}) : super(key: key);

  @override
  _UploadPictureScreen1State createState() => _UploadPictureScreen1State();
}

class _UploadPictureScreen1State extends State<UploadPictureScreen1>{


final files = ValueNotifier(<File>[]);

  @override
  void initState() {
    files.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    files.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: 
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upload a picture of yourself',
                  style: TextStyle(
                    fontFamily: 'Lobster Two',
                    fontSize: 40,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                
                ) ,
                
                FloatingActionButton(
                  child: const Icon(Icons.camera),
                  onPressed: () async {
                    List<File>? res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WhatsappCamera(),
                      ),
                    );
                  if (res != null) files.value = res;
                  },
                ),

              //display the picture
              Expanded(
                child: ValueListenableBuilder<List<File>>(
                  valueListenable: files,
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Image.file(
                        value[index],
                        //resize the image to fit the screen
                        width: 200,
                        height: 400,
                        fit: BoxFit.cover,
                        );
                      },
                    );
                  },
                ),
              ),

              //button to go to next screen
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UploadPictureScreen2()));

                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
              ]
          ),
        ),
    );
  }
}