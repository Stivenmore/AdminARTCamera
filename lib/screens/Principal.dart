// ignore_for_file: file_names

import 'dart:ui';

import 'package:admin_camera_direct/domain/cubit/general_cubit.dart';
import 'package:admin_camera_direct/domain/models/doc_models.dart';
import 'package:admin_camera_direct/screens/Detailfolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  void initState() {
    context.read<GeneralCubit>().getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      width: double.infinity,
      child:
          BlocBuilder<GeneralCubit, GeneralState>(builder: ((context, state) {
        switch (state.runtimeType) {
          case GeneralLoading:
            return SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.7,
              child: Center(
                child: Lottie.asset("assets/loadig.json"),
              ),
            );
          case GeneralLoaded:
            List<DocumentModel> docs = state.props[0] as List<DocumentModel>;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blue[800]!.withOpacity(0.9)),
                              height: 60,
                              width: size.width * 0.8,
                              child: Center(
                                child: Text(
                                  "Admin",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 26),
                                ),
                              ),
                            ),
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.5),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blue[800]!.withOpacity(0.1)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Files",
                          style: GoogleFonts.montserrat(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w800,
                              fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Lottie.asset('assets/folders.json',
                                    height: 100,
                                    width: 80,
                                    fit: BoxFit.contain),
                                Text(docs[index].id!),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          DetailFolder(doc: docs[index]))));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "Open Folder",
                                style: GoogleFonts.montserrat(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    childCount: docs.length,
                  ),
                )
              ],
            );
          case GeneralError:
            return Center(
              child: Text(
                "No es posible recopilar la data, por favor intente mas tarde",
                style: GoogleFonts.montserrat(
                    color: Colors.blue[800], fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
            );
          default:
            return SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.7,
              child: Center(
                child: Lottie.asset("assets/loadig.json"),
              ),
            );
        }
      })),
    ));
  }
}
