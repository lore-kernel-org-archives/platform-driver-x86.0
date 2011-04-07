From: Ameya Palande <2ameya@gmail.com>
Subject: [PATCH] platform-x86: intel_mid_thermal: Fix memory leak
Date: Thu,  7 Apr 2011 16:30:02 +0300
Message-ID: <1302183002-3900-1-git-send-email-2ameya@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.1.48]:49929 "EHLO mgw-sa02.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751087Ab1DGNaN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Apr 2011 09:30:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, durgadoss.r@intel.com

Signed-off-by: Ameya Palande <2ameya@gmail.com>
---
 drivers/platform/x86/intel_mid_thermal.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 9ee707f..dd9494b 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -527,6 +527,7 @@ static int mid_thermal_remove(struct platform_device *pdev)
 	for (i = 0; i < MSIC_THERMAL_SENSORS; i++)
 		thermal_zone_device_unregister(pinfo->tzd[i]);
 
+	kfree(pinfo);
 	platform_set_drvdata(pdev, NULL);
 
 	/* Stop the ADC */
-- 
1.7.1
