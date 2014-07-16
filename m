From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 13/15] ideapad-laptop: Constify DMI table and other r/o variables
Date: Wed, 16 Jul 2014 19:43:15 +0200
Message-ID: <1405532597-28262-14-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:42018 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965428AbaGPRnt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:49 -0400
Received: by mail-we0-f176.google.com with SMTP id q58so1301240wes.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:48 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Ike Panhc <ike.pan@canonical.com>

Constify the rfkill_blacklist[] DMI table, the ideapad_rfk_data[] table
and the ideapad_attribute_group attribute group. There's no need to have
them writeable during runtime.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b4c495a62e..3966b81172 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -439,7 +439,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 	return supported ? attr->mode : 0;
 }
 
-static struct attribute_group ideapad_attribute_group = {
+static const struct attribute_group ideapad_attribute_group = {
 	.is_visible = ideapad_is_visible,
 	.attrs = ideapad_attributes
 };
@@ -454,7 +454,7 @@ struct ideapad_rfk_data {
 	int type;
 };
 
-const struct ideapad_rfk_data ideapad_rfk_data[] = {
+static const struct ideapad_rfk_data ideapad_rfk_data[] = {
 	{ "ideapad_wlan",    CFG_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLAN },
 	{ "ideapad_bluetooth", CFG_BT_BIT, VPCCMD_W_BT, RFKILL_TYPE_BLUETOOTH },
 	{ "ideapad_3g",        CFG_3G_BIT, VPCCMD_W_3G, RFKILL_TYPE_WWAN },
@@ -822,7 +822,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 }
 
 /* Blacklist for devices where the ideapad rfkill interface does not work */
-static struct dmi_system_id rfkill_blacklist[] = {
+static const struct dmi_system_id rfkill_blacklist[] = {
 	/* The Lenovo Yoga 2 11 always reports everything as blocked */
 	{
 		.ident = "Lenovo Yoga 2 11",
-- 
1.7.10.4
