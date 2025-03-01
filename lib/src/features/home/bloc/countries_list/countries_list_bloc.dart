import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CountriesListBloc extends Bloc<CountriesListEvent, CountriesListState>{
  final HomeRepo _homeRepo;
  CountriesListBloc({HomeRepo? homeRepo}):
    _homeRepo = homeRepo ?? HomeRepoImpl(),

    super(CountriesListEmptyState()){
      on<FetchCountriesEvent>((_, emit)async{
        emit(CountriesListLoadingState());

        try{
          final response = await _homeRepo.fetchCountries();
          response.when(
            successful: (result) => emit(
              CountriesListDataState(countries: result.data?.countries ?? [])
            ),
            error: (error) => emit(
              CountriesListErrorState(errorMsg: error.error.message ?? CBStrings.ERR_OCCURED)
            ),
          );
        }
        catch (e){
          emit(
            CountriesListErrorState(errorMsg: e.toString())
          );
        }
      });
    }

}




// final usersProvider =
//   StateNotifierProvider<UsersNotifier, AsyncValue<List<User>?>>(
//     (ref) => UsersNotifier(ref)
// );

// class UsersNotifier extends StateNotifier<AsyncValue<List<User>?>> {
//   UsersNotifier(this.ref)
//     : homeRepo = ref.read(homeRepoProvider),
//       super(const AsyncData(null));

//   final Ref ref;
//   final HomeRepo homeRepo;

//   List<User>? _listOfUsers;


//   Future<GenericResponseModel> fetchUsers() async {   
//     state = const AsyncLoading(); 
//     try{
//       final response = await homeRepo.fetchUsers();

//       final result = response.when(
//         successful: (result){
//           final usersList = result.data?.users;
//           _listOfUsers = usersList;
//           state = AsyncData(usersList);
//           return GenericResponseModel(
//             isSuccessful: true,
//             responseMessage: ''
//           );
//         },
        
//         error: (error){
//           state = AsyncData(null);
//           return GenericResponseModel(
//             isSuccessful: false,
//             responseMessage: error.error.message
//           );
//         }
//       );

//       return result;
//     }
//     catch (e){
//       state = AsyncData(null);
//       return GenericResponseModel(
//         isSuccessful: false,
//         responseMessage: e.toString()
//       );
//     }
//   }



//   void filterUsers(String searchKey) async{
//     state = const AsyncLoading();
    
//     if(searchKey.isEmpty){
//       ref.invalidate(globalStringProvider(HealTStrings.SEARCH_KEY));
//       state = AsyncData(_listOfUsers);
//       return;
//     }

//     final filteredUsers = _listOfUsers?.where(
//       (user) => (user.name?.toLowerCase().contains(searchKey.toLowerCase()) ?? false)
//     ).toList();
    
//     ///Writes the searchKey to the Widget that will change the color of the text of the filtered items.
//     HealTHelperFuncs.setAProvider(
//       value: searchKey, ref: ref,
//       provider: globalStringProvider(HealTStrings.SEARCH_KEY)
//     );

//     state = AsyncData(filteredUsers);
//   }

// }