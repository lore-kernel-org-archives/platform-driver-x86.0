From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] platform/x86: intel_mid_thermal: Remove duplicated platform device ID
Date: Mon,  2 Jan 2017 12:20:55 -0300
Message-ID: <1483370456-30786-1-git-send-email-javier@osg.samsung.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:56936
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755969AbdABPVH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Jan 2017 10:21:07 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

Commit 3fca3d3d5075 ("platform-x86: intel_mid_thermal: add msic_thermal
alias") added a "msic_thermal" entry to the driver's platform device ID
table since that was the platform dev name registered in some platforms
and the only dev in the platform table was "msic_sensor" (DRIVER_NAME).

But then commit 634830704d80 ("x86/mid/thermal: Add msic_thermal alias")
changed DRIVER_NAME from "msic_sensor" to "msic_thermal", and so there's
now duplicated entries in the platform device ID table.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/platform/x86/intel_mid_thermal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 0df3c9d37509..05ac7203806d 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -549,7 +549,6 @@ static int mid_thermal_remove(struct platform_device *pdev)
 
 static const struct platform_device_id therm_id_table[] = {
 	{ DRIVER_NAME, 1 },
-	{ "msic_thermal", 1 },
 	{ }
 };
 
-- 
2.7.4
