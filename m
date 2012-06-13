From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] sony-laptop: correct find_snc_handle failure checks
Date: Thu, 14 Jun 2012 06:36:02 +0900
Message-ID: <1339623362-12706-1-git-send-email-malattia@linux.it>
References: <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:37876 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465Ab2FMVgH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Jun 2012 17:36:07 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Since bab7084c745bf4d75b760728387f375fd34dc683, find_snc_handle
returns -EINVAL, not -1.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---

Hi Matthew,
this bug is a bug present in current 3.5-rc could you please pick this patch
up?
The patch will apply fine on top of the other series I sent, let me know if I
should rebase it on something else.

Thanks

 drivers/platform/x86/sony-laptop.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 3617858..f4fc73f 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2555,19 +2555,19 @@ static void sony_nc_backlight_setup(void)
 	const struct backlight_ops *ops = NULL;
 	struct backlight_properties props;
 
-	if (sony_find_snc_handle(0x12f) != -1) {
+	if (sony_find_snc_handle(0x12f) >= 0) {
 		ops = &sony_backlight_ng_ops;
 		sony_bl_props.cmd_base = 0x0100;
 		sony_nc_backlight_ng_read_limits(0x12f, &sony_bl_props);
 		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
-	} else if (sony_find_snc_handle(0x137) != -1) {
+	} else if (sony_find_snc_handle(0x137) >= 0) {
 		ops = &sony_backlight_ng_ops;
 		sony_bl_props.cmd_base = 0x0100;
 		sony_nc_backlight_ng_read_limits(0x137, &sony_bl_props);
 		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
-	} else if (sony_find_snc_handle(0x143) != -1) {
+	} else if (sony_find_snc_handle(0x143) >= 0) {
 		ops = &sony_backlight_ng_ops;
 		sony_bl_props.cmd_base = 0x3000;
 		sony_nc_backlight_ng_read_limits(0x143, &sony_bl_props);
-- 
1.7.10
