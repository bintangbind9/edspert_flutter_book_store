import 'package:edspert_flutter_book_store/presentation/style/style.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: appBarTitleStyle),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40)),
                    child: Container(
                      color: colorPrimary,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(70)),
                child: Image.network(
                  'assets/photos/me.jpg',
                  fit: BoxFit.cover,
                  width: 140,
                ),
              )
            ]),
            const SizedBox(height: 20),
            Text('Mohammad Bintang Saputra', style: lv1TextStylePrimary),
            const SizedBox(height: 6),
            Text('Software Developer', style: lv3TextStyleSecondary),
            Text('Pekalongan, Jawa Tengah, Indonesia',
                style: lv5TextStyleSecondary),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        const Icon(Icons.work, size: 16, color: Colors.black54),
                        Text(' PT. Inspiro', style: lv3TextStyleSecondary)
                      ]),
                      Row(children: [
                        const Icon(Icons.book, size: 16, color: Colors.black54),
                        Text(' Politeknik Meta Industri',
                            style: lv3TextStyleSecondary)
                      ])
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  style: lv2TextStylePrimary,
                                  'Work Experiences:'),
                              const SizedBox(height: 20),
                              Text(style: lv3TextStylePrimary, 'PT. Inspiro'),
                              Text(
                                  style: lv3TextStylePrimary,
                                  'Sep 2021 - Saat ini (1 tahun 10 bulan)'),
                              const SizedBox(height: 5),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Understanding change requests from clients based on HLD (High Level Definition) documents.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Develop applications based on HLD documents.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Create or modify SQL store procedure based on business process.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Deploy applications to internal environments.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Test changes before saving or pushing to remote repository.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Merge the codes between branches.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Prepare and send development packages to customers.'),
                              Text(
                                  style: lv4TextStyleSecondary,
                                  'Support SIT, UAT and QA phase with key users and provide solutions for any issues occurred during SIT, UAT and QA process.')
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
