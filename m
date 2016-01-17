From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 2/2] acer-wmi: Use acpi_dev_present()
Date: Sun, 17 Jan 2016 21:49:41 +0100
Message-ID: <0ba4ef20f869501875e0815f34e5defa70fe0a03.1453060661.git.lukas@wunner.de>
References: <cover.1453060661.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:40981 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbcAQUuT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 15:50:19 -0500
In-Reply-To: <cover.1453060661.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

Use shiny new acpi_dev_present() and remove all the boilerplate
to search for a particular ACPI device. No functional change.
Cf. 2d12b6b381ba ("ACPI / utils: Add acpi_dev_present()").

Cc: Lee, Chun-Yi <jlee@suse.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 drivers/platform/x86/acer-wmi.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1062fa4..3deadd5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -793,15 +793,6 @@ static acpi_status __init AMW0_find_mailled(void)
 	return AE_OK;
 }
 
-static int AMW0_set_cap_acpi_check_device_found __initdata;
-
-static acpi_status __init AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
-	u32 level, void *context, void **retval)
-{
-	AMW0_set_cap_acpi_check_device_found = 1;
-	return AE_OK;
-}
-
 static const struct acpi_device_id norfkill_ids[] __initconst = {
 	{ "VPC2004", 0},
 	{ "IBM0068", 0},
@@ -816,9 +807,10 @@ static int __init AMW0_set_cap_acpi_check_device(void)
 	const struct acpi_device_id *id;
 
 	for (id = norfkill_ids; id->id[0]; id++)
-		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
-				NULL, NULL);
-	return AMW0_set_cap_acpi_check_device_found;
+		if (acpi_dev_present(id->id))
+			return true;
+
+	return false;
 }
 
 static acpi_status __init AMW0_set_capabilities(void)
-- 
1.8.5.2 (Apple Git-48)
