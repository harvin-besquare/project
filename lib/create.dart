// ignore_for_file: file_names, prefer_const_constructors, avoid_print, no_logic_in_create_state, annotate_overrides
import 'package:final_project/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key, required this.channel}) : super(key: key);
  final WebSocketChannel channel;

  State<StatefulWidget> createState() {
    return _CreatePost(channel);
  }
}

class _CreatePost extends State<CreatePost> {
  _CreatePost(this.channel);
  WebSocketChannel channel;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController image = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, String>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Post'),
            ),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                      Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        labelText: 'Enter a title for your post',
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      controller: description,
                      decoration: const InputDecoration(
                        labelText: 'Provide description for your post',
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Image URL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      controller: image,
                      decoration: const InputDecoration(
                        labelText: 'Paste Image URL for your post',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MainCubit>()
                          .createPost(title.text, description.text, image.text);
                      Navigator.pop(context);
                    },
                    child: Text('Create Post'),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
