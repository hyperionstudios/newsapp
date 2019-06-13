import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController messageController;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ( isLoading ) ? _loading() : _contactForm() ,
      ),
    );
  }

  Widget _contactForm(){
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter your Name!';
                } else {
                  return null;
                }
              },
            ),
            SizedBox( height: 24, ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Your Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter your Email!';
                } else {
                  return null;
                }
              },
            ),
            SizedBox( height: 24, ),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Message',
              ),
              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please write your message!';
                } else {
                  return null;
                }
              },
            ),
            SizedBox( height: 24, ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'SEND MESSAGE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if( _formKey.currentState.validate() ){
                    // TODO: Loading, Send message

                    String name = nameController.text;
                    String email = emailController.text;
                    String message = messageController.text;

                    setState(() {
                      isLoading = true;
                    });
                  }else{
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            ),
          ],
        ));
  }

  Widget _loading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
