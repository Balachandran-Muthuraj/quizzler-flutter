import 'questions.dart';
class Quizbrain
{
  int _questions=0;
  List<Questions> Questionbank=[Questions(q:'Is Lee Sian Long is the Singapore PM',a:true),
    Questions(q:'Is Narendra Modi is the India PM',a:true),
    Questions(q:'Is Edappadi Palanisamy is the CM of Andra',a:false)];

  void GetNextQuestion()
  {
    if(_questions < Questionbank.length -1)
      {
        _questions++;
      }

  }
  bool IsQuestionsExist()
  {
   return (_questions==(Questionbank.length-1));
  }
  void ResetQuestions()
  {
    _questions=0;
  }
  String GetquestionText()
  {
    return Questionbank[_questions].Question;
  }
  bool GetAnswerforQuestion()
  {
    return Questionbank[_questions].Answer;
  }
}