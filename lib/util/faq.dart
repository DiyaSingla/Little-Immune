import 'package:flutter/material.dart';

class FrequentlyAsked extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What vaccines are recommended for children?',
      'answer':
          '\n The vaccines recommended for children include: Hepatitis A and B, Rotavirus, Diphtheria, Tetanus, Pertussis, Haemophilus influenza type b, Pneumococcal, Polio, Measles, Mumps, Rubella, Varicella, Influenza, and Meningococcal. \n'
    },
    {
      'question': 'When should my child receive their vaccinations?',
      'answer':
          '\n The recommended vaccination schedule for children is based on their age and certain risk factors. Your pediatrician can provide you with a schedule that is tailored to the needs of your child. \n'
    },
    {
      'question': 'Are vaccines safe for children?',
      'answer':
          '\n Yes, vaccines are generally safe for children. The benefits of vaccination far outweigh the risks. Vaccines undergo extensive testing and clinical trials before they are approved for use, and they are continually monitored for safety. \n'
    },
    {
      'question': 'Can vaccines cause autism?',
      'answer':
          '\n No, there is no scientific evidence to support the claim that vaccines cause autism. This myth has been thoroughly debunked by numerous studies. \n'
    },
    {
      'question': 'Are there any side effects to vaccinations?',
      'answer':
          '\n Most children experience only minor side effects from vaccinations, such as a sore arm or low-grade fever. Serious side effects are rare. \n'
    },
    {
      'question': 'What if my child misses a vaccine dose?',
      'answer':
          '\n If your child misses a vaccine dose, talk to your pediatrician about getting caught up. It is important to follow the recommended vaccination schedule to ensure your child is fully protected. \n'
    },
    {
      'question': 'Can my child still get a disease if they are vaccinated?',
      'answer':
          '\n No vaccine is 100% effective, but vaccination greatly reduces the likelihood of contracting a disease. Even if a vaccinated child does get sick, the illness is likely to be milder than it would be in an unvaccinated child. \n'
    },
    {
      'question': 'Can my child get multiple vaccines at once?',
      'answer':
          '\n Yes, it is safe for children to receive multiple vaccines at once. In fact, the recommended vaccination schedule often includes multiple vaccines during a single visit. \n'
    },
    {
      'question': 'Are there any children who should not be vaccinated?',
      'answer':
          '\n Children with certain medical conditions, such as a weakened immune system, may not be able to receive certain vaccines. Your pediatrician can advise you on which vaccines are safe for your child. \n'
    },
    {
      'question': 'Can vaccines cause allergic reactions?',
      'answer':
          '\n Serious allergic reactions to vaccines are rare, but they can occur. Children who have had a severe allergic reaction to a vaccine in the past should not receive that vaccine again. \n'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 240, 124, 180),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 250, 97, 148),
            title: const Text('Frequently Asked Questions'),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                // Navigate to about screen

                icon: const Icon(Icons.arrow_back))),
        body: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (BuildContext context, int index) {
            final faq = faqs[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Text(
                    faq['question']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        faq['answer']!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
