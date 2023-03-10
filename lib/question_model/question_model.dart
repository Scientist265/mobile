class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final int scoreValue;
  Answer(this.answerText, this.scoreValue);
}

List<Question> getQuestion() {
  List<Question> questionList = [];

  questionList.add(Question('What kind of work do you enjoy?', [
    Answer('Working with people', 1),
    Answer('Working with Numbers', 2),
    Answer('Working with ideas', 3),
  ]));
  questionList.add(Question('What are your strengths?', [
    Answer('Leadership', 1),
    Answer('Problem-solving', 2),
    Answer('creativity', 3),
  ]));
  questionList.add(Question('Do you see yourself teaching children?', [
    Answer('Definately', 3),
    Answer('I dont mind', 2),
    Answer('I don’t have Patience', 1),
  ]));
  questionList.add(Question('What are your interests?', [
    Answer('Science', 3),
    Answer('Art', 2),
    Answer('Sport', 1),
  ]));
  questionList.add(Question('What is your motivation to work?', [
    Answer('Financial security', 3),
    Answer('Helping others', 1),
    Answer('Achieving personal goals', 2),
  ]));
  questionList.add(Question('Do you enjoy doing scientific experiments?', [
    Answer('Agree', 3),
    Answer('Neutral', 2),
    Answer('No', 1),
  ]));
  questionList.add(Question('Can you spend hours reading a book?', [
    Answer('Yes oh', 3),
    Answer('It depend', 2),
    Answer('No, Ican\’t sit at a place', 1),
  ]));
  questionList.add(Question('Do you enjoy designing cards?', [
    Answer('Yes', 3),
    Answer('Not really', 2),
    Answer('I can\’t design”z”', 1),
  ]));
  questionList.add(Question('What kind of work do you enjoy?', [
    Answer('Working with people', 3),
    Answer('Working with Numbers', 2),
    Answer('Working with ideas', 1),
  ]));
  questionList.add(Question('Do you like your things a certain way?', [
    Answer('Certainly', 3),
    Answer('Problem-solving', 2),
    Answer('creativity', 1),
  ]));
  questionList
      .add(Question('Do you find yourself analyzing everything you hear?', [
    Answer('No', 3),
    Answer('Maybe for Football’', 2),
    Answer('Yest', 1),
  ]));
  questionList.add(Question('Are you cautious with spending money?', [
    Answer(' No', 3),
    Answer('Yes', 2),
    Answer('Where the money?', 1),
  ]));

  questionList.add(Question('Are you someone that likes to negotiate things', [
    Answer('I find it easy', 3),
    Answer('If I have to, yes', 2),
    Answer('I don’t like it', 1),
  ]));
  questionList.add(
      Question('If you had to choose one career interest, what would it be?', [
    Answer('Work with tools and machinery', 2),
    Answer('Work in a fun facility', 1),
    Answer('Be part of saving the world', 3),
  ]));
  questionList.add(Question('Have you been told that “you are too serious”?', [
    Answer('Everytime', 3),
    Answer('No', 2),
    Answer('Once in a while', 1),
  ]));

  questionList.add(Question('Why would you like to further your education?', [
    Answer('to get leadership roles', 1),
    Answer('to make more money', 3),
    Answer('for the Title and my Parents', 2),
  ]));

  questionList.add(Question(
      'Assumming you had 2 younger ones fighting, how would you separate them?',
      [
        Answer('Go call an elder or parent', 1),
        Answer('Konk one and separate fight', 3),
        Answer('Look and walk away', 2),
      ]));
  questionList.add(Question(
      'If you had all the money in the world, what would you be doing at home?',
      [
        Answer('Working on a pet building project for fun', 1),
        Answer('Spending time with family', 3),
        Answer('Doing nothing', 2),
      ]));

  return questionList;
}

class Schools {
  final String? careerImgPath;
  final List<String>? schoolName;
  final List<String>? schoolLink;
  final String? schoolLocation;
  final List<String>? program;
  Schools(this.schoolName, this.schoolLink, this.schoolLocation, this.program,
      this.careerImgPath);
  List<Schools> mySchoolList = [
    Schools(
      [
        'Obafemi Awolowo University',
        'Covenant University',
        'Federal University of Petroleum Resources',
      ],
      [
        'oauife.edu.ng',
        'covenantuniversity.edu.ng',
        'fupre.edu.ng',
      ],
      'Nigeria',
      ['Bachelors in Medicine and Surgery', 'Engineering'],
      'assets/images/',
    ),
    Schools(
      [
        'Obafemi Awolowo University',
        'Covenant University',
        'Federal University of Petroleum Resources',
      ],
      [
        'oauife.edu.ng',
        'covenantuniversity.edu.ng',
        'fupre.edu.ng',
      ],
      'Nigeria',
      ['Bachelors in Medicine and Surgery', 'Engineering'],
      'assets/images/',
    ),
    Schools(
      [
        'Obafemi Awolowo University',
        'Covenant University',
        'Federal University of Petroleum Resources',
      ],
      [
        'oauife.edu.ng',
        'covenantuniversity.edu.ng',
        'fupre.edu.ng',
      ],
      'Nigeria',
      ['Bachelors in Medicine and Surgery', 'Engineering'],
      'assets/images/',
    ),
    Schools(
      [
        'University of Ibadan (UI)',
        'Michael Okpara University of Agriculture',
        'University of Jos (UNIJOS)'
      ],
      [
        'www.ui.edu.ng',
        'mouau.edu.ng',
        'unijos.edu.ng',
      ],
      'Nigeria',
      [
        'Bsc Finance',
        'Agriculture/Animal Science',
        'Medical Laboratory Science',
        'Pharmacy',
      ],
      'assets/images/',
    ),
    Schools(
      [
        'Ekiti State University (EKSU)',
        'University of Maiduguri (UNIMAID)',
        'Ladoke Akintola University of Technology (LAUTECH)',
      ],
      [
        'eksu.edu.ng',
        'unimaid.edu.ng',
        'lautech.edu.ng',
      ],
      'Nigeria',
      [
        'Bsc Mass comunication',
        'Business Administration',
        'Law',
        'Social science',
      ],
      'assets/images/',
    ),
    Schools(
      [
        'University of Port Harcourt (UNIPORT)',
        'Covenant University',
        'ABU Zari',
      ],
      [
        'uniport.edu.ng',
        'covenantuniversity.edu.ng',
        'abu.edu.ng',
      ],
      'Nigeria',
      [
        'Bsc Nursing',
        'Media Relations',
        'Education',
      ],
      'assets/images/',
    )
  ];
}
