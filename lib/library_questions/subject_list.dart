abstract class Subject{
  List<String>bundleQuests;
  List<String>filePath;
  List<int>numQuestions;
}
//numBundle này là 0
class MilitaryEdu extends Subject{
  List<String> bundleQuests=['Học phần 1:ĐƯỜNG LỐI QUÂN SỰ CỦA ĐẢNG',
  'Học phần 2: CÔNG TÁC QUỐC PHÒNG VÀ AN NINH'
  ,'Học phần 3: QUÂN SỰ CHUNG, CHIẾN THUẬT VÀ KỸ THUẬT BẮN SÚNG TIỂU LIÊN AK','PHẦN 4: TỔNG HỢP CÁC CÂU'];
  List<String>filePath=['assets/file_xlsx/gdqp_hp1.xlsx','assets/file_xlsx/gdqp_hp2.xlsx',
  'assets/file_xlsx/gdqp_hp3.xlsx','assets/file_xlsx/gdqp_final.xlsx'];
  List<int>numQuestions=[20,30,40,90];
}
class Python extends Subject{
  List<String> bundleQuests=['Cơ bản về Python',
  'Toán tử về Python'
  ,'Cấu trúc dữ liệu trong Python','Nâng cao về Python','Tổng hợp về Python'];
  List<String>filePath=['1','2','3','4','5'];
  List<int>numQuestions=[20,30,40,90,120];
}
class Environment extends Subject{
  List<String>bundleQuests=['Bộ đề 1','Bộ đề 2','Bộ đề 3'];
  List<String>filePath=['assets/file_xlsx/mtdc_p1.xlsx','assets/file_xlsx/mtdc_p2.xlsx','assets/file_xlsx/mtdc_p3.xlsx'];
  List<int>numQuestions=[10,10,10];
}
class SubjectList{
  //0 la gdqp, 1 la python, 2 la moi truong
  List<List<String>> ls=[
    ['Giáo dục quốc phòng','assets/images/tank.png'],
    ['Python','assets/images/python.png'],
    ['Môi trường đại cương','assets/images/earth.png']
    ];
}