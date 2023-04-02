import 'package:flutter/material.dart';

class FrequentlyAsked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 226, 165, 186),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('Frequently Asked Questions'),
          // actions: [
          //   IconButton(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       onPressed: () {},
          //       icon: Icon(Icons.settings))
          // ],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              // Navigate to about screen

              icon: Icon(Icons.arrow_back))),
      body: ListView(
        children: const <Widget>[
          ExpansionTile(
            title: Text('1. What vaccines are recommended for children?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n The vaccines recommended for children include: Hepatitis A and B, Rotavirus, Diphtheria, Tetanus, Pertussis, Haemophilus influenza type b, Pneumococcal, Polio, Measles, Mumps, Rubella, Varicella, Influenza, and Meningococcal. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('2. When should my child receive their vaccinations?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n The recommended vaccination schedule for children is based on their age and certain risk factors. Your pediatrician can provide you with a schedule that is tailored to the needs of your child. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('3. Are vaccines safe for children?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n Yes, vaccines are generally safe for children. The benefits of vaccination far outweigh the risks. Vaccines undergo extensive testing and clinical trials before they are approved for use, and they are continually monitored for safety. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('4. Can vaccines cause autism?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n No, there is no scientific evidence to support the claim that vaccines cause autism. This myth has been thoroughly debunked by numerous studies. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('5. Are there any side effects to vaccinations?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n Most children experience only minor side effects from vaccinations, such as a sore arm or low-grade fever. Serious side effects are rare. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('6. What if my child misses a vaccine dose?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n If your child misses a vaccine dose, talk to your pediatrician about getting caught up. It is important to follow the recommended vaccination schedule to ensure your child is fully protected. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
                '7. Can my child still get a disease if they are vaccinated?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n No vaccine is 100% effective, but vaccination greatly reduces the likelihood of contracting a disease. Even if a vaccinated child does get sick, the illness is likely to be milder than it would be in an unvaccinated child. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('8. Can my child get multiple vaccines at once?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n Yes, it is safe for children to receive multiple vaccines at once. In fact, the recommended vaccination schedule often includes multiple vaccines during a single visit. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title:
                Text('9. Are there any children who should not be vaccinated?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n Children with certain medical conditions, such as a weakened immune system, may not be able to receive certain vaccines. Your pediatrician can advise you on which vaccines are safe for your child. \n'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('10. Can vaccines cause allergic reactions?'),
            children: <Widget>[
              ListTile(
                title: Text(
                    '\n Serious allergic reactions to vaccines are rare, but they can occur. Children who have had a severe allergic reaction to a vaccine in the past should not receive that vaccine again. \n'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
