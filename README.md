# NPC-Pathing
Coded in LuaU, through Roblox Studio

Hello 👋 This is my first EVER small project I worked on alone created in Roblox Studio. I created this around August 2024 but never posted about it, so here it is! I noticed that many online tutorials on NPC pathfinding rely on placing multiple parts along predefined pathways. However, I wanted to approach this differently by allowing the NPC to move autonomously and unpredictably while only using a single part as its anchor. The result is an NPC that navigates its environment at random intervals, showcasing a cleaner and more dynamic approach to pathfinding. I hope you find this project helpful and enjoyable! The NPC will also run away from you if your character is the closest. THESE NPCS ARE NOT INTERACTABLE 

Below is a step-by-step beginner-friendly process of how to get this working:

1. Open up Roblox Studio and create a new Place (obviously lol)

2. On the top left, press HOME -> PART

3. To change the part shape, look at the top left, press Scale, scale to however you would like, and make sure the part is wide (try to scale as big as possible)

4. On the top left, press AVATAR -> RIG BUILDER, and generate any rig type you want. Place this rig on top of your part. 

5. On the top left, press VIEW -> Explorer + Properties. By doing this, this gives you access to edit anything in your world.

6. Locate the part and rig you just placed in EXPLORER by pressing Workspace. Your part and rig should be located inside.

7. Chance the part name to whatever you want by pressing the + sign next to the part (when you press the part, you can change the name in Properties), though if your part name is not "aitestblock", you will have to edit the script (just one line)

8. In Explorer -> Workspace, your rig should have a + sign next to it as well (all items in the Explorer have a + sign next to them). Press the + and insert a Script

9. Paste the code into the Script (the script is in another file and is also in the codespace), and change the part name on lines if necessary (comments will be left next to the lines in the script)

10. Press Play and watch your rig run around randomly!

PS. If you get too close to the rig, it will run away from your character. If you want it to continuously run away from your character, feel free to edit the wait time at the bottom of the script you just pasted. If you do not wish for it to run away from your character, a comment is left near the lines in the script. You can delete those lines. 
