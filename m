From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 6/7] hp-wmi: make rfkill initialization failure non-fatal
Date: Sun, 20 Feb 2011 19:01:46 +0200
Message-ID: <1298221307-29980-7-git-send-email-anssi.hannula@iki.fi>
References: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sinikuusama.dnainternet.net ([83.102.40.134]:60958 "EHLO
	sinikuusama.dnainternet.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754393Ab1BTRMV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 12:12:21 -0500
In-Reply-To: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

hp_wmi_rfkill_setup cleans up after itself now, so failing completely is
no longer necessary.
---
 drivers/platform/x86/hp-wmi.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 45b2bbe..524ffab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -610,9 +610,7 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 	bluetooth_rfkill = NULL;
 	wwan_rfkill = NULL;
 
-	err = hp_wmi_rfkill_setup(device);
-	if (err)
-		return err;
+	hp_wmi_rfkill_setup(device);
 
 	err = device_create_file(&device->dev, &dev_attr_display);
 	if (err)
-- 
1.7.3
