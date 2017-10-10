From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 1/3] platform/x86: intel_telemetry: Fix load failure info
Date: Tue, 10 Oct 2017 15:35:17 +0530
Message-ID: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:63505 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751398AbdJJKJJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 06:09:09 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

Intel Telemetry driver depends on IPC1 interface. If IPC1 interface is
disabled on a given platform by the system firmware, the driver does not
load but prints misleading information in the dmesg logs.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_telemetry_pltdrv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index e0424d5a795a..136507a0d391 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -1234,7 +1234,6 @@ static struct platform_driver telemetry_soc_driver = {
 
 static int __init telemetry_module_init(void)
 {
-	pr_info(DRIVER_NAME ": version %s loaded\n", DRIVER_VERSION);
 	return platform_driver_register(&telemetry_soc_driver);
 }
 
-- 
2.7.4
