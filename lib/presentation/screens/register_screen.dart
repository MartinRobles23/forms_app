import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 24),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
              label: 'Nombre del usuario',
              onChanged: registerCubit.usernameChanged,
              errorMessage: username.errorMessage),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 16),
          FilledButton.tonalIcon(
            onPressed: () => registerCubit.onSubmit(),
            icon: const Icon(Icons.save_rounded),
            label: const Text('Guardar usuario'),
          )
        ],
      ),
    );
  }
}
