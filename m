From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 0/6] msi-laptop: Add MSI Wind U90/U100 support
Date: Sun, 25 Nov 2012 00:28:55 +0200
Message-ID: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:51195 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab2KXW3P (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Nov 2012 17:29:15 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so3959552eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Nov 2012 14:29:14 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

This series adds support for MSI Wind U90/U100 laptops to msi-laptop
platform driver and adds new driver msi-wind-wmi that provides basic
support for WMI found in MSI Wind laptops.

Tested on MSI Wind U100Plus laptop.

----------------------------------------------------------------
Maxim Mikityanskiy (6):
      msi-laptop: Use proper return codes instead of -1
      msi-laptop: Work around gcc warning
      msi-laptop: Code cleanups
      msi-laptop: Add MSI Wind U90/U100 support
      msi-laptop: Add missing ABI documentation
      Add MSI Wind WMI support

 Documentation/ABI/testing/sysfs-platform-msi-laptop |  83 +++++++++++++++++++++++++
 drivers/platform/x86/Kconfig                        |  13 ++++
 drivers/platform/x86/Makefile                       |   1 +
 drivers/platform/x86/msi-laptop.c                   | 276 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/platform/x86/msi-wind-wmi.c                 | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 466 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-laptop
 create mode 100644 drivers/platform/x86/msi-wind-wmi.c
