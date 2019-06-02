# Gifer
---
A bash script that converts a series of images into a gif.
The script requires a system that can run bash, and requires the [imagemagick](https://imagemagick.org/index.php) package. To get imagemagick:


**Mac:**

```bash
brew install imagemagick
```

**Linux**

```bash
sudo apt-get install imagemagick
```


## How to Run

1. Download/Clone the repo
2. Place your images in the input folder directory (in/ by default). Your images should be numbered in the order that they should appear in the gif. Noise characters are allowed, the first does not need to start at 0, and the file names can skip numbers in between, as long as the images all have the same extension and each contain a number in their name that puts them in sequential order. For example:

1.png                     --> 00001.png
foo2.png                  --> 00002.png
itcanbe10inthemiddle.png  --> 00010.png
11.png                    --> 00011.png


**On macOS**

3. Open terminal in the project folder. Run:
```bash 
bash gifer-mac.sh
``` 

**On Linux**

3. Open terminal in the project folder. Run:
```bash
bash gifer.sh
```

4. Following the prompts and input the correct settings. Press enter for the default setting at each prompt.

5. Check the output folder directory, viola! You now have a gif!


## Options

Option | Default | Description
--- | --- | ---
infolder | in/ | The folder that the images are in.
outfolder | out/ | The folder that the output gif will be placed by the program.
imgext | .png | The extension of the image files
outputfile | output.gif | The name of the output file
delay | 4 | The delay in ms between when each image is shown (default value of 4ms means the gif is displaying at 25fps)
resize | 100 | The percentage of the original image sizes to the gif. Default value of 100 keeps the gif size the same as the images.


### Example
![circle.gif](/out/output.gif)
