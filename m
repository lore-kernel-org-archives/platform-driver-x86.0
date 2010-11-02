From: Vernon Mauery <vernux@us.ibm.com>
Subject: [PATCH 1/2] ibm_rtl: Loosen the DMI criteria to all IBM machines
Date: Tue,  2 Nov 2010 13:08:10 -0700
Message-ID: <1288728491-2216-2-git-send-email-vernux@us.ibm.com>
References: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:34560 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752111Ab0KBUIp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Nov 2010 16:08:45 -0400
In-Reply-To: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Vernon Mauery <vernux@us.ibm.com>

Allow all IBM machines to pass the DMI check so that we
don't have to add them one by one to the driver.  Any IBM
machine that has the _RTL_ table in the EBDA will work.

Signed-off-by: Vernon Mauery <vernux@us.ibm.com>
---
 drivers/platform/x86/ibm_rtl.c |   29 +++++------------------------
 1 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index 3c2c6b9..c5a0061 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -220,32 +220,13 @@ static void rtl_teardown_sysfs(void) {
 	sysdev_class_unregister(&class_rtl);
 }
 
-static int dmi_check_cb(const struct dmi_system_id *id)
-{
-	RTL_DEBUG("found IBM server '%s'\n", id->ident);
-	return 0;
-}
-
-#define ibm_dmi_entry(NAME, TYPE)                  \
-{                                                  \
-	.ident = NAME,                             \
-	.matches = {                               \
-		DMI_MATCH(DMI_SYS_VENDOR, "IBM"),  \
-		DMI_MATCH(DMI_PRODUCT_NAME, TYPE), \
-	},                                         \
-	.callback = dmi_check_cb                   \
-}
 
 static struct dmi_system_id __initdata ibm_rtl_dmi_table[] = {
-	ibm_dmi_entry("BladeCenter LS21", "7971"),
-	ibm_dmi_entry("BladeCenter LS22", "7901"),
-	ibm_dmi_entry("BladeCenter HS21 XM", "7995"),
-	ibm_dmi_entry("BladeCenter HS22", "7870"),
-	ibm_dmi_entry("BladeCenter HS22V", "7871"),
-	ibm_dmi_entry("System x3550 M2", "7946"),
-	ibm_dmi_entry("System x3650 M2", "7947"),
-	ibm_dmi_entry("System x3550 M3", "7944"),
-	ibm_dmi_entry("System x3650 M3", "7945"),
+	{                                                  \
+		.matches = {                               \
+			DMI_MATCH(DMI_SYS_VENDOR, "IBM"),  \
+		},                                         \
+	},
 	{ }
 };
 
-- 
1.7.1
