From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] platform: x86: remove unnecessary platform_set_drvdata()
Date: Thu, 22 Aug 2013 11:04:28 +0900
Message-ID: <001d01ce9edb$eec86520$cc592f60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11259 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752289Ab3HVCEn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Aug 2013 22:04:43 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRW007GLTR9AWD0@mailout2.samsung.com> for
 platform-driver-x86@vger.kernel.org; Thu, 22 Aug 2013 11:04:28 +0900 (KST)
Content-language: ko
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: 'Matthew Garrett' <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/platform/x86/compal-laptop.c      |    1 -
 drivers/platform/x86/intel_mid_powerbtn.c |    1 -
 drivers/platform/x86/intel_mid_thermal.c  |    1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 475cc52..634016a 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1081,7 +1081,6 @@ static int compal_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	power_supply_unregister(&data->psy);
 
-	platform_set_drvdata(pdev, NULL);
 	kfree(data);
 
 	sysfs_remove_group(&pdev->dev.kobj, &compal_attribute_group);
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index f59683a..6b18aba 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -128,7 +128,6 @@ static int mfld_pb_remove(struct platform_device *pdev)
 
 	free_irq(irq, input);
 	input_unregister_device(input);
-	platform_set_drvdata(pdev, NULL);
 
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 81c491e..93fab8b 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -542,7 +542,6 @@ static int mid_thermal_remove(struct platform_device *pdev)
 	}
 
 	kfree(pinfo);
-	platform_set_drvdata(pdev, NULL);
 
 	/* Stop the ADC */
 	return configure_adc(0);
-- 
1.7.10.4
