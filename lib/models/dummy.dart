

class DummyProject {

  String title;
  String subTitle;
  String image;

  DummyProject(
      { required this.title,
        required this.subTitle,
        required this.image});
}

List<DummyProject> dummyProjectList = [
  DummyProject(title: 'Project 1', subTitle: '09/07/2023', image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
  DummyProject(title: 'Project 2', subTitle: '05/07/2023', image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
  DummyProject(title: 'Project 3', subTitle: '01/06/2023', image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
];