From: Raul Gutierrez Segales <rgs@itevenworks.net>
Subject: [PATCH] Platform: fix samsung-laptop DMI identification for N220 model
Date: Wed, 31 Aug 2011 22:20:19 +0100
Message-ID: <1314825619-16262-1-git-send-email-rgs@collabora.co.uk>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63302 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755220Ab1HaVUg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 31 Aug 2011 17:20:36 -0400
Received: by wyh22 with SMTP id 22so490193wyh.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Aug 2011 14:20:35 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, Raul Gutierrez Segales <rgs@collabora.co.uk>

This is a follow-up for commit 78a7539b, which didn't cover the
Samsung N220 laptop. With this backlight brightness works nicely
on the N220 netbook.

Signed-off-by: Raul Gutierrez Segales <rgs@collabora.co.uk>
---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 3591630..40d187c 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -621,6 +621,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		.callback = dmi_check_cb,
 	},
 	{
+		.ident = "N220",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N220"),
+			DMI_MATCH(DMI_BOARD_NAME, "N220"),
+		},
+		.callback = dmi_check_cb,
+	},
+	{
 		.ident = "N150/N210/N220/N230",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR,
-- 
1.7.6
