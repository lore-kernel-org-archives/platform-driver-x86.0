From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/7] sony-laptop changes for 3.15
Date: Mon, 10 Feb 2014 08:07:27 +0900
Message-ID: <1391987254-3103-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46368 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752168AbaBIXNw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 Feb 2014 18:13:52 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Hi Matthew,

could you please apply these patches?
There's a bunch of new functions made available for newer vaios (Pros mainly)
and a fix for keyboard backlight settings.

There's more to come, specifically a much bigger ALS support patch.

Thanks

Javier Achirica (7):
  sony-laptop: add support as Fn+1 as a hot key
  sony-laptop: Add support for lid resume settings on Vaio Pro
  sony-laptop: add panel_id function
  sony-laptop: add usb charge function
  sony-laptop: add fan speed regulation function
  sony-laptop: add hibernate on low battery function
  sony-laptop: adjust keyboard backlight values for off/auto/on

 drivers/platform/x86/sony-laptop.c | 463 +++++++++++++++++++++++++++++++++----
 1 file changed, 412 insertions(+), 51 deletions(-)

-- 
1.9.rc1
