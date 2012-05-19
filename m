From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 00/19] sony-laptop: support for new functions
Date: Sat, 19 May 2012 22:35:43 +0900
Message-ID: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47651 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757639Ab2ESNpO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:14 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

here's the old series from Marco Chiappero adjusted for inclusion. Most of the
patches are more or less the same as he sent with the notable exception of the
ALS code for the "managed" backlight regulation (the original code was creating
a backlight interface within the platform sysfs tree to provide a different way
of setting lid brightness).

I tried to note the changes that I did to the original code in the commit
messages but left the author as it was. Hopefully that is fine.

Javier Achirica (1):
      sony-laptop: add the ALS interface via SNC

Marco Chiappero (12):
      sony-laptop: use soft rfkill status stored in hw
      sony-laptop: improve SNC initialization and acpi notify callback code
      sony-laptop: support battery care functions
      sony-laptop: add thermal profiles support
      sony-laptop: g-shock HD protection function
      sony-laptop: support automatic resume on lid open
      sony-laptop: add high speed battery charging function
      sony-laptop: new keyboard backlight handle
      sony-laptop: add support for more WWAN modems
      sony-laptop: add missing Fn key combos for 0x100 handlers
      sony-laptop: add touchpad enable/disable function
      sony-laptop: notify userspace of GFX switch position changes

Mattia Dongili (6):
      sony-laptop: fix return path when no ACPI buffer is allocated
      sony-laptop: generalise ACPI calls into SNC functions
      sony-laptop: use kstrtoul to parse sysfs values
      sony-laptop: additional debug statements
      sony-laptop: adjust error handling in finding SNC handles
      sony-laptop: use an enum for SNC event types

 drivers/platform/x86/sony-laptop.c | 2901 +++++++++++++++++++++++++++++++-----
 1 file changed, 2552 insertions(+), 349 deletions(-)

-- 
mattia
:wq
