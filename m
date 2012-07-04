From: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] ACER: Fix Smatch double-free issue
Date: Thu,  5 Jul 2012 01:30:10 +0200
Message-ID: <1341444610-15067-2-git-send-email-marex@denx.de>
References: <1341444610-15067-1-git-send-email-marex@denx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:53992 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755588Ab2GDXaR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 19:30:17 -0400
In-Reply-To: <1341444610-15067-1-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Matthew Garrett <mjg59@srcf.ucam.org>, Fengguang Wu <wfg@linux.intel.com>, joeyli <jlee@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>

The patch 6ae3a0876185: "ACER: Add support for accelerometer sensor"
from Jun 1, 2012, leads to the following Smatch warning:
drivers/platform/x86/acer-wmi.c:1886 acer_wmi_accel_destroy()
         error: don't call input_free_device() after input_unregister_device()

drivers/platform/x86/acer-wmi.c
  1883  static void acer_wmi_accel_destroy(void)
  1884  {
  1885          input_unregister_device(acer_wmi_accel_dev);
  1886          input_free_device(acer_wmi_accel_dev);
  1887  }

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Fengguang Wu <wfg@linux.intel.com>
Cc: joeyli <jlee@suse.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/acer-wmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index ae969fd..f4ed2af 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1883,7 +1883,6 @@ err_free_dev:
 static void acer_wmi_accel_destroy(void)
 {
 	input_unregister_device(acer_wmi_accel_dev);
-	input_free_device(acer_wmi_accel_dev);
 }
 
 static int __init acer_wmi_input_setup(void)
-- 
1.7.10
