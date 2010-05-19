From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 09/14] thinkpad-acpi: detect EC node using its HID (v2)
Date: Wed, 19 May 2010 00:26:19 -0300
Message-ID: <1274239584-17743-10-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:48875 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756283Ab0ESD0i (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:38 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>

Use the EC HID (PNP0C09) to locate its main node, instead of a static
list.

Suggested-by: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c |   53 ++++++++++++++++++++++++++-------
 1 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b03cb3e..877a780 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -129,6 +129,7 @@ enum {
 
 /* ACPI HIDs */
 #define TPACPI_ACPI_HKEY_HID		"IBM0068"
+#define TPACPI_ACPI_EC_HID		"PNP0C09"
 
 /* Input IDs */
 #define TPACPI_HKEY_INPUT_PRODUCT	0x5054 /* "TP" */
@@ -511,6 +512,7 @@ static inline bool __pure __init tpacpi_is_ibm(void)
  */
 
 static acpi_handle root_handle;
+static acpi_handle ec_handle;
 
 #define TPACPI_HANDLE(object, parent, paths...)			\
 	static acpi_handle  object##_handle;			\
@@ -518,16 +520,6 @@ static acpi_handle root_handle;
 	static char        *object##_path;			\
 	static char        *object##_paths[] = { paths }
 
-TPACPI_HANDLE(ec, root, "\\_SB.PCI0.ISA.EC0",	/* 240, 240x */
-	   "\\_SB.PCI.ISA.EC",	/* 570 */
-	   "\\_SB.PCI0.ISA0.EC0",	/* 600e/x, 770e, 770x */
-	   "\\_SB.PCI0.ISA.EC",	/* A21e, A2xm/p, T20-22, X20-21 */
-	   "\\_SB.PCI0.AD4S.EC0",	/* i1400, R30 */
-	   "\\_SB.PCI0.ICH3.EC0",	/* R31 */
-	   "\\_SB.PCI0.LPC0.EC",	/* X100e and a few others */
-	   "\\_SB.PCI0.LPC.EC",	/* all others */
-	   );
-
 TPACPI_HANDLE(ecrd, ec, "ECRD");	/* 570 */
 TPACPI_HANDLE(ecwr, ec, "ECWR");	/* 570 */
 
@@ -708,6 +700,43 @@ static void drv_acpi_handle_init(char *name,
 	*handle = NULL;
 }
 
+static acpi_status __init tpacpi_acpi_handle_locate_callback(acpi_handle handle,
+			u32 level, void *context, void **return_value)
+{
+	*(acpi_handle *)return_value = handle;
+
+	return AE_CTRL_TERMINATE;
+}
+
+static void __init tpacpi_acpi_handle_locate(const char *name,
+		const char *hid,
+		acpi_handle *handle)
+{
+	acpi_status status;
+	acpi_handle device_found;
+
+	BUG_ON(!name || !hid || !handle);
+	vdbg_printk(TPACPI_DBG_INIT,
+			"trying to locate ACPI handle for %s, using HID %s\n",
+			name, hid);
+
+	memset(&device_found, 0, sizeof(device_found));
+	status = acpi_get_devices(hid, tpacpi_acpi_handle_locate_callback,
+				  (void *)name, &device_found);
+
+	*handle = NULL;
+
+	if (ACPI_SUCCESS(status)) {
+		*handle = device_found;
+		dbg_printk(TPACPI_DBG_INIT,
+			   "Found ACPI handle for %s\n", name);
+	} else {
+		vdbg_printk(TPACPI_DBG_INIT,
+			    "Could not locate an ACPI handle for %s: %s\n",
+			    name, acpi_format_exception(status));
+	}
+}
+
 static void dispatch_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ibm_struct *ibm = data;
@@ -8752,8 +8781,8 @@ static int __init probe_for_thinkpad(void)
 		      (thinkpad_id.ec_model != 0) ||
 		      tpacpi_is_fw_known();
 
-	/* ec is required because many other handles are relative to it */
-	TPACPI_ACPIHANDLE_INIT(ec);
+	/* The EC handler is required */
+	tpacpi_acpi_handle_locate("ec", TPACPI_ACPI_EC_HID, &ec_handle);
 	if (!ec_handle) {
 		if (is_thinkpad)
 			printk(TPACPI_ERR
-- 
1.7.1

