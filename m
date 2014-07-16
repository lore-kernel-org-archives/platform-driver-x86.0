From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 07/15] dell-laptop: Mark dell_quirks[] DMI table as __initconst
Date: Wed, 16 Jul 2014 19:43:09 +0200
Message-ID: <1405532597-28262-8-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:49683 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965394AbaGPRno (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:44 -0400
Received: by mail-wi0-f181.google.com with SMTP id bs8so1774227wib.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:43 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

The dell_quirks[] DMI table is only ever used during initialization.
Mark it as __initconst so its memory can be released afterwards --
roughly 5.7 kB. In turn, the callback function can be marked with
__init, too.

Also the touchpad_led_init() function can be marked __init as it's only
referenced from dell_init() -- an __init function.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/platform/x86/dell-laptop.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index fed4111ac3..233d2ee598 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -70,7 +70,7 @@ static struct quirk_entry quirk_dell_vostro_v130 = {
 	.touchpad_led = 1,
 };
 
-static int dmi_matched(const struct dmi_system_id *dmi)
+static int __init dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
 	return 1;
@@ -123,7 +123,7 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, dell_device_table);
 
-static struct dmi_system_id dell_quirks[] = {
+static const struct dmi_system_id dell_quirks[] __initconst = {
 	{
 		.callback = dmi_matched,
 		.ident = "Dell Vostro V130",
@@ -780,7 +780,7 @@ static struct led_classdev touchpad_led = {
 	.flags = LED_CORE_SUSPENDRESUME,
 };
 
-static int touchpad_led_init(struct device *dev)
+static int __init touchpad_led_init(struct device *dev)
 {
 	return led_classdev_register(dev, &touchpad_led);
 }
-- 
1.7.10.4
