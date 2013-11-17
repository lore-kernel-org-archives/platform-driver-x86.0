From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 02/12] dell-laptop: Only enable rfkill on Latitudes
Date: Sun, 17 Nov 2013 14:00:17 +0100
Message-ID: <1384693227-5859-3-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41221 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751520Ab3KQNAh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:37 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

The rfkill functionality was removed from the dell-laptop driver because it
was causing problems on various non Latitude models, and the blacklist kept
growing and growing. In the thread discussing this Dell mentioned that they
only QA the rfkill acpi interface on Latitudes and indeed there have been
no blacklist entries for Latitudes.

Note that the blacklist contained no Vostros either, and most Vostros have
a hardware switch too, so we could consider supporting Vostros with a
hardware switch too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 57 +++++---------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 55f75a2..bae932b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -119,53 +119,6 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, dell_device_table);
 
-static struct dmi_system_id dell_blacklist[] = {
-	/* Supported by compal-laptop */
-	{
-		.ident = "Dell Mini 9",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 910"),
-		},
-	},
-	{
-		.ident = "Dell Mini 10",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1010"),
-		},
-	},
-	{
-		.ident = "Dell Mini 10v",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1011"),
-		},
-	},
-	{
-		.ident = "Dell Mini 1012",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
-		},
-	},
-	{
-		.ident = "Dell Inspiron 11z",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1110"),
-		},
-	},
-	{
-		.ident = "Dell Mini 12",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1210"),
-		},
-	},
-	{}
-};
-
 static struct dmi_system_id dell_quirks[] = {
 	{
 		.callback = dmi_matched,
@@ -579,11 +532,15 @@ static int __init dell_setup_rfkill(void)
 {
 	int status;
 	int ret;
+	const char *product;
 
-	if (dmi_check_system(dell_blacklist)) {
-		pr_info("Blacklisted hardware detected - not enabling rfkill\n");
+	/*
+	 * rfkill causes trouble on various non Latitudes, according to Dell
+	 * actually testing the rfkill functionality is only done on Latitudes.
+	 */
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!product || strncmp(product, "Latitude", 8))
 		return 0;
-	}
 
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
-- 
1.8.4.2
