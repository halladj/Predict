import "package:flutter/material.dart";

class Signin extends StatelessWidget {
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 60, left: 20, right: 20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(fontSize: 35.0),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Must Not Be Embty';
                  }
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                    label: Text('Email')),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Must Not Be Embty';
                  }
                },
                controller: passwordController,
                onFieldSubmitted: (value) {
                  if (formkey.currentState!.validate()) {}
                },
                keyboardType: TextInputType.visiblePassword,
                //obscureText: Cupit.get(context).ishidden,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.piano), onPressed: () {}),
                    prefixIcon: const Icon(Icons.password_outlined),
                    border: const OutlineInputBorder(),
                    label: const Text('Password')),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Text('Forgot Password?'),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/profile_user");
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text('SIGN UP')))
            ],
          ),
        ),
      ),
    );
  }
}

