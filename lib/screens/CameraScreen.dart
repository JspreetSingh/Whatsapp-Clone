import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/screens/Cameraview.dart';


late  List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
   CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
   late CameraController _cameraController;

  late Future<void> cameraValue;
  @override
  void initState()
  {
    super.initState();
    _cameraController=CameraController(cameras[0], ResolutionPreset.high);
    cameraValue=_cameraController.initialize();
  }

  void disposse()
  {
    _cameraController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.done)
                  return CameraPreview(_cameraController);
                else
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
    }),

          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(bottom: 5,top: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      IconButton(onPressed: (){}, icon:Icon(Icons.flash_off,size: 28,color: Colors.white)),
                      InkWell(onTap: (){takephoto(context);},
                      child: Icon(Icons.panorama_fish_eye,size: 70,color: Colors.white,),
                      ),
                      IconButton(onPressed: (){}, icon:Icon(Icons.flip_camera_android,size: 28,color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hold for video, tap for photo",style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void takephoto(BuildContext context)
  async{
      //final path=join((await getTemporaryDirectory()).path, '${DateTime.now()}.png',);
    await _cameraController.setFlashMode(FlashMode.off);
    final image=await _cameraController.takePicture();

    Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraView(path: image.path)));
  }
}
