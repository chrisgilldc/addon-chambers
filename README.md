<p align="center">
  <img align="center" alt="logo" src="logo.png">
</p>

# Chambers
### Near-Live Status of the United States Congress

This add-on uses the [Chambers](https://github.com/chrisgilldc/chambers) python library to monitor the status of 
Congress and provide (near) real time status of both the House and Senate. 

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]



[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fchrisgilldc%2Faddon-chambers)

## About

Collects data from three sources to provide the current status of the House of Representatives and the Senate.

For each chamber, four entities are created:
* Convened - Is the chamber currently convened?
* Convened At - When the chamber convened, if it is. Otherwise unknown.
* Convenes At - If adjourned, when the chamber is scheduled to convene. Otherwise, unknown.
* Adjourned At - If adjourned, when the chamber adjourned. Otherwise, unknown.

A 'Running' sensor for the Add-on is also provided.

### Recess

The House and Senate handle recesses and adjournment differently.

House recesses are currently ignored, and thus the House will be considered "convened" until formal adjournment, even 
if at the moment is in recess. 

The Senate may recess at the end of a calendar day until a future day. Although technically not adjourned, this add-on 
considers the chamber 'adjourned' for logical purposes. An additional sensor may be provided in the future.

See [Sessions, Adjournments and Recesses of Congress](https://www.congress.gov/crs-product/R42977) for the intricate details.

## Requirements

This add-on uses MQTT to communicate internally. An MQTT broker (ie: Mosquitto) is required.

## Limitations

This add-on depends on parsing XML and JSON data provided by the House and Senate. The House's XML is, in my experience,
both rich and consistent. The Senate's is....not. Status of the Senate relies on a fair bit of string parsing. This
has been tested over several weeks and appears to 

## Future Development

1. Expose the House's 'current activity', ie: Debate on Bill X, Voting on Bill Y, etc. 
2. Allow a force update command to update one or both houses.
3. Perhaps configuration options, if the built-in defaults seem not to work. This may include update frequency, 
topic base, etc. 

<!--

Notes to developers after forking or using the github template feature:
- While developing comment out the 'image' key from 'example/config.yaml' to make the supervisor build the addon
  - Remember to put this back when pushing up your changes.
- When you merge to the 'main' branch of your repository a new build will be triggered.
  - Make sure you adjust the 'version' key in 'example/config.yaml' when you do that. - DONE
  - Make sure you update 'example/CHANGELOG.md' when you do that.
  - The first time this runs you might need to adjust the image configuration on github container registry to make it public
  - You may also need to adjust the github Actions configuration (Settings > Actions > General > Workflow > Read & Write)
- Adjust the 'image' key in 'example/config.yaml' so it points to your username instead of 'home-assistant'.
  - This is where the build images will be published to.
- Rename the example directory.
  - The 'slug' key in 'example/config.yaml' should match the directory name.
- Adjust all keys/url's that points to 'home-assistant' to now point to your user/fork.
- Share your repository on the forums https://community.home-assistant.io/c/projects/9
- Do awesome stuff!
 -->

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
