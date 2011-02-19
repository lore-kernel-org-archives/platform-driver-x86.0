From: Mattia Dongili <malattia@linux.it>
Subject: [0/8] sony-laptop for 2.6.39
Date: Sat, 19 Feb 2011 11:52:24 +0900
Message-ID: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60582
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752944Ab1BSDAQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

here's finally some cleanup and new features implemented for sony-laptop.
There is more brewing here (i.e. ALS for which for now sysfs files will be
added as platform attrbutes of the driver and mostly rework of the code to make
it cleaner) but I wanted to start getting this out to hopefully give it some
broader testing.
Hopefully in patch 8 I gave sufficient attribution to Javier and Marco who
kindly figured most of the details to use the new backlight handlers. Let me
know if there is a proper git meta-header instead.

Please apply for 2.6.39, I'll send the additional patches soon.

I'm also thinking it may be time to deprecate and start removing sonypi from
the tree, sony-laptop is still not 100% compatible (jogdial events are half
broken at least on my ancient GR and I think some very old vaio V wouldn't work
properly with sony-laptop, I'll find out details) but very little is known of
the SPIC device (that was driven by sonypi) and recent models have no
additional functionality provided via that device.
Any thoughts?

Thanks!
---
 Documentation/laptops/sony-laptop.txt |   37 ++-
 drivers/platform/x86/sony-laptop.c    |  492 ++++++++++++++++++++++++++-------
 include/linux/sonypi.h                |    1 +
 3 files changed, 421 insertions(+), 109 deletions(-)
-- 
mattia
:wq
