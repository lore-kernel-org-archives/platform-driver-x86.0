From: Greg Kroah-Hartman <gregkh@suse.de>
Subject: [PATCH 1/4] msi-laptop: Add N014 N051 dmi information to scm models table
Date: Wed, 12 May 2010 09:58:07 -0700
Message-ID: <1273683490-27090-1-git-send-email-gregkh@suse.de>
References: <20100512141149.GB20564@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100512141149.GB20564@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com
Cc: mzxreary@0pointer.de, rpurdie@linux.intel.com, jlee@novell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, greg@kroah.com, Greg Kroah-Hartman <gregkh@suse.de>
List-Id: platform-driver-x86.vger.kernel.org

From: Lee, Chun-Yi <jlee@novell.com>

Add new MSI netbook N014 and N051 dmi information to scm models table.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/platform/x86/msi-laptop.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 996223a..bcd9c0d 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -469,6 +469,26 @@ static struct dmi_system_id __initdata msi_dmi_table[] = {
 		},
 		.callback = dmi_check_cb
 	},
+	{
+		.ident = "MSI N051",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				"MICRO-STAR INTERNATIONAL CO., LTD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MS-N051"),
+			DMI_MATCH(DMI_CHASSIS_VENDOR,
+			"MICRO-STAR INTERNATIONAL CO., LTD")
+		},
+		.callback = dmi_check_cb
+	},
+	{
+		.ident = "MSI N014",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				"MICRO-STAR INTERNATIONAL CO., LTD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MS-N014"),
+		},
+		.callback = dmi_check_cb
+	},
 	{ }
 };
 
@@ -788,3 +808,5 @@ MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1058:pvr0581:rvnMSI:rnMS-105
 MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1412:*:rvnMSI:rnMS-1412:*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
 MODULE_ALIAS("dmi:*:svnNOTEBOOK:pnSAM2000:pvr0131*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
 MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N034:*");
+MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
+MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
-- 
1.7.1
