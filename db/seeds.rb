# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users
users = User.create([
    { username: "gamer123" },
    { username: "playerOne" },
    { username: "chief_king" },
    { username: "zeus_royale" },
    { username: "theRPGmaster" },
    { username: "action_hero" },
    { username: "n00bzilla" },
    { username: "pixel_guru" },
    { username: "retro_king" },
    { username: "adventure_queen" }
])

# Create Genres
genres = Genre.create([
    { name: "Action" },
    { name: "RPG" },
    { name: "Adventure" },
    { name: "Shooter" },
    { name: "Strategy" },
    { name: "Simulation" },
    { name: "Sports" }
])

# Create Platforms
platforms = Platform.create([
    { name: "Xbox" },
    { name: "PlayStation" },
    { name: "PC" },
    { name: "Switch" },
    { name: "Mobile" }
])

# Create Games
games = Game.create([
    { name: "The Legend of Zelda: Breath of the Wild", summary: "An open-world action-adventure game.", release_date: "2017-03-03", rating: "10/10", developer: "Nintendo", theme: "Fantasy", franchises: "Zelda", img_url: "https://example.com/zelda.jpg" },
    { name: "Red Dead Redemption 2", summary: "A western-themed action-adventure game.", release_date: "2018-10-26", rating: "9.8/10", developer: "Rockstar Games", theme: "Western", franchises: "Red Dead", img_url: "https://example.com/rdr2.jpg" },
    { name: "God of War", summary: "An action-adventure game based on Norse mythology.", release_date: "2018-04-20", rating: "9.5/10", developer: "Santa Monica Studio", theme: "Mythology", franchises: "God of War", img_url: "https://example.com/godofwar.jpg" },
    { name: "Minecraft", summary: "A sandbox video game focused on building and exploration.", release_date: "2011-11-18", rating: "9.0/10", developer: "Mojang", theme: "Sandbox", franchises: "Minecraft", img_url: "https://example.com/minecraft.jpg" },
    { name: "Fortnite", summary: "A battle royale game with building mechanics.", release_date: "2017-07-25", rating: "8.5/10", developer: "Epic Games", theme: "Battle Royale", franchises: "Fortnite", img_url: "https://example.com/fortnite.jpg" },
    { name: "The Witcher 3: Wild Hunt", summary: "An RPG where you play as Geralt of Rivia, a monster hunter.", release_date: "2015-05-19", rating: "9.7/10", developer: "CD Projekt Red", theme: "Fantasy", franchises: "The Witcher", img_url: "https://example.com/witcher3.jpg" },
    { name: "Overwatch", summary: "A first-person shooter with team-based combat.", release_date: "2016-05-24", rating: "8.7/10", developer: "Blizzard Entertainment", theme: "Sci-Fi", franchises: "Overwatch", img_url: "https://example.com/overwatch.jpg" },
    { name: "Call of Duty: Modern Warfare", summary: "A first-person shooter with a modern warfare theme.", release_date: "2019-10-25", rating: "9.0/10", developer: "Infinity Ward", theme: "Modern Warfare", franchises: "Call of Duty", img_url: "https://example.com/codmw.jpg" },
    { name: "Super Mario Odyssey", summary: "An action-adventure platformer featuring Mario.", release_date: "2017-10-27", rating: "9.5/10", developer: "Nintendo", theme: "Platformer", franchises: "Mario", img_url: "https://example.com/marioodyssey.jpg" },
    { name: "Assassin's Creed Odyssey", summary: "An action RPG set in ancient Greece.", release_date: "2018-10-05", rating: "8.9/10", developer: "Ubisoft", theme: "Historical", franchises: "Assassin's Creed", img_url: "https://example.com/acodyssey.jpg" }
])

# Create Reviews
reviews = Review.create([
    { user_id: users.sample.id, game_id: games.sample.id, body: "Amazing game! I love the storyline and graphics." },
    { user_id: users.sample.id, game_id: games.sample.id, body: "Great game, but the multiplayer aspect could be better." },
    { user_id: users.sample.id, game_id: games.sample.id, body: "Really fun, but I found some mechanics repetitive." },
    { user_id: users.sample.id, game_id: games.sample.id, body: "The graphics are insane, but the controls could use some work." },
    { user_id: users.sample.id, game_id: games.sample.id, body: "I enjoyed it but not as much as I thought I would." }
])

# Create Game Genres (Many-to-Many relationship)
game_genres = GameGenre.create([
    { game_id: games.sample.id, genre_id: genres.sample.id },
    { game_id: games.sample.id, genre_id: genres.sample.id },
    { game_id: games.sample.id, genre_id: genres.sample.id },
    { game_id: games.sample.id, genre_id: genres.sample.id },
    { game_id: games.sample.id, genre_id: genres.sample.id }
])

# Create Game Platforms (Many-to-Many relationship)
game_platforms = GamePlatform.create([
    { game_id: games.sample.id, platform_id: platforms.sample.id },
    { game_id: games.sample.id, platform_id: platforms.sample.id },
    { game_id: games.sample.id, platform_id: platforms.sample.id },
    { game_id: games.sample.id, platform_id: platforms.sample.id },
    { game_id: games.sample.id, platform_id: platforms.sample.id }
])

# Create UserGames (Many-to-Many relationship between Users and Games)
user_games = UserGame.create([
    { user_id: users.sample.id, game_id: games.sample.id, status: 0 }, # status: 0 for Must-Play
    { user_id: users.sample.id, game_id: games.sample.id, status: 1 }, # status: 1 for Played
    { user_id: users.sample.id, game_id: games.sample.id, status: 0 },
    { user_id: users.sample.id, game_id: games.sample.id, status: 1 },
    { user_id: users.sample.id, game_id: games.sample.id, status: 0 }
])
