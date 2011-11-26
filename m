From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH v2 00/16] samsung-laptop updates
Date: Sat, 26 Nov 2011 10:59:57 +0100
Message-ID: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:41497 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751053Ab1KZKAZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Nov 2011 05:00:25 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>

Hi Matthew, Greg

I recently got a Samsung Series 9 from Intel, so I took some
time to add support for some features.

In this series, I moved a lot of code, tried to follow more
closely the SABI interface, added some features, and did
some cleanups.

Patches were tested on my laptop, N210 and N150. I'd greatly
appreciateany feedback from other models.

I also propose myself as a maintainer for this driver, since
thislaptop is now my primary system.

Thanks,

Since v1:
 - Added bluetooth/wlan detection
 - Added some informations about the debugfs interface
 - Added a sdiag file in debugfs
 - Removed errors when trying to detect features
 - Fixed some typos
 - Tested on N210 and N150 without any regression

Corentin Chary (16):
  samsung-laptop: put all local variables in a single structure
  samsung-laptop: move code into init/exit functions
  samsung-laptop: don't handle backlight if handled by acpi/video
  samsung-laptop: use a sysfs group
  samsung-laptop: ehance SABI support
  samsung-laptop: add a small debugfs interface
  samsung-laptop: remove selftest
  samsung-laptop: add battery life extender support
  samsung-laptop: add usb charge support
  samsung-laptop: cleanup KConfig
  samsung-laptop: add keyboard backlight support
  samsung-laptop: add true rfkill support for swsmi
  samsung-laptop: make the dmi check less strict
  samsung-laptop: dump model and version informations
  samsung-laptop: tweak traces
  samsung-laptop: promote myself as maintainer of samsung-laptop

 .../ABI/testing/sysfs-driver-samsung-laptop        |   18 +
 MAINTAINERS                                        |    6 +
 drivers/platform/x86/Kconfig                       |   13 +-
 drivers/platform/x86/samsung-laptop.c              | 1680 +++++++++++++-------
 4 files changed, 1165 insertions(+), 552 deletions(-)

-- 
1.7.5.4
