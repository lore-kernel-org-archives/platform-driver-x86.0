From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 5/6] Platform: x86: chromeos_laptop - Add HP Chromebook 14
Date: Sun, 20 Oct 2013 20:58:28 -0700
Message-ID: <1382327909-6140-6-git-send-email-bleung@chromium.org>
References: <1382327909-6140-1-git-send-email-bleung@chromium.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:59758 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752663Ab3JUD6z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Oct 2013 23:58:55 -0400
Received: by mail-pd0-f177.google.com with SMTP id p10so4756536pdj.22
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Oct 2013 20:58:54 -0700 (PDT)
In-Reply-To: <1382327909-6140-1-git-send-email-bleung@chromium.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, adurbin@chromium.org, dlaurie@chromium.org, olofj@chromium.org, enselic@gmail.com
Cc: bleung@chromium.org

Add support for the trackpad on HP Chromebook 14.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index 57ded03..a9ab335 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -378,6 +378,13 @@ static struct chromeos_laptop chromebook_pixel = {
 	},
 };
 
+static struct chromeos_laptop hp_chromebook_14 = {
+	.i2c_peripherals = {
+		/* Touchpad. */
+		{ .add = setup_cyapa_tp, I2C_ADAPTER_I2C0 },
+	},
+};
+
 static struct chromeos_laptop acer_c7_chromebook = {
 	.i2c_peripherals = {
 		/* Touchpad. */
@@ -435,6 +442,13 @@ static struct dmi_system_id chromeos_laptop_dmi_table[] __initdata = {
 		_CBDD(chromebook_pixel),
 	},
 	{
+		.ident = "HP Chromebook 14",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Falco"),
+		},
+		_CBDD(hp_chromebook_14),
+	},
+	{
 		.ident = "Acer C7 Chromebook",
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Parrot"),
-- 
1.8.3.2
