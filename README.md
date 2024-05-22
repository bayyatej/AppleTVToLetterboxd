# AppleTVToLetterboxd README

## Description

AppleTVToLetterboxd is a small Applescript which exports a description of all the movies in your AppleTV library to a CSV file which can be fed to the [Letterboxd importer](https://letterboxd.com/about/importing-data/).

## Cool, how do I use it?

1. Make sure you have the AppleTV app installed on your Mac and are signed in
2. Download the `exporter.scpt` file to the location of your choice on your Mac
3. Open the Terminal app and navigate to the folder you downloaded `exporter.scpt` to. 
   - For example, if you downloaded the script to your `Downloads` folder you would run `cd ~/Downloads` to navigate to this folder
4. Run `osascript exporter.scpt` and follow any prompts to export your library to a CSV stored on your desktop. When the script is done the CSV will appear on your desktop with the name `appleTVLetterboxdExport.csv`.