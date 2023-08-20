class Books {
  String? cover;
  String? name;
  String? madeBy;
  String? description;
  String? value;
  String? type;
  Books(
    this.cover,
    this.name,
    this.madeBy,
    this.description,
    this.value,
    this.type,
  );
}

List<Books> getbooks = [
  Books(
    "img/40.jpg",
    "40 أربعون",
    "Ahmad Al Shugairi",
    "his readings after reached 40 years of age. Full of wisdom and easy to understand",
    "\$11.20",
    "best seller",
  ),
  Books(
    "img/atomichabits.jpg",
    "Atomic Habits",
    "James Clear",
    "No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.",
    "\$12.99",
    "new",
  ),
  Books(
    "img/cashflowquadrant.jpg",
    "Rich Dad's CASHFLOW Quadrant",
    "Robert T.Kiyosaki",
    "Rich Dad’s CASHFLOW Quadrant is a guide to financial freedom. It’s the second book in the Rich Dad Series and reveals how some people work less, earn more, pay less in taxes, and learn to become financially free.",
    "\$9.99",
    "trending",
  ),
  Books(
    "img/thinkagain.jpg",
    "Think Again",
    "Adam Grant",
    "THIS. This is the right book for right now. Yes, learning requires focus. But, unlearning and relearning requires much more—it requires choosing courage over comfort. In Think Again, Adam Grant weaves together research and storytelling to help us build the intellectual and emotional muscle we need to stay curious enough about the world to actually change it. I’ve never felt so hopeful about what I don’t know.",
    "\$16.99",
    "new",
  ),
  Books(
    "img/yourthoughtsarekillingyou.jpg",
    "Your Thoughts Are Killing You",
    "Marybeth Wuenschel",
    "No matter what you are going through, worrying about, stressing, or fretting over, no matter how long you have been feeling this way, Jesus wants you free. He wants you free from depression, worry, fear, and every thought, memory, and mood that plagues you.",
    "\$3.99",
    "popular",
  ),
];
