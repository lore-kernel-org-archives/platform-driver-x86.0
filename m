From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 00/11] ALS and other new functions
Date: Fri, 21 Mar 2014 08:01:11 +0900
Message-ID: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42153 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759799AbaCTXJO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:14 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Matthew,

This is partially a resend of the previous patch-set (first 7  patches) plus
additional changes to queue up for 3.15.

The largest change is support for ALS on recent Vaios. The work is a respin of
what Javier Achirica and Marco Chiappero had done almost 3 years ago but ported
to IIO (Javier did that).
The downside is that when ALS control is enabled, changes to the backlight via
_BCM become notifications to SNC that should instead act. Unfortunately there
is no obvious way to get the brightness level that was requested. To workaround
that I have added a notification callback to the backlight driver. It seems a
generally useful mechanism and is definitely useful in this case.
The ALS patch has still some rough edges but it has been used by many people
for years now.

Javier Achirica (9):
  sony-laptop: add support as Fn+1 as a hot key
  sony-laptop: Add support for lid resume settings on Vaio Pro
  sony-laptop: add panel_id function
  sony-laptop: add usb charge function
  sony-laptop: add fan speed regulation function
  sony-laptop: add hibernate on low battery function
  sony-laptop: adjust keyboard backlight values for off/auto/on
  sony-laptop: add smart connect control function
  sony-laptop: als support

Mattia Dongili (2):
  backlight: introduce inter-driver notification of changes
  sony-laptop: remove useless sony-laptop versioning

 Documentation/laptops/sony-laptop.txt |   31 +
 drivers/platform/x86/Kconfig          |    1 +
 drivers/platform/x86/sony-laptop.c    | 1668 +++++++++++++++++++++++++++++++--
 drivers/video/backlight/backlight.c   |   10 +
 include/linux/backlight.h             |    3 +
 5 files changed, 1631 insertions(+), 82 deletions(-)

-- 
1.9.0
