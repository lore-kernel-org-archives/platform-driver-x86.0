From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 11/15] hp-wmi: Add missing __init annotations to initialization code
Date: Wed, 16 Jul 2014 19:43:13 +0200
Message-ID: <1405532597-28262-12-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:54053 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965508AbaGPRnt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:49 -0400
Received: by mail-wi0-f169.google.com with SMTP id n3so6147540wiv.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:48 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

These functions are only called from other initialization routines, so
can be marked __init, too.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/platform/x86/hp-wmi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 484a8673b8..4c559640dc 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -295,7 +295,7 @@ static int hp_wmi_tablet_state(void)
 	return (state & 0x4) ? 1 : 0;
 }
 
-static int hp_wmi_bios_2009_later(void)
+static int __init hp_wmi_bios_2009_later(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
@@ -704,7 +704,7 @@ static void cleanup_sysfs(struct platform_device *device)
 	device_remove_file(&device->dev, &dev_attr_postcode);
 }
 
-static int hp_wmi_rfkill_setup(struct platform_device *device)
+static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 {
 	int err;
 	int wireless = 0;
@@ -806,7 +806,7 @@ register_wifi_error:
 	return err;
 }
 
-static int hp_wmi_rfkill2_setup(struct platform_device *device)
+static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 {
 	int err, i;
 	struct bios_rfkill2_state state;
-- 
1.7.10.4
