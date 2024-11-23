const List movies = [
  {
    "name": "The Pursuit of Happyness",
    "genre": "Drama",
    "actors": ["Will Smith", "Jaden Smith"],
    "duration": "1:57:0",
    "price": "25\$",
    "showTimes": ["14:00", "18:00", "22:00"],
    "hallIds": ["1", "2"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/dd/4f/a0/dd4fa0752e4662e768e441f8d748492f.jpg",
    "isNew": false,
    "description":
        "A heartwarming story of a struggling father and his young son.",
    "summary":
        "Chris Gardner is a salesman who faces financial difficulties and homelessness while trying to build a better life for his son. This film showcases the power of perseverance and determination."
  },
  {
    "name": "The Hangover",
    "genre": "Comedy",
    "actors": ["Bradley Cooper", "Zach Galifianakis"],
    "duration": "1:40:0",
    "price": "20\$",
    "showTimes": ["13:00", "17:00", "21:00"],
    "hallIds": ["2", "3"],
    "image":
        "https://i.pinimg.com/736x/22/24/f8/2224f8b32efff4e53716a954b9670339.jpg",
    "isNew": false,
    "description": "A hilarious journey of a bachelor party gone wrong.",
    "summary":
        "Four friends travel to Las Vegas for a bachelor party. After a wild night, they wake up to find the groom missing and must piece together their chaotic night to find him."
  },
  {
    "name": "Inception",
    "genre": "Action",
    "actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt"],
    "duration": "2:82:0",
    "price": "30\$",
    "showTimes": ["15:00", "19:00", "23:00"],
    "hallIds": ["1", "3"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/c6/84/2a/c6842ab0168dc047cad190b868b3591a.jpg",
    "isNew": false,
    "description":
        "A mind-bending thriller that explores dreams within dreams.",
    "summary":
        "Dom Cobb, a skilled thief who enters dreams to steal secrets, is offered a chance to erase his past crimes if he can perform the ultimate heist: planting an idea in someone's mind."
  },
  {
    "name": "Frozen",
    "genre": "Animation",
    "actors": ["Kristen Bell", "Idina Menzel"],
    "duration": "1:22:0",
    "price": "20\$",
    "showTimes": ["12:00", "16:00", "20:00"],
    "hallIds": ["1"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/e0/f7/dc/e0f7dcc1f0a9657da69ab63c598624eb.jpg",
    "isNew": true,
    "description": "A magical story of sisterhood and courage.",
    "summary":
        "Elsa, a princess with magical ice powers, accidentally plunges her kingdom into eternal winter. Her sister Anna teams up with a rugged mountain man and a talking snowman to save the kingdom."
  },
  {
    "name": "Avengers: Endgame",
    "genre": "Action",
    "actors": ["Robert Downey Jr.", "Chris Evans"],
    "duration": "3:01:0",
    "price": "35\$",
    "showTimes": ["14:30", "18:30", "22:30"],
    "hallIds": ["2", "3"],
    "image":
        "https://i.pinimg.com/736x/d0/44/80/d0448040575da620c0b8e788ecf760f7.jpg",
    "isNew": true,
    "description": "The epic conclusion to the Avengers saga.",
    "summary":
        "After Thanos wipes out half the universe, the remaining Avengers must assemble once more to undo his actions and restore balance to the universe."
  },
  {
    "name": "Joker",
    "genre": "Drama",
    "actors": ["Joaquin Phoenix", "Robert De Niro"],
    "duration": "2:216:0",
    "price": "28\$",
    "showTimes": ["13:30", "17:30", "21:30"],
    "hallIds": ["1", "3"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/f5/81/a9/f581a9b6c9ab5043d60d6f4c9be96223.jpg",
    "isNew": false,
    "description":
        "A haunting origin story of one of the most iconic villains.",
    "summary":
        "Arthur Fleck, a mentally ill comedian, struggles with isolation and rejection, spiraling into madness to become Gotham's infamous Joker."
  },
  {
    "name": "Toy Story",
    "genre": "Animation",
    "actors": ["Tom Hanks", "Tim Allen"],
    "duration": "1:39:0",
    "price": "15\$",
    "showTimes": ["10:00", "14:00", "18:00"],
    "hallIds": ["1"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/49/26/6f/49266f25fc9c8b7d0f5f60ab8d5b32f5.jpg",
    "isNew": true,
    "description": "A heartwarming tale of toys that come to life.",
    "summary":
        "Woody, Buzz, and the gang embark on an adventure to reunite with their owner, showcasing themes of friendship and loyalty."
  },
  {
    "name": "The Dark Knight",
    "genre": "Action",
    "actors": ["Christian Bale", "Heath Ledger"],
    "duration": "1:32:0",
    "price": "30\$",
    "showTimes": ["12:30", "16:30", "20:30"],
    "hallIds": ["2"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/5f/fe/79/5ffe79003530da912a82acac80be1426.jpg",
    "isNew": true,
    "description": "A gripping tale of justice and chaos.",
    "summary":
        "Batman faces his toughest challenge yet when the Joker unleashes chaos in Gotham, testing the hero's resolve and morality."
  },
  {
    "name": "The Lion King",
    "genre": "Animation",
    "actors": ["Donald Glover", "Beyoncé"],
    "duration": "1:54:5",
    "price": "25\$",
    "showTimes": ["11:00", "15:00", "19:00"],
    "hallIds": ["3"],
    "image":
        "https://i.pinimg.com/enabled_lo_mid/736x/4d/a7/51/4da751adfa3296997f6db0e836b85c1c.jpg",
    "isNew": false,
    "description":
        "A timeless story of a lion's journey to reclaim his throne.",
    "summary":
        "Simba, a young lion, flees his pride after a tragedy but must find his courage to return and restore order to the Pride Lands."
  },
  {
    "name": "Deadpool",
    "genre": "Comedy",
    "actors": ["Ryan Reynolds", "Morena Baccarin"],
    "duration": "1:48:0",
    "price": "22\$",
    "showTimes": ["13:00", "17:00", "21:00"],
    "hallIds": ["1", "2"],
    "image":
        "https://i.pinimg.com/736x/45/91/f9/4591f976c9b197c9bdeac343b906bc77.jpg",
    "isNew": false,
    "description": "A comedic twist on superhero tales.",
    "summary":
        "Wade Wilson becomes Deadpool, a foul-mouthed mercenary with regenerative powers, as he seeks revenge and love in his own unique way."
  }
];

Map<String, dynamic> halls = {
  "1": {
    "name": "VIP Hall",
    "seats": [
      {"seatNumber": 1, "isBooked": false},
      {"seatNumber": 2, "isBooked": true},
      {"seatNumber": 3, "isBooked": false},
      {"seatNumber": 4, "isBooked": false},
      {"seatNumber": 5, "isBooked": true},
      {"seatNumber": 6, "isBooked": false},
      {"seatNumber": 7, "isBooked": false},
      {"seatNumber": 8, "isBooked": true},
      {"seatNumber": 9, "isBooked": false},
      {"seatNumber": 10, "isBooked": false},
      {"seatNumber": 11, "isBooked": true},
      {"seatNumber": 12, "isBooked": false},
      {"seatNumber": 13, "isBooked": false},
      {"seatNumber": 14, "isBooked": true},
      {"seatNumber": 15, "isBooked": false},
      {"seatNumber": 16, "isBooked": false},
      {"seatNumber": 17, "isBooked": true},
      {"seatNumber": 18, "isBooked": false},
      {"seatNumber": 19, "isBooked": false},
      {"seatNumber": 20, "isBooked": true}
    ]
  },
  "2": {
    "name": "Hall 2",
    "seats": [
      {"seatNumber": 1, "isBooked": false},
      {"seatNumber": 2, "isBooked": true},
      {"seatNumber": 3, "isBooked": false},
      {"seatNumber": 4, "isBooked": false},
      {"seatNumber": 5, "isBooked": true},
      {"seatNumber": 6, "isBooked": false},
      {"seatNumber": 7, "isBooked": false},
      {"seatNumber": 8, "isBooked": true},
      {"seatNumber": 9, "isBooked": false},
      {"seatNumber": 10, "isBooked": false},
      {"seatNumber": 11, "isBooked": true},
      {"seatNumber": 12, "isBooked": false},
      {"seatNumber": 13, "isBooked": false},
      {"seatNumber": 14, "isBooked": true},
      {"seatNumber": 15, "isBooked": false},
      {"seatNumber": 16, "isBooked": false},
      {"seatNumber": 17, "isBooked": true},
      {"seatNumber": 18, "isBooked": false},
      {"seatNumber": 19, "isBooked": false},
      {"seatNumber": 20, "isBooked": true},
      {"seatNumber": 21, "isBooked": true},
      {"seatNumber": 22, "isBooked": false},
      {"seatNumber": 23, "isBooked": false},
      {"seatNumber": 24, "isBooked": true},
      {"seatNumber": 25, "isBooked": false},
      {"seatNumber": 26, "isBooked": false},
      {"seatNumber": 27, "isBooked": true},
      {"seatNumber": 28, "isBooked": false},
      {"seatNumber": 29, "isBooked": false},
      {"seatNumber": 30, "isBooked": true},
      {"seatNumber": 41, "isBooked": true},
      {"seatNumber": 42, "isBooked": false},
      {"seatNumber": 43, "isBooked": false},
      {"seatNumber": 44, "isBooked": true},
      {"seatNumber": 45, "isBooked": false},
      {"seatNumber": 46, "isBooked": false},
      {"seatNumber": 47, "isBooked": true},
      {"seatNumber": 48, "isBooked": false},
      {"seatNumber": 49, "isBooked": false},
      {"seatNumber": 50, "isBooked": true}
    ]
  },
  "3": {
    "name": "Hall 3",
    "seats": [
      {"seatNumber": 1, "isBooked": false},
      {"seatNumber": 2, "isBooked": false},
      {"seatNumber": 3, "isBooked": false},
      {"seatNumber": 4, "isBooked": false},
      {"seatNumber": 5, "isBooked": false},
      {"seatNumber": 6, "isBooked": false},
      {"seatNumber": 7, "isBooked": false},
      {"seatNumber": 8, "isBooked": false},
      {"seatNumber": 9, "isBooked": false},
      {"seatNumber": 10, "isBooked": false},
      {"seatNumber": 11, "isBooked": true},
      {"seatNumber": 12, "isBooked": false},
      {"seatNumber": 13, "isBooked": false},
      {"seatNumber": 14, "isBooked": false},
      {"seatNumber": 15, "isBooked": false},
      {"seatNumber": 16, "isBooked": false},
      {"seatNumber": 17, "isBooked": false},
      {"seatNumber": 18, "isBooked": false},
      {"seatNumber": 19, "isBooked": false},
      {"seatNumber": 20, "isBooked": false},
      {"seatNumber": 21, "isBooked": false},
      {"seatNumber": 22, "isBooked": false},
      {"seatNumber": 23, "isBooked": false},
      {"seatNumber": 24, "isBooked": true},
      {"seatNumber": 25, "isBooked": false},
      {"seatNumber": 26, "isBooked": false},
      {"seatNumber": 27, "isBooked": false},
      {"seatNumber": 28, "isBooked": false},
      {"seatNumber": 29, "isBooked": false},
      {"seatNumber": 30, "isBooked": true},
      {"seatNumber": 41, "isBooked": true},
      {"seatNumber": 42, "isBooked": false},
      {"seatNumber": 43, "isBooked": false},
      {"seatNumber": 44, "isBooked": true},
      {"seatNumber": 45, "isBooked": false},
      {"seatNumber": 46, "isBooked": false},
      {"seatNumber": 47, "isBooked": false},
      {"seatNumber": 48, "isBooked": false},
      {"seatNumber": 49, "isBooked": false},
      {"seatNumber": 50, "isBooked": false}
    ]
  }
};

List type = [
  "Drama",
  "Comedy",
  "Action",
  "Animation",
];
