From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 5/7] hp-wmi: clear rfkill device pointers when appropriate
Date: Sun, 20 Feb 2011 19:01:45 +0200
Message-ID: <1298221307-29980-6-git-send-email-anssi.hannula@iki.fi>
References: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from saarni.dnainternet.net ([83.102.40.136]:60908 "EHLO
	saarni.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754209Ab1BTRKm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 12:10:42 -0500
In-Reply-To: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

NULLify rfkill pointers during initialization. This prevents dereference
of invalid pointer in case the driver is rebound and some rfkill device
isn't detected anymore. Clear them also in hp_wmi_rfkill_setup failure
path so that rfkill initialization failure doesn't need to be fatal for
the whole driver.
---
 drivers/platform/x86/hp-wmi.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index f6a1c37..45b2bbe 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -587,14 +587,17 @@ static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
 	return 0;
 register_wwan_err:
 	rfkill_destroy(wwan_rfkill);
+	wwan_rfkill = NULL;
 	if (bluetooth_rfkill)
 		rfkill_unregister(bluetooth_rfkill);
 register_bluetooth_error:
 	rfkill_destroy(bluetooth_rfkill);
+	bluetooth_rfkill = NULL;
 	if (wifi_rfkill)
 		rfkill_unregister(wifi_rfkill);
 register_wifi_error:
 	rfkill_destroy(wifi_rfkill);
+	wifi_rfkill = NULL;
 	return err;
 }
 
@@ -602,6 +605,11 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 {
 	int err;
 
+	/* clear detected rfkill devices */
+	wifi_rfkill = NULL;
+	bluetooth_rfkill = NULL;
+	wwan_rfkill = NULL;
+
 	err = hp_wmi_rfkill_setup(device);
 	if (err)
 		return err;
-- 
1.7.3
