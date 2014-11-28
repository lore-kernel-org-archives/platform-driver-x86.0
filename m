From: Peter Feuerer <peter@piie.net>
Subject: [RESEND PATCH v5 4/5] acerhdf: added critical trip point
Date: Fri, 28 Nov 2014 15:20:51 +0100
Message-ID: <1417184452-11884-5-git-send-email-peter@piie.net>
References: <1398561815-22033-1-git-send-email-peter@piie.net>
 <1417184452-11884-1-git-send-email-peter@piie.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417184452-11884-1-git-send-email-peter@piie.net>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Peter Feuerer <peter@piie.net>, Andrew Morton <akpm@linux-foundation.org>, Andreas Mohr <andi@lisas.de>, Borislav Petkov <bp@suse.de>, Javi Merino <javi.merino@arm.com>
List-Id: platform-driver-x86.vger.kernel.org

added critical trip point which represents the temperature limit.
Added return -EINVAL in case wrong trip point is provided.

Cc: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Mohr <andi@lisas.de>
Cc: Borislav Petkov <bp@suse.de>
Cc: Javi Merino <javi.merino@arm.com>
Signed-off-by: Peter Feuerer <peter@piie.net>
---
 drivers/platform/x86/acerhdf.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 7fe7dbf..91b16c8 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -443,6 +443,10 @@ static int acerhdf_get_trip_type(struct thermal_zone_device *thermal, int trip,
 {
 	if (trip == 0)
 		*type = THERMAL_TRIP_ACTIVE;
+	else if (trip == 1)
+		*type = THERMAL_TRIP_CRITICAL;
+	else
+		return -EINVAL;
 
 	return 0;
 }
@@ -463,6 +467,10 @@ static int acerhdf_get_trip_temp(struct thermal_zone_device *thermal, int trip,
 {
 	if (trip == 0)
 		*temp = fanon;
+	else if (trip == 1)
+		*temp = ACERHDF_TEMP_CRIT;
+	else
+		return -EINVAL;
 
 	return 0;
 }
@@ -713,7 +721,7 @@ static int acerhdf_register_thermal(void)
 	if (IS_ERR(cl_dev))
 		return -EINVAL;
 
-	thz_dev = thermal_zone_device_register("acerhdf", 1, 0, NULL,
+	thz_dev = thermal_zone_device_register("acerhdf", 2, 0, NULL,
 					      &acerhdf_dev_ops,
 					      &acerhdf_zone_params, 0,
 					      (kernelmode) ? interval*1000 : 0);
-- 
2.1.3
