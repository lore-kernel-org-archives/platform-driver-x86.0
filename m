From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 0/2] Use acpi_dev_present()
Date: Sun, 17 Jan 2016 21:49:41 +0100
Message-ID: <cover.1453060661.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:35489 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbcAQUt5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 15:49:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

Hi Darren,

the acpi_dev_present() API has now landed in Linus' tree.
Thus, after Linus' tree gets merged back into yours,
it would be possible to use the API in the pdx86 drivers
as per the following patches.

I've also pushed these to GitHub in case anyone prefers
perusing them in a browser:
https://github.com/l1k/linux/commits/acpi_dev_present_pdx86

This is a repost of patches submitted in November, the only
change is one line added to the commit messages to reference
the commit which introduces the API:
http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8004
http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8005

Thanks,

Lukas


Lukas Wunner (2):
  eeepc-wmi: Use acpi_dev_present()
  acer-wmi: Use acpi_dev_present()

 drivers/platform/x86/acer-wmi.c  | 16 ++++------------
 drivers/platform/x86/eeepc-wmi.c | 24 ++----------------------
 2 files changed, 6 insertions(+), 34 deletions(-)

-- 
1.8.5.2 (Apple Git-48)
