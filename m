From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 12/15] hp_accel: Constify ACPI and DMI tables
Date: Wed, 16 Jul 2014 19:43:14 +0200
Message-ID: <1405532597-28262-13-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:58530 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965482AbaGPRns (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:48 -0400
Received: by mail-wg0-f41.google.com with SMTP id z12so1303118wgg.24
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:47 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Eric Piel <eric.piel@tremplin-utc.net>

Constify the lis3lv02d_device_ids[] ACPI and the lis3lv02d_dmi_ids[] DMI
tables. There's no need to have them writeable during runtime.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Eric Piel <eric.piel@tremplin-utc.net>
---
 drivers/platform/x86/hp_accel.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index 3dc934438c..13e14ec1d3 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -74,7 +74,7 @@ static inline void delayed_sysfs_set(struct led_classdev *led_cdev,
 /* HP-specific accelerometer driver ------------------------------------ */
 
 /* For automatic insertion of the module */
-static struct acpi_device_id lis3lv02d_device_ids[] = {
+static const struct acpi_device_id lis3lv02d_device_ids[] = {
 	{"HPQ0004", 0}, /* HP Mobile Data Protection System PNP */
 	{"HPQ6000", 0}, /* HP Mobile Data Protection System PNP */
 	{"HPQ6007", 0}, /* HP Mobile Data Protection System PNP */
@@ -192,7 +192,7 @@ DEFINE_CONV(xy_swap_yz_inverted, 2, -1, -3);
 	},						\
 	.driver_data = &lis3lv02d_axis_##_axis		\
 }
-static struct dmi_system_id lis3lv02d_dmi_ids[] = {
+static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	/* product names are truncated to match all kinds of a same model */
 	AXIS_DMI_MATCH("NC64x0", "HP Compaq nc64", x_inverted),
 	AXIS_DMI_MATCH("NC84x0", "HP Compaq nc84", z_inverted),
-- 
1.7.10.4
