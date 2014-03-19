From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH RESEND] fujitsu-laptop: Drop unneeded include
Date: Wed, 19 Mar 2014 19:38:46 +0100
Message-ID: <20140319193846.22821b12@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36799 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751230AbaCSSit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Mar 2014 14:38:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Jonathan Woithe <jwoithe@just42.net>, Matthew Garrett <matthew.garrett@nebula.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

The fujitsu-laptop driver includes <linux/video_output.h> but doesn't
call any of its functions. Drop the unneeded include to avoid
unnecessary driver rebuilds.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Acked-by: Jonathan Woithe <jwoithe@just42.net>
Cc: Matthew Garrett <matthew.garrett@nebula.com>
---
Resending with Rafael in Cc so that he can include it in a larger
clean-up patch series.

 drivers/platform/x86/fujitsu-laptop.c |    1 -
 1 file changed, 1 deletion(-)

--- linux-3.14-rc6.orig/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:31:04.273862743 +0100
+++ linux-3.14-rc6/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:31:19.961145958 +0100
@@ -66,7 +66,6 @@
 #include <linux/backlight.h>
 #include <linux/input.h>
 #include <linux/kfifo.h>
-#include <linux/video_output.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)


-- 
Jean Delvare
SUSE L3 Support
