From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 6/7] hp-wmi: make rfkill initialization failure non-fatal
Date: Sun, 20 Feb 2011 20:07:25 +0200
Message-ID: <1298225246-21991-7-git-send-email-anssi.hannula@iki.fi>
References: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sirokuusama.dnainternet.net ([83.102.40.133]:59091 "EHLO
	sirokuusama.dnainternet.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754579Ab1BTSHf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 13:07:35 -0500
In-Reply-To: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

hp_wmi_rfkill_setup cleans up after itself now, so failing completely is
no longer necessary.

Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
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
