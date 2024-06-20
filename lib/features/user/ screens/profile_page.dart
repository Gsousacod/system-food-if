import '../../../common/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  bool _isBeneficiary = false;

  void _loadUserDataFromApi() {
    // Simulação de dados carregados da API
    final userDataFromApi = {
      'username': 'JohnDoe',
      'email': 'john.doe@example.com',
      'phone': '123456789',
      'course': 'Computer Science',
      'class': 'Class A',
      'isBeneficiary': true,
    };

    // Preencher os controladores com os dados do usuário
    _usernameController.text = userDataFromApi['username'] as String;
    _emailController.text = userDataFromApi['email'] as String;
    _phoneController.text = userDataFromApi['phone'] as String;
    _courseController.text = userDataFromApi['course'] as String;
    _classController.text = userDataFromApi['class'] as String;
    _isBeneficiary = userDataFromApi['isBeneficiary'] as bool;

    // Atualizar a interface
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Carregar os dados do usuário ao inicializar o estado
    _loadUserDataFromApi();
  }

  void _updateProfilePicture() {
    // Lógica para atualizar a foto do perfil
    print('Update profile picture');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primary, // Altera a cor de fundo da AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white, // Altera a cor do background para branco
        ),
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            // Adicionando o CircleAvatar
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1369508766/pt/foto/beautiful-successful-latin-woman-smiling.jpg?s=612x612&w=0&k=20&c=FwKAb3g3-xgzsbyTcgjluJlGS1wBMXMg1hT2sB-gn2A=', // URL da imagem do avatar
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _updateProfilePicture,
                    child: const Text(
                      'Atualizar Foto',
                      style: TextStyle(
                        color: AppColors.primary, // Cor do texto do botão
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0), // Espaço entre o avatar e os campos

            // TextFormFields com estilo personalizado
            _buildTextField(
              controller: _usernameController,
              labelText: 'Nome',
              variableColor: AppColors.grey.withOpacity(0.7),
            ),
            const SizedBox(height: 20.0),

            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
              variableColor: AppColors.grey.withOpacity(0.7),
            ),
            const SizedBox(height: 20.0),

            _buildTextField(
              controller: _phoneController,
              labelText: 'Telefone',
              variableColor: AppColors.grey.withOpacity(0.7),
            ),
            const SizedBox(height: 20.0),

            _buildTextField(
              controller: _courseController,
              labelText: 'Curso',
              variableColor: AppColors.grey.withOpacity(0.7),
            ),
            const SizedBox(height: 20.0),

            _buildTextField(
              controller: _classController,
              labelText: 'Classe',
              variableColor: AppColors.grey.withOpacity(0.7),
            ),
            const SizedBox(height: 20.0),

            // CheckboxListTile para o campo Beneficiary
            CheckboxListTile(
              title: const Text(
                'Bolsista',
                style: TextStyle(
                  color: Colors.black,
                ), // Altera a cor do texto da label
              ),
              value: _isBeneficiary,
              onChanged: (value) {
                setState(() {
                  _isBeneficiary = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Função para construir um TextFied com estilo personalizado
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required Color variableColor,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ), // Altera a cor do texto da label
        filled: true,
        fillColor: Colors.white, // Altera a cor de fundo do campo
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: variableColor,
          ), // Altera a cor da borda quando o campo está em foco
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: variableColor.withOpacity(0.5),
          ), // Altera a cor da borda quando o campo não está em foco
        ),
      ),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ), // Altera a cor do texto dentro do campo
    );
  }

  void _saveUserProfile() {
    // Lógica para salvar as informações do usuário
    final username = _usernameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final course = _courseController.text;
    final classValue = _classController.text;
    final isBeneficiary = _isBeneficiary;

    // Exemplo de como você pode usar esses valores
    print('Username: $username');
    print('Email: $email');
    print('Phone: $phone');
    print('Course: $course');
    print('Class: $classValue');
    print('Beneficiary: $isBeneficiary');
  }
}
