<h1 align="center"> IFSC Validator </h1> <br>
<p align="center">
<img src="https://drive.google.com/uc?export=view&id=1L8tt2OJ-UhmnlvETKo33y8CPE4pR0Qtl" width="450">
</p>
<p align="center">
  A mobile app to validate IFSC Codes using Razorpay API. Built using Flutter.
</p>
<p align="center">
  <a href="https://drive.google.com/file/d/14YH0as9G5IMUiYc6Yd5Z-JDuuwQxiYK7/view?usp=sharing">
    <img src="https://img.shields.io/badge/apk-demo-blue" width="100">
  </a>
</p>

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Packages Used](#packages-used)
- [Feedback](#feedback)
- [Build Process](#build-process)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Introduction
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) ![Status](
https://img.shields.io/badge/status-active-success?style=flat-square)

There are many APIs out there and one of them which I found interesting is the Razorpay IFSC API made by their own dev team. They came across the issue of not having a centralized API for validating and querying IFSC codes they built one and it is super easy to use and it is OPEN SOURCE! So, I thought of making a simple app which everyone can use for validating any IFSC Code before making a transaction using Flutter.

**Available ONLY for Android.**

## Features

* A simple & clean UI
* Checks if IFSC Code Exists
* Display details regarding the IFSC Code

## Packages Used

- [http](https://pub.dev/packages/http) - To make HTTP requests
- [pin_code_fields](https://pub.dev/packages/pin_code_fields) - Custom Pin Code Fields
- [rflutter_alert](https://pub.dev/packages/rflutter_alert) - Customn Modals for Success & Error Messages

## Feedback

Feel free to send me feedback on [Twitter](https://twitter.com/sunitshirke_88) or [file an issue](https://github.com/Maddoxx88/ifsc-validator/issues/new). Feature requests are always welcome. If you wish to contribute, please take a quick look at the [guidelines](./CONTRIBUTING.md)!

## Build Process

- Follow the [Flutter Guide](https://flutter.dev/docs/get-started/install) for getting started building a project with dart code. **A Mac is required if you wish to develop for iOS.**
- Clone or download the repo
- `flutter pub get` to install packages
- Connect Emulator or a physical device
- `flutter devices` to check if device is connected
- `flutter run` to run the app on the connected device

Please take a look at the [contributing guidelines](./CONTRIBUTING.md) for a detailed process on how to build your application as well as troubleshooting information.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details

## Acknowledgments

- Thanks to [Razorpay](https://github.com/razorpay) for making this awesome [IFSC API](https://github.com/razorpay/ifsc).

## Give it a ⭐ if you like it!
