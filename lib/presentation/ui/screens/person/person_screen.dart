import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 13, 14),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _BodyProfile(),
        ),
      ),
    );
  }
}

class _BodyProfile extends StatelessWidget {
  const _BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _BackgroundImageProfile(),
        _ButtonsProfile(),
        _CustomGradientProfile(),
        _ContentProfile(),
      ],
    );
  }
}

class _BackgroundImageProfile extends StatelessWidget {
  const _BackgroundImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 274,
          child: Image(
            image: AssetImage('assets/image_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _ButtonsProfile extends StatelessWidget {
  const _ButtonsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  registerProvider.resetForms();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                  );
                },
                child: const CustomIcon(icon: Icons.logout),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomGradientProfile extends StatelessWidget {
  const _CustomGradientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 13, 13, 14).withOpacity(0),
              const Color.fromARGB(255, 13, 13, 14),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
      ),
    );
  }
}

class _ContentProfile extends StatelessWidget {
  const _ContentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ImageProfile(),
        _DescriptionProfile(),
      ],
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 54),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _DescriptionProfile extends StatelessWidget {
  const _DescriptionProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Center(
        child: Column(
          children: [
            Text(
              "${registerProvider.name} ${registerProvider.lastName}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 42),
            const InfoPersonItems(),
          ],
        ),
      ),
    );
  }
}

class InfoPersonItems extends StatelessWidget {
  const InfoPersonItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Información Personal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 2),
            ],
          ),
        ),
        InfoPerson(
          person: Person(
            registerProvider.name,
            registerProvider.lastName,
            registerProvider.birthDate,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Text(
            'Direcciones',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const ContentAddresses(),
      ],
    );
  }
}

class InfoPerson extends StatelessWidget {
  const InfoPerson({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemPerson(title: 'Nombre', description: person.name),
          const SizedBox(height: 24),
          ItemPerson(title: 'Apellido', description: person.lastName),
          const SizedBox(height: 24),
          ItemPerson(
              title: 'Fecha de Nacimiento', description: person.birthDate),
        ],
      ),
    );
  }
}

class ItemPerson extends StatelessWidget {
  const ItemPerson({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: "$title: ",
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: description,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContentAddresses extends StatelessWidget {
  const ContentAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: registerForm.addresses.length,
            itemBuilder: (context, index) => AddressInfoItem(
              address: registerForm.addresses[index],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressInfoItem extends StatelessWidget {
  const AddressInfoItem({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(address.place,
              style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          AutoSizeText(address.address,
              maxLines: 1,
              style: const TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(width: 2),
        ],
      ),
    );
  }
}
