# SvgGazeboCones
Description of a process of translating a race track traced with bezier-curves into evenly spaced cones ready for Gazebo.

## Tools needed:
- Powershell
- Inkscape
- Notepad / VSCode in my case for copying text

## Data needed:
- Top-view image of the track
- Desired cone spacing

## Process:
1. Setup canvas  
1.1. Go to File->Document Properties->Grids and set Spacing to desired track width in meters + Major Grid line every "1"  
1.2. Download image of your track and import it into inkscape  
1.3. Align center of the track with top-left corner of the canvas  
1.4. Resize the image, so a single grid space matches track-width  
<img src=https://i.imgur.com/zURDD6y.png width=500 alt="Proper canvas setup">  

2. Trace the track  
2.1. Make sure that the Layer you are working on has no transform on it (through XML Editor)  
2.2. Trace through middle of the desired track with bezier-curves  
2.3. Adjust stroke width of the line to track width  
<img src=https://i.imgur.com/aMMf92l.png width=500 alt="Track defined with stroke">  

3. Define track boundaries  
3.1. Select the curve and select Path->Stroke to Path  
3.2. Now again Path->Break Apart  
3.3. Select each of the created curves, disable their Fill and enable a tight Stroke  

4. Create cone placeholder  
4.1. Create a small circle representing our cone  
4.2. Select Path->Object to path on the circle  

5. Create pattern along the lines  
5.1. Select our circle, then Shift select one of the lines  
5.2. Go to Extensions->Generate from path->Pattern along path  
5.3. Set Repeated, Snake and Space between copies to desired value (it will match to meters in Gazebo)  
5.4. Check your results with live preview or Apply  
<img src=https://i.imgur.com/1jbqVdd.png width=500 alt="Cone pattern">  

6. Separate cones into individual objects  
6.1. Create layers for inside and outside cones  
6.2. Move the now created "path" with cones to their own layers  
6.3. Select them and Path->Break Apart, now the Layers are filled with their cones  

7. Convert cones from path to object, so they have center position in their description (x, y)  
7.1. Open XML editor or Objects menu (XML editor is preferable)  
7.2. Now select first cone and press Alt+I on your keyboard (It does: Object->Pattern->Objects to pattern)  
7.3. Now we have to do this for all cones individually, but in XML editor you can click in one place and do the Alt+I for quick result  

8. Make sure once again, that none of the layers have transform on them (XML editor)  

9. Convert cones into SDF format  
9.1. Save the SVG into easy to reach place  
9.2. Modify the contents in your favorite text editor into a pattern like in the examplary file.  
9.3. Pass the file through Powershell script  

10. Copy contents of the generated file to .world file and test results in Gazebo
