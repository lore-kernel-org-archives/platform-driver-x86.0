From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 09/15] fujitsu-laptop: Mark fujitsu_dmi_table[] DMI table as __initconst
Date: Wed, 16 Jul 2014 19:43:11 +0200
Message-ID: <1405532597-28262-10-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:43626 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965428AbaGPRns (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:48 -0400
Received: by mail-wi0-f170.google.com with SMTP id f8so5186793wiw.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:44 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Jonathan Woithe <jwoithe@just42.net>

The DMI table is only ever used during initialization. Mark it as
__initconst so its memory can be released afterwards -- roughly 1.5 kB.
In turn, the callback functions can be marked with __init, too.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Jonathan Woithe <jwoithe@just42.net>
---
 drivers/platform/x86/fujitsu-laptop.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e6f336270c..e9345f12ce 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -564,7 +564,7 @@ static struct platform_driver fujitsupf_driver = {
 		   }
 };
 
-static void dmi_check_cb_common(const struct dmi_system_id *id)
+static void __init dmi_check_cb_common(const struct dmi_system_id *id)
 {
 	pr_info("Identified laptop model '%s'\n", id->ident);
 	if (use_alt_lcd_levels == -1) {
@@ -578,7 +578,7 @@ static void dmi_check_cb_common(const struct dmi_system_id *id)
 	}
 }
 
-static int dmi_check_cb_s6410(const struct dmi_system_id *id)
+static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
 	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
@@ -586,7 +586,7 @@ static int dmi_check_cb_s6410(const struct dmi_system_id *id)
 	return 1;
 }
 
-static int dmi_check_cb_s6420(const struct dmi_system_id *id)
+static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
 	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
@@ -594,7 +594,7 @@ static int dmi_check_cb_s6420(const struct dmi_system_id *id)
 	return 1;
 }
 
-static int dmi_check_cb_p8010(const struct dmi_system_id *id)
+static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
 	fujitsu->keycode1 = KEY_HELP;	/* "Support" */
@@ -603,7 +603,7 @@ static int dmi_check_cb_p8010(const struct dmi_system_id *id)
 	return 1;
 }
 
-static struct dmi_system_id fujitsu_dmi_table[] = {
+static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 	{
 	 .ident = "Fujitsu Siemens S6410",
 	 .matches = {
-- 
1.7.10.4
