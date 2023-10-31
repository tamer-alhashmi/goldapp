import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldapp/cubit/states.dart';
import 'package:goldapp/network/dio_helper.dart';

class MainCubit extends Cubit<States>{
    MainCubit(): super(InitState());

  static MainCubit get(context)=> BlocProvider.of(context);



  
double? goldD;
int? goldI; 

double? silverD;
int? silverI; 

getGoldPrice(){
DioHelper.getDate('XAU/EGP/').then((value) {


    goldD = value.data['price_gram_18k'];
    goldI=goldD!.round();
    print(goldI);
    emit(GetGoldPriceStates());

}).catchError((error){
  print(error.toString());
});
}



getSilverPrice(){
DioHelper.getDate('XAG/EGP/').then((value) {


    silverD = value.data['price_gram_18k'];
    silverI=silverD!.round();
    print(silverI);
    emit(GetSilverPriceStates());


}).catchError((error){
  print(error.toString());
});
}


    }
