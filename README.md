![Pong Buddy Logo](./pong.bmp)

# About Project

Pong Buddy is a simple ping pong game made using x86 assembly. It supports 2 players, different ball speeds and paddle sizes. It was developed for a course project for the microprocessors course. I hope you enjoy it.

## What I learned

- Assembly language programming
- Game development basics
- Input handling
- File handling
- Collision detection
- Performance optimization
- Debugging and testing
- Project management
- Instruction set architecture
- Memory management
- Interrupt handling
- x86 Architecture

---

## How to play

1. Download [DOSBox](https://www.dosbox.com/download.php?main=1).
   > If DOSBox is too small you can set windowresolution=1600x900 and output=overlay in DOSBox options.
2. Download [/build/MAIN.EXE](./build/MAIN.EXE).
3. Launch DOSBox.
4. Mount the directory where you downloaded MAIN.EXE.  
   for example C:\Users\username\Downloads\MAIN.EXE
   ```powershell
    mount D: C:\Users\username\Downloads\
   ```
5. Navigate to the newly mounted directory D by typing 'D:'.
   ```powershell
   D:
   ```
6. Launch the game by typing 'MAIN.EXE'.
   ```powershell
   MAIN.EXE
   ```
7. Enjoy!

### Gameplay

- Start by entering both players' names
- Press f2 to start the game
- Choose paddle size and ball speed
- Press space to serve the ball and enjoy!
  ![Pong Buddy gameplay](https://user-images.githubusercontent.com/61359702/236646779-2c2b4ef3-320d-4f57-a091-d802bfa0b4cd.png)
- You can pause the game by pressing ESC
  ![Pong buddy game paused](https://user-images.githubusercontent.com/61359702/236646810-0db86906-6fdc-4892-89b3-7c9979e51ec6.png)
- First to 5 points wins.

---

## Build Pong Buddy from source

1. Download [DOSBox](https://www.dosbox.com/download.php?main=1).
   > If DOSBox is too small you can set windowresolution=1600x900 and output=overlay in DOSBox options.
2. Clone the repository by running the following command in your terminal or command prompt:
   ```shell
   git clone https://github.com/ziadabdo98/PongBuddy.git PongBuddy
   ```
3. Launch DOSBox.
4. Mount the directory where you cloned PongBuddy.  
   for example C:\Users\username\Downloads\PongBuddy
   ```powershell
    mount D: C:\Users\username\Downloads\PongBuddy
   ```
5. Navigate to the newly mounted directory D by typing 'D:'.
   ```powershell
   D:
   ```
6. Assemble MAIN.ASM file using MASM assembler in /tools/ and press enter for all the prompts.
   ```powershell
   tools\masm.exe MAIN.asm build\main.obj
   ```
   This will generate build\main.obj object file.
7. Link the object file generated from the previous steup using linker /tools/link.exe
   ```powershell
   tools\link.exe build\main.obj , build\main.exe
   ```
   This will generate an executable build\main.exe ready to be run.
