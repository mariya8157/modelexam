import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/reverpordModel.dart';
import '../repository/addingRepository.dart';
final addingControllerProvider=Provider((ref) => AddingController(addingRepository: ref.watch(addingRepositoryProvider)));

class AddingController{
  final AddingRepository _addingRepository;
  AddingController({
    required AddingRepository addingRepository
  }):_addingRepository=addingRepository;

  controlFunc({required RiverpordModel reverpord}){
    _addingRepository.adding(reverpordModel: reverpord);
  }
}