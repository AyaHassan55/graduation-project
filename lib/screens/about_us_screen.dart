import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('about Us',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/girl_love.svg'),
                const SizedBox(height: 22,),

                RichText(text:const TextSpan(
                  text: 'Welcome to Distractless !\n',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:
                    'the leading provider of cutting-edge technology solutions for academic institutions. Since our establishment in 2023, our mission has been to revolutionize the way universities monitor student engagement, track attendance, and evaluate teaching effectiveness. With our innovative application integrated with advanced camera capabilities, we empower educational institutions to create immersive and distraction-free learning environments.',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'At Distractless, ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:
                    'we understand the challenges faced by both students and educators in today\'s digital age. With the prevalence of smartphones and other devices, it has become increasingly difficult for professors to maintain students\' attention during lectures. Additionally, inefficient attendance-taking methods have long plagued educational institutions, resulting in inaccurate records and wasted administrative efforts. Recognizing these pain points, we have developed a state-of-the-art solution that leverages the power of technology to overcome these obstacles.',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'Our cutting-edge , ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:"application utilizes intelligent video analytics to analyze and monitor students' engagement levels during lectures. By analyzing facial expressions, body language, and interaction patterns, our system can accurately identify when a student becomes distracted or disengaged. Through advanced algorithms, we provide real-time notifications to professors, enabling them to address students' attention lapses promptly and adapt their teaching methods accordingly.",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'One of our key features  , ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:"is the automated attendance-taking system, where professors no longer need to manually record attendance. Our application seamlessly integrates with existing university systems and automatically generates comprehensive attendance reports. This not only saves valuable class time but also ensures accurate attendance records that can be securely accessed by administrators.",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'At Distractless,',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:" we strongly believe in the importance of providing feedback for continuous improvement. Our application offers detailed analytics and evaluation tools for academic institutions to measure teaching effectiveness. By analyzing the captured data, such as student engagement trends and attendance patterns, institutions can gain valuable insights into their teaching practices and make informed decisions to enhance the overall learning experience.",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'Our dedicated team ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:"of professionals is at the forefront of technology innovation and education. Combining expertise in computer vision, machine learning, and educational psychology, we have developed an application that revolutionizes the way universities operate. We are committed to staying at the cutting edge of technological advancements and continuously refining our solution to cater to the evolving needs of modern education. ",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
                const SizedBox(height: 12,),
                RichText(text:const TextSpan(
                  text: 'In conclusion, ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',fontSize: 17,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text:"Distractless is passionate about transforming education through innovation. With our groundbreaking application, universities can create an environment that fosters engagement, boosts academic performance, and enhances the overall learning experience. Join us on this journey as we revolutionize how education is delivered and experienced in the digital era. Together, let's embrace distraction-free learning and shape the future of education.",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 15)
                    ),

                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
