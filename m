From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v2 0/8] Add MSI Wind U90/U100 support
Date: Fri, 30 Nov 2012 18:04:29 +0200
Message-ID: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62761 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933180Ab2K3QFB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Nov 2012 11:05:01 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so380947eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Nov 2012 08:05:00 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu

This series adds support for MSI Wind U90/U100 laptops to msi-laptop
platform driver and to msi-wmi WMI driver.

Changes comparing to previous series:
	* new patch for quirk tables in msi-laptop;
	* new patch to disable brightness control for machines with
	  newer EC;
	* new patch to fix memory leak in msi-wmi;
	* new patch to add MSI Wind support in msi-wmi;
	* fixed code that breaks compatibility with old models;
	* fixed bug with touchpad toggle key filtering appeared in
	  previous series.

Tested on MSI Wind U100Plus laptop.

----------------------------------------------------------------
Lee, Chun-Yi (1):
      msi-laptop: merge quirk tables to one

Maxim Mikityanskiy (7):
      msi-laptop: Use proper return codes instead of -1
      msi-laptop: Work around gcc warning
      msi-laptop: Add MSI Wind U90/U100 support
      msi-laptop: Add missing ABI documentation
      msi-laptop: Disable brightness control for new EC
      msi-wmi: Fix memory leak
      msi-wmi: Add MSI Wind support

 Documentation/ABI/testing/sysfs-platform-msi-laptop |  83 +++++++++++++++++++
 drivers/platform/x86/msi-laptop.c                   | 374 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
 drivers/platform/x86/msi-wmi.c                      | 259 +++++++++++++++++++++++++++++++++++++++------------------
 3 files changed, 546 insertions(+), 170 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-laptop
