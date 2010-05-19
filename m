From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 13/14] thinkpad-acpi: clean up ACPI handles handling
Date: Wed, 19 May 2010 00:26:23 -0300
Message-ID: <1274239584-17743-14-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:47746 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756220Ab0ESD0g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:36 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

1. Remove <handle>_path, as its only user was already removed in
   a previous commit

2. Move all handle initialization, as well as <handle>_parent and
   <handle>_paths to __init.* sections.  This reduces the driver's
   runtime footprint nicely.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 29ad273..b3bfce9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -516,9 +516,9 @@ static acpi_handle ec_handle;
 
 #define TPACPI_HANDLE(object, parent, paths...)			\
 	static acpi_handle  object##_handle;			\
-	static acpi_handle *object##_parent = &parent##_handle;	\
-	static char        *object##_path;			\
-	static char        *object##_paths[] = { paths }
+	static const acpi_handle *object##_parent __initdata =	\
+						&parent##_handle; \
+	static char *object##_paths[] __initdata = { paths }
 
 TPACPI_HANDLE(ecrd, ec, "ECRD");	/* 570 */
 TPACPI_HANDLE(ecwr, ec, "ECWR");	/* 570 */
@@ -673,11 +673,11 @@ static int issue_thinkpad_cmos_command(int cmos_cmd)
 
 #define TPACPI_ACPIHANDLE_INIT(object) \
 	drv_acpi_handle_init(#object, &object##_handle, *object##_parent, \
-		object##_paths, ARRAY_SIZE(object##_paths), &object##_path)
+		object##_paths, ARRAY_SIZE(object##_paths))
 
-static void drv_acpi_handle_init(char *name,
-			   acpi_handle *handle, acpi_handle parent,
-			   char **paths, int num_paths, char **path)
+static void __init drv_acpi_handle_init(const char *name,
+			   acpi_handle *handle, const acpi_handle parent,
+			   char **paths, const int num_paths)
 {
 	int i;
 	acpi_status status;
@@ -688,10 +688,9 @@ static void drv_acpi_handle_init(char *name,
 	for (i = 0; i < num_paths; i++) {
 		status = acpi_get_handle(parent, paths[i], handle);
 		if (ACPI_SUCCESS(status)) {
-			*path = paths[i];
 			dbg_printk(TPACPI_DBG_INIT,
 				   "Found ACPI handle %s for %s\n",
-				   *path, name);
+				   paths[i], name);
 			return;
 		}
 	}
-- 
1.7.1

