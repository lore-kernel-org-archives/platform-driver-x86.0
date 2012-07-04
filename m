From: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] ACER: Fix up sparse warning
Date: Thu,  5 Jul 2012 01:30:09 +0200
Message-ID: <1341444610-15067-1-git-send-email-marex@denx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:57977 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755588Ab2GDXaU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 19:30:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Matthew Garrett <mjg59@srcf.ucam.org>, Fengguang Wu <wfg@linux.intel.com>, joeyli <jlee@suse.com>

drivers/platform/x86/acer-wmi.c:1836:18: sparse: Using plain integer as NULL pointer

drivers/platform/x86/acer-wmi.c:1836:
  1833
  1834          BUG_ON(!name || !ah);
  1835
> 1836          handle = 0;
  1837          status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
  1838                                          (void *)name, &handle);
  1839

Reported-by: Fengguang Wu <wfg@linux.intel.com>

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Fengguang Wu <wfg@linux.intel.com>
Cc: joeyli <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 175809d..ae969fd 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1833,7 +1833,7 @@ static int __init acer_wmi_get_handle(const char *name, const char *prop,
 
 	BUG_ON(!name || !ah);
 
-	handle = 0;
+	handle = NULL;
 	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
 					(void *)name, &handle);
 
-- 
1.7.10
