# Roblox Showcase Rojo Template

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ryanlua/rojo-showcase-template?quickstart=1)

</div>

A Rojo template for Roblox showcases. Includes starter scripts every showcase should have for the best user experience and player acquisition.

Made for those getting into Rojo or wanting to explore how a showcase can be built with Rojo. This template is designed to be able to be used for all of your showcases using just one codebase as opposed to having different scripts for each showcase.

Used in my collection of open-source showcases under the Roblox community, [The Winner Games](https://www.roblox.com/communities/4973811):

* [House in the Woods](https://www.roblox.com/games/5813911804)
* [Nature](https://www.roblox.com/games/7442772872)
* [A New Winter](https://www.roblox.com/games/6279686336)
* [Isolated Café](https://www.roblox.com/games/6200761971)

## Features

* High performance means no performance

Built for being optimized and performant, this template is designed to be as lightweight as possible to ensure that no performance is lost.

* Automatic translation ready

Ready to be localized and translated for your users using [Automatic Translation](https://create.roblox.com/docs/production/localization#automatic-translations) into 15 different languages, with right-to-left language support.

* Modular and Customizable

Each script is modular and can be easily disabled or customized to fit your needs. Delete or disable any scripts you don't need or want. Easily customize scripts using [Instance Attributes](https://create.roblox.com/docs/studio/properties#instance-attributes).

* Strict type-checking and well-documented

Code that's easy for the eyes to read with [strict type-checking](https://create.roblox.com/docs/luau/type-checking) to ensure that your code is bug-free. Comments on each piece of code to help you understand what each part does.

## Installation

### Prerequisites

* [Rojo](https://rojo.space/)
* [Roblox Studio](https://www.roblox.com/create)
* [Visual Studio Code](https://code.visualstudio.com/)

Installation is easy and just like any other Rojo project.

#### Using Visual Studio Code

1. Clone the repository
1. Open the project in Visual Studio Code with Rojo installed (extension or CLI)
1. Run `rojo serve` in the terminal or use the Rojo extension to serve
1. Open Roblox Studio and connect to the Rojo server

#### Using GitHub Codespaces

1. Click on the **Open in GitHub Codespaces** button at the top of the README
1. Wait for the codespace to be created
1. Run `rojo serve` in the terminal or use the Rojo extension to serve
1. Change the port visibility of `Rojo (34872)` to `Public`
1. Open Roblox Studio and connect to the Rojo server
    * Remove the `https://` at the beginning and the `/` of the forwarded address. It should look something like this: `probable-memory-w44vgv9v4vpfjwj-34872.app.github.dev`
    * Set the port as `80`

Now accept those changes and your showcase is ready to go. Make sure to change the `BadgeId` in the `JoinBadge` script to your badge ID.

## Usage

This template is designed to be used for all of your showcases. You can easily customize and disable scripts to fit your needs. Each script is well-documented and has strict type-checking to ensure that your code is bug-free.

### Customizing Scripts

Each script is customizable using [Instance Attributes](https://create.roblox.com/docs/studio/properties#instance-attributes). You can easily change the properties of each script to fit your needs. If you don't want a script or don't need it them you can disable or delete the script.

## Contributing

Feel free to contribute to this project by creating a pull request. Please ensure that you follow the [Code of Conduct](CODE_OF_CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md) before contributing.
