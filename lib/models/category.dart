enum Category {
  all,
  child,
  woman,
  man,
  social,
  morning,
  pensioner,
}

String categotyName(Category category) {
  switch (category) {
    case Category.all:
      return 'Всем';
    case Category.child:
      return 'Детям';
    case Category.woman:
      return 'Девушкам';
    case Category.man:
      return 'Мужчинам';
    case Category.social:
      return 'Социальная';
    case Category.morning:
      return 'Утренняя';
    case Category.pensioner:
      return 'Пенсионерам';
    default:
      return 'Всем';
  }
}
