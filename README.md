<h1 align="center" >Vim.Config</h1>

<p align="center" >Personal vim configuration using vimscript</p>

<p align="center">
 <img alt="banner_01" src="https://img.shields.io/github/last-commit/EddyBel/Vim.Config?color=%23AED6F1&style=for-the-badge" />
 <img alt="banner_02" src="https://img.shields.io/github/license/EddyBel/Vim.Config?color=%23EAECEE&style=for-the-badge" />
 <img alt="banner_03" src="https://img.shields.io/github/languages/top/EddyBel/Vim.Config?color=%23F9E79F&style=for-the-badge" />
 <img alt="banner_04" src="https://img.shields.io/github/languages/count/EddyBel/Vim.Config?color=%23ABEBC6&style=for-the-badge" />
 <img alt="banner_05" src="https://img.shields.io/github/languages/code-size/EddyBel/Vim.Config?color=%23F1948A&style=for-the-badge" />
</p>

<p align="center">
  <img alt="preview" src="./assets/Preview.png" />
</p>

Vim.Config is a configuration of Vim as an integrated development environment (IDE) designed to boost your productivity and programming efficiency! This repository focuses on providing a seamless and customizable experience for developers who prefer to use Vim as their primary text editor.

## 🔨 Requirements

- [Vim >= 7.0](https://github.com/vim/vim)
- [VimPlug](https://github.com/junegunn/vim-plug)
- [NerdFonts (Recommended source: FiraCode Nerd Font)](https://www.nerdfonts.com/)
- [NodeJS](https://nodejs.org/en/)
- [Python](https://www.python.org/)

## 🦉 Features

- [x] Multi-language support.
- [x] Multi-language formatting
- [x] Convenient and easy keyboard shortcuts
- [x] Pleasant interface design

## How to install

### Step by step installation

1. Once you have the requirements correctly installed you can install the vim configuration with the following commands.

2. The first thing is to clone the `coc-settings.json` configuration, this configuration handles the syntax parser, then you can clone the configuration hosted in the same .vimrc file.

   _Linux_

   ```bash
   curl -fLo ~/.vim/coc-settings.json --create-dirs \
       https://raw.githubusercontent.com/EddyBel/Vim.Config/master/coc-settings.json
   ```

   ```bash
   curl -fLo ~/.vimrc --create-dirs \
       https://raw.githubusercontent.com/EddyBel/Vim.Config/master/.vimrc
   ```

   _Windows_

   ```sh
   iwr -useb https://raw.githubusercontent.com/EddyBel/Vim.Config/master/coc-settings.json |`
       ni $HOME/vimfiles/coc-settings.json -Force
   ```

   ```sh
   iwr -useb https://raw.githubusercontent.com/EddyBel/Vim.Config/master/.vimrc |`
       ni $HOME/.vimrc -Force
   ```

3. To finish you must open the vim editor in the `.vimrc` file and execute the command `:PlugInstall` this will install all the plugins listed in the configuration.

   _Windows_

   ```sh
   vim $HOME/.vimrc
   ```

   _Linux_

   ```bash
   vim ~/.vimrc
   ```

## 🎢 Project status

The project is constantly changing because it is my usual code editor and I will be improving and adding things as I see fit.

## 📑 LICENCE

This project is released under the terms of the MIT license. The MIT license allows users to use, copy, modify and distribute the source code of the project with certain restrictions and requirements. For more information on the terms and conditions of the MIT license, please refer to the license file included with this project or visit https://opensource.org/licenses/MIT.

---

<p align="center">
  <a href="https://github.com/EddyBel" target="_blank">
    <img alt="Github" src="https://img.shields.io/badge/GitHub-%2312100E.svg?&style=for-the-badge&logo=Github&logoColor=white" />
  </a> 
  <a href="https://www.linkedin.com/in/eduardo-rangel-eddybel/" target="_blank">
    <img alt="LinkedIn" src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />
  </a> 
</p>
