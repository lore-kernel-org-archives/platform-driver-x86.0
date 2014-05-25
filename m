From: Himangi Saraogi <himangi774@gmail.com>
Subject: [PATCH] ix86/mid/thermal: Introduce the use of the managed version
 of kzalloc
Date: Sun, 25 May 2014 13:05:45 +0530
Message-ID: <20140525073545.GA15398@himangi-Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:63224 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbaEYHfx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 25 May 2014 03:35:53 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

This patch moves data allocated using kzalloc to managed data allocated
using devm_kzalloc and cleans now unnecessary kfrees in probe and remove
functions.

The following Coccinelle semantic patch was used for making the change:

@platform@
identifier p, probefn, removefn;
@@
struct platform_driver p = {
  .probe = probefn,
  .remove = removefn,
};

@prb@
identifier platform.probefn, pdev;
expression e, e1, e2;
@@
probefn(struct platform_device *pdev, ...) {
  <+...
- e = kzalloc(e1, e2)
+ e = devm_kzalloc(&pdev->dev, e1, e2)
  ...
?-kfree(e);
  ...+>
}

@rem depends on prb@
identifier platform.removefn;
expression e;
@@
removefn(...) {
  <...
- kfree(e);
  ...>
}

Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
---
initialize_sensor can be devmified by passing an extra argument.
Will that be a nice idea?

 drivers/platform/x86/intel_mid_thermal.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 93fab8b..ab7860a 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -481,7 +481,8 @@ static int mid_thermal_probe(struct platform_device *pdev)
 	int i;
 	struct platform_info *pinfo;
 
-	pinfo = kzalloc(sizeof(struct platform_info), GFP_KERNEL);
+	pinfo = devm_kzalloc(&pdev->dev, sizeof(struct platform_info),
+			     GFP_KERNEL);
 	if (!pinfo)
 		return -ENOMEM;
 
@@ -489,7 +490,6 @@ static int mid_thermal_probe(struct platform_device *pdev)
 	ret = mid_initialize_adc(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "ADC init failed");
-		kfree(pinfo);
 		return ret;
 	}
 
@@ -520,7 +520,6 @@ err:
 		thermal_zone_device_unregister(pinfo->tzd[i]);
 	}
 	configure_adc(0);
-	kfree(pinfo);
 	return ret;
 }
 
@@ -541,8 +540,6 @@ static int mid_thermal_remove(struct platform_device *pdev)
 		thermal_zone_device_unregister(pinfo->tzd[i]);
 	}
 
-	kfree(pinfo);
-
 	/* Stop the ADC */
 	return configure_adc(0);
 }
-- 
1.9.1
