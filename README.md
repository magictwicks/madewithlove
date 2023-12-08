# madewithlove
**Westmont College Fall 2023 CS105 Programming Languages**

## Author Information
* **Names**: Levi Wicks, Alexis Leon, David Ponce De Leon

## Guide around the repo
### Assets/Sprites folder
- In the Assets/Sprites folder contains all of the sprites and images referenced within the program to display the images of the game
- Includes: enemies, projectiles, background, player, start and end screen, and explosion
### Classes folder
- **Base**: contains game_object.lua file which is the base of our class inheritance tree. Pretty much all on screen objects should be of inheritence from this class. Just ensures that there is a new function, an update, a load, and a draw function which allows for the game to actually run through the Love framework. Base also contains entity which is the second base of our class inheritence tree only inheriting from game_object. entity.lua ensures collision detection on the objects to ensure that when two game objects come into contact, their health should be lowered or they should explode if their health depletes to zero.
- background.lua: Is it's own class and isn't an inheritence from anything and it only has a draw and update function such that it shows a starry background and the update function makes sure that there is a "scrolling" effect as if the player is constantly moving forward through space.
- borg.lua: is a inheritence from enemy.lua which is an inheritence from entity. A borg is just a simple enemy that moves straight down the y axis of the screen and cannot shoot.
- enemy_projectile.lua: is an inheritence from entity. This is so the enemy_projectile class can inherit entity's collision function and have collision detection. This is so that if a projectile hits an enemy or the player, it will register that it hit. References the sprites for the image and is pointed downward.
- enemy.lua: is an inheritence from entity. Base class for shooter and class enemies. Has a destroy function that shows an explosion on screen when the enemy dies.
- explosion.lua: is an inheritence from game_object. It displays 4 different sprites one after another to create an animation of an explosion. This is displayed after the player kills an enemy or the player runs into them.
- orb_projectile.lua: is an inheritence from entity. It is a specialized for a specific enemy, those being orb shooter enemies. 
- player.lua: is an inheritence from entity. All the functions the player has such as lives and differing sprites based on the players movement.
- projectile.lua: is the class that the enemy projectiles were based on. This class is mainly for the player however as the y axis is being subtracted as the player shoots up. 
- scene.lua: controls everything displayed on screen. This includes all the objects. When creating a scene you can input objects or add them using the function and scene will hold onto them in a table. The scene calls all of the load, update, and draw functions for the objects that are in its table. It also is in control of displaying the score during gameplay and switching the scene from gameplay to the end screen.
- shooter.lua: is an inheritence from enemy and is the class for all shooter enemies. Currently we have two types, orb shooters, and shooters that shoot straight own, there is also args that it can take it to make the shooter enemies strafe back and forth on the x axis as it comes down the y axis at a set pace.
## Controllers
- game_manager.lua: is in charge of the spawning of enemies and patters that they can show up in as well as difficulty scaling. We currently have 3 types of enemies, however with this script, it would be quite easy to add quite a few different types depending on what types of enemies we can combine (orb and strafe, strafe and shoot, strafe and no shoot)
- player_controller.lua: is in charge of receiving input from the user and movement as well as shooting.
## Main
- main.lua: This is the file that Love looks at when running and is what will contain the love.load, load.update, and love.draw functions to create gameplay through a loop of updating of objects and the scene and drawing it on screen. It is also responsible for getting the user from the start screen to the gameplay screen and allowing resettability so the player can play again if they die.
- settings.lua: contains a lot of values that are constant and referenced throughout the rest of the program. It also contains a function that increases difficulty as time progresses (health, speed, shootinterval of enemies)


