From: Ramiro Morales <cramm0@gmail.com>
Subject: [PATCH 1/1] thinkpad-acpi: Reduce screen brightness user visible noise.
Date: Mon, 15 Jun 2015 12:29:14 -0300
Message-ID: <1434382154-3046-1-git-send-email-cramm0@gmail.com>
References: <20150614022755.GB26753@khazad-dum.debian.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36128 "EHLO
	mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755562AbbFOP3f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 11:29:35 -0400
Received: by qkfe185 with SMTP id e185so15031358qkf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2015 08:29:34 -0700 (PDT)
In-Reply-To: <20150614022755.GB26753@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: hmh@hmh.eng.br, dvhart@infradead.org
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Ramiro Morales <cramm0@gmail.com>

Implement change in logging during screen brightness capabilities
detection as suggested in
https://www.mail-archive.com/ibm-acpi-devel%40lists.sourceforge.net/msg03484.html

Signed-off-by: Ramiro Morales <cramm0@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 28f3281..b48efc9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6450,19 +6450,16 @@ static void __init tpacpi_detect_brightness_capabilities(void)
 	switch (b) {
 	case 16:
 		bright_maxlvl = 15;
-		pr_info("detected a 16-level brightness capable ThinkPad\n");
 		break;
 	case 8:
 	case 0:
 		bright_maxlvl = 7;
-		pr_info("detected a 8-level brightness capable ThinkPad\n");
 		break;
 	default:
-		pr_err("Unsupported brightness interface, "
-		       "please contact %s\n", TPACPI_MAIL);
 		tp_features.bright_unkfw = 1;
 		bright_maxlvl = b - 1;
 	}
+	pr_debug("firmware reports %d brightness levels\n", bright_maxlvl);
 }
 
 static int __init brightness_init(struct ibm_init_struct *iibm)
@@ -6482,6 +6479,9 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 
 	/* if it is unknown, we don't handle it: it wouldn't be safe */
 	if (tp_features.bright_unkfw)
+		dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
+			   "Unsupported brightness mode, use acpi video "
+			   "or gpu drivers");
 		return 1;
 
 	if (!brightness_enable) {
-- 
1.9.1
