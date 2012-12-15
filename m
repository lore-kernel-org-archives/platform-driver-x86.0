From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v4 00/12] Add MSI Wind U90/U100 support
Date: Sat, 15 Dec 2012 19:31:24 +0200
Message-ID: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:38941 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab2LORb7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Dec 2012 12:31:59 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so1773744eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Dec 2012 09:31:58 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu

This series adds support for MSI Wind U90/U100 laptops to msi-laptop
platform driver and to msi-wmi WMI driver.

Changes comparing to the first series:
	* new patch for quirk tables in msi-laptop;
	* new patch to disable brightness control for machines with
	  newer EC;
	* new patch to fix memory leak in msi-wmi;
	* new patch to add MSI Wind support in msi-wmi;
	* fixed code that breaks compatibility with old models;
	* fixed bug with touchpad toggle key filtering appeared in
	  the first series;
	* separated and cleaned up msi-wmi patch;
	* msi-wmi: converted last_pressed from array to simple variable
	  in order to allow key codes in keymap to be sparse. This
	  fixes a bug with pointer arithmetics appeared in series v3.

Tested on MSI Wind U100Plus laptop.

----------------------------------------------------------------
Lee, Chun-Yi (1):
      msi-laptop: merge quirk tables to one

Maxim Mikityanskiy (11):
      msi-laptop: Use proper return codes instead of -1
      msi-laptop: Work around gcc warning
      msi-laptop: Add MSI Wind U90/U100 support
      msi-laptop: Add missing ABI documentation
      msi-laptop: Disable brightness control for new EC
      msi-wmi: Fix memory leak
      msi-wmi: Avoid repeating constants
      msi-wmi: Use enums for scancodes
      msi-wmi: Make keys and backlight independent
      msi-wmi: Introduced quirk_last_pressed
      msi-wmi: Add MSI Wind support

 Documentation/ABI/testing/sysfs-platform-msi-laptop |  83 +++++++++++++++++++
 drivers/platform/x86/msi-laptop.c                   | 374 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
 drivers/platform/x86/msi-wmi.c                      | 224 ++++++++++++++++++++++++++++++++------------------
 3 files changed, 512 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-laptop
