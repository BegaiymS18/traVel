import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/widgets/popular_item.dart';
import 'package:flutter_application_19/widgets/recommended_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Aspen",
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: Color(0xFF176FF2),
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Aspen, USA",
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF606060),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F8FE),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Find places to visit",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF176FF2),
              labelColor: const Color(0xFF176FF2),
              unselectedLabelColor: const Color(0xFFB8B8B8),
              labelStyle: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              unselectedLabelStyle: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              tabs: const [
                Tab(text: "Location"),
                Tab(text: "Hotels"),
                Tab(text: "Food"),
                Tab(text: "Adventure"),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildTabContent("Location"),
                  buildTabContent("Hotels"),
                  buildTabContent("Food"),
                  buildTabContent("Adventure"),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF176FF2),
          unselectedItemColor: Colors.black38,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(String tab) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: const Color(0xFF232323),
                  ),
                ),
                Text(
                  "See All",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xFF176FF2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PopularItem(
                    title: "Alley Palace",
                    rating: "4.1",
                    image: "assets/images/Alley Palace.png",
                  ),
                  const SizedBox(width: 16),
                  PopularItem(
                    title: "Coeurdes Alpes",
                    rating: "4.9",
                    image: "assets/images/Coeurdes Alpes.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: const Color(0xFF232323),
                  ),
                ),
                Text(
                  "See All",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xFF176FF2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecommendedCard(
                    title: "Explore Aspen",
                    duration: "4N/5D",
                    deal: "Hot Deal",
                    image: "assets/images/rectangle_9921.jpeg",
                  ),
                  SizedBox(width: 16),
                  RecommendedCard(
                    title: "Luxurious Aspen",
                    duration: "2N/3D",
                    deal: "New Deal",
                    image: "assets/images/rectangle_9922.png",
                  ),
                  SizedBox(width: 16),
                  RecommendedCard(
                    title: "Explore Aspen",
                    duration: "4N/5D",
                    deal: "Hot Deal",
                    image: "assets/images/rectangle_9921.jpeg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
