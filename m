From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 00/15] samsung-laptop updates
Date: Tue, 22 Nov 2011 23:02:31 +0100
Message-ID: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:60862 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757742Ab1KVWDI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Nov 2011 17:03:08 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Corentin Chary <corentincj@iksaif.net>

Hi Matthew, Greg

I recently got a Samsung Series 9 from Intel, so I took some
time to add support for some features.

In this series, I moved a lot of code, tried to follow more
closely the SABI interface, added some features, and did
some cleanup.

The patchs were only tested it on my laptop, so I'd greatly
appreciate any feedback.

I also propose myself as a maintainer for this driver, since
this laptop is now my primary system.

Thanks,

Corentin Chary (15):
  samsung-laptop: put all local variables in a single structure
  samsung-laptop: move code into init/exit functions
  samsung-laptop: don't handle backlight if handled by acpi/video
  samsung-laptop: use a sysfs group
  samsung-laptop: ehance SABI support
  samsung-laptop: add small debugfs interface
  samsung-laptop: remove selftest
  samsung-laptop: add battery life extender support
  samsung-laptop: add usb charge support
  samsung-laptop: cleanup KConfig
  samsung-laptop: add keyboard backlight support
  samsung-laptop: add true rfkill support for swsmi
  samsung-laptop: make the dmi check less strict
  samsung-laptop: dump model and version informations
  samsung-laptop: promote myself as maintainer of samsung-laptop

 .../ABI/testing/sysfs-driver-samsung-laptop        |   18 +
 MAINTAINERS                                        |    6 +
 drivers/platform/x86/Kconfig                       |   13 +-
 drivers/platform/x86/samsung-laptop.c              | 1645 +++++++++++++-------
 4 files changed, 1127 insertions(+), 555 deletions(-)

-- 
1.7.5.4
