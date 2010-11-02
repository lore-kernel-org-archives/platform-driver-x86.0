From: Vernon Mauery <vernux@us.ibm.com>
Subject: [PATCH 2/2] ibm_rtl: _RTL_ is not available in UEFI mode
Date: Tue,  2 Nov 2010 13:08:11 -0700
Message-ID: <1288728491-2216-3-git-send-email-vernux@us.ibm.com>
References: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:34595 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751368Ab0KBUIv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Nov 2010 16:08:51 -0400
In-Reply-To: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Vernon Mauery <vernux@us.ibm.com>

Some of the IBM servers that are supported by ibm_rtl
can run in both Legacy mode (BIOS) and in UEFI mode.
When running in UEFI mode, it is possible that the
EBDA table exists but cannot be mapped and reports
errors.  We need to make sure that by default we don't
try to probe the machines if they are running in UEFI
mode.

Signed-off-by: Vernon Mauery <vernux@us.ibm.com>
---
 drivers/platform/x86/ibm_rtl.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index c5a0061..3cff0e5 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -28,6 +28,7 @@
 #include <linux/io.h>
 #include <linux/sysdev.h>
 #include <linux/dmi.h>
+#include <linux/efi.h>
 #include <linux/mutex.h>
 #include <asm/bios_ebda.h>
 
@@ -238,7 +239,7 @@ static int __init ibm_rtl_init(void) {
 	if (force)
 		pr_warning("ibm-rtl: module loaded by force\n");
 	/* first ensure that we are running on IBM HW */
-	else if (!dmi_check_system(ibm_rtl_dmi_table))
+	else if (efi_enabled || !dmi_check_system(ibm_rtl_dmi_table))
 		return -ENODEV;
 
 	/* Get the address for the Extended BIOS Data Area */
-- 
1.7.1
