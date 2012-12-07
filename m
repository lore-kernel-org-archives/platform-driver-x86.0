From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 00/12] Add MSI Wind U90/U100 support
Date: Fri,  7 Dec 2012 15:49:10 +0200
Message-ID: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030293Ab2LGNtq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:49:46 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:49:45 -0800 (PST)
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
	* separated and cleaned up msi-wmi patch.

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
 drivers/platform/x86/msi-wmi.c                      | 213 +++++++++++++++++++++++++++++++----------------
 3 files changed, 507 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-laptop
