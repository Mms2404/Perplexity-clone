import 'package:flutter/material.dart';
import 'package:mytry/theme/colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ?64 : 200,
      color: AppColors.sideNav,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: 30,
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.iconGrey,
                  size: 25,
                  ),
                isCollapsed ? const SizedBox() : Text("    Home",)
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.iconGrey,
                  size: 25,
                  ),
                isCollapsed ? const SizedBox() : Text("    Search",)
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: AppColors.iconGrey,
                  size: 25,
                  ),
                isCollapsed ? const SizedBox() : Text("    Space",)
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.iconGrey,
                  size: 25,
                  ),
                isCollapsed ? const SizedBox() : Text("    Discover",)
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Icon(
                  Icons.cloud_outlined,
                  color: AppColors.iconGrey,
                  size: 25,
                  ),
                isCollapsed ? const SizedBox() : Text("  Home",)
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                setState(() {
                  isCollapsed= !isCollapsed;
                });
              },
              child: Icon(
                isCollapsed ? Icons.keyboard_arrow_right_outlined :Icons.keyboard_arrow_left_outlined,
                color: AppColors.iconGrey,
                size: 25,
                ),
            ),
        
          ],
        ),
      ),
    );
  }
}