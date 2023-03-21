import 'package:auth_op/features/shop/profile/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_profile_tile.dart';
import '../../../../components/custom_text.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/style_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../auth/viewmodel/user_view_model.dart';
import '../subview/orders_view.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String _PPUrl =
      'https://user-images.githubusercontent.com/72533615/191083335-53546aa4-e576-4632-a2bb-0f9b36bc1321.png';
  late HomeUserModel userModel;
  @override
  void initState() {
    super.initState();
    userModel = context.read<UserViewModel>().user;

  }
//Wrap(children: [CircleAvatar(backgroundColor: Colors.black,),ListTile()],)
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: ColorConstant.instance.background,
          elevation: 0,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_PPUrl),
                  radius: 30,
                ),
                title: CustomText(data: userModel.name, style: StyleConstant.instance.ts18bold),
                subtitle: CustomText(data: userModel.email, style: StyleConstant.instance.ts14),
              )
            ],
          ),
        ),
       
        CustomProfileTile(title:TextConstant.instance.ordersTitleText, subTitle:TextConstant.instance.ordersSubTitleText, onPress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersView()));
        }),
        CustomProfileTile(title:TextConstant.instance.addressTitleText, subTitle:TextConstant.instance.addressSubTitleText, onPress: (){}),
        CustomProfileTile(title:TextConstant.instance.myReviewsTitleText, subTitle:TextConstant.instance.myReviewsSubTitleText, onPress: (){}),
        CustomProfileTile(title:TextConstant.instance.settingTitleText, subTitle:TextConstant.instance.settingSubTitleText, onPress: (){
          
        })
      ],
    );
  }
}