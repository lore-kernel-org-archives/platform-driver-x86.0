From: Martin Vajnar <martin.vajnar@gmail.com>
Subject: [PATCH] hp_accel: Add support for HP ProBook 440 G3
Date: Sat,  2 Apr 2016 20:11:13 +0200
Message-ID: <1459620673-10633-1-git-send-email-martin.vajnar@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33872 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566AbcDBSLp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 Apr 2016 14:11:45 -0400
Received: by mail-lf0-f68.google.com with SMTP id f127so15725110lff.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Apr 2016 11:11:44 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Piel <eric.piel@tremplin-utc.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Martin Vajnar <martin.vajnar@gmail.com>

HP ProBook 440 G3 laptop needs a non-standard mapping (x_inverted_usd).

Signed-off-by: Martin Vajnar <martin.vajnar@gmail.com>
---
 drivers/platform/x86/hp_accel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index 10ce6cb..263002b 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -173,6 +173,7 @@ static int lis3lv02d_dmi_matched(const struct dmi_system_id *dmi)
 DEFINE_CONV(normal, 1, 2, 3);
 DEFINE_CONV(y_inverted, 1, -2, 3);
 DEFINE_CONV(x_inverted, -1, 2, 3);
+DEFINE_CONV(x_inverted_usd, -1, 2, -3);
 DEFINE_CONV(z_inverted, 1, 2, -3);
 DEFINE_CONV(xy_swap, 2, 1, 3);
 DEFINE_CONV(xy_rotated_left, -2, 1, 3);
@@ -236,6 +237,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HP8710", "HP Compaq 8710", y_inverted),
 	AXIS_DMI_MATCH("HDX18", "HP HDX 18", x_inverted),
 	AXIS_DMI_MATCH("HPB432x", "HP ProBook 432", xy_rotated_left),
+	AXIS_DMI_MATCH("HPB440G3", "HP ProBook 440 G3", x_inverted_usd),
 	AXIS_DMI_MATCH("HPB442x", "HP ProBook 442", xy_rotated_left),
 	AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
 	AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),
-- 
2.5.0
