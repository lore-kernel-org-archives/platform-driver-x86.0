From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] thinkpad_acpi: Fix inconsistent mute LED after resume
Date: Wed, 12 Feb 2014 16:32:45 +0100
Message-ID: <1392219165-20888-1-git-send-email-tiwai@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44592 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751269AbaBLPcq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Feb 2014 10:32:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, David Henningsson <david.henningsson@canonical.com>

The mute LED states have to be restored after resume.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=70351
Cc: <stable@vger.kernel.org> [v3.13+]
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/thinkpad_acpi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index defb6afc1409..e2a91c845ac9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8447,9 +8447,21 @@ static void mute_led_exit(void)
 		tpacpi_led_set(i, false);
 }
 
+static void mute_led_resume(void)
+{
+	int i;
+
+	for (i = 0; i < TPACPI_LED_MAX; i++) {
+		struct tp_led_table *t = &led_tables[i];
+		if (t->state >= 0)
+			mute_led_on_off(t, t->state);
+	}
+}
+
 static struct ibm_struct mute_led_driver_data = {
 	.name = "mute_led",
 	.exit = mute_led_exit,
+	.resume = mute_led_resume,
 };
 
 /****************************************************************************
-- 
1.8.5.2
