From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] thinkpad_acpi: buffer overflow in fan_get_status()
Date: Sat, 1 Sep 2012 12:54:07 -0700
Message-ID: <20120901195407.GF20741@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:21179 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755641Ab2IATyl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 1 Sep 2012 15:54:41 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Matthew Garrett <mjg@redhat.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

The acpi_evalf() function modifies four bytes of data but in
fan_get_status() we pass a pointer to u8.  I have modified the
function to use type checking now.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index df3016b..0735fb7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -545,7 +545,7 @@ TPACPI_HANDLE(hkey, ec, "\\_SB.HKEY",	/* 600e/x, 770e, 770x */
  */
 
 static int acpi_evalf(acpi_handle handle,
-		      void *res, char *method, char *fmt, ...)
+		      int *res, char *method, char *fmt, ...)
 {
 	char *fmt0 = fmt;
 	struct acpi_object_list params;
@@ -606,7 +606,7 @@ static int acpi_evalf(acpi_handle handle,
 		success = (status == AE_OK &&
 			   out_obj.type == ACPI_TYPE_INTEGER);
 		if (success && res)
-			*(int *)res = out_obj.integer.value;
+			*res = out_obj.integer.value;
 		break;
 	case 'v':		/* void */
 		success = status == AE_OK;
@@ -7386,17 +7386,18 @@ static int fan_get_status(u8 *status)
 	 * Add TPACPI_FAN_RD_ACPI_FANS ? */
 
 	switch (fan_status_access_mode) {
-	case TPACPI_FAN_RD_ACPI_GFAN:
+	case TPACPI_FAN_RD_ACPI_GFAN: {
 		/* 570, 600e/x, 770e, 770x */
+		int res;
 
-		if (unlikely(!acpi_evalf(gfan_handle, &s, NULL, "d")))
+		if (unlikely(!acpi_evalf(gfan_handle, &res, NULL, "d")))
 			return -EIO;
 
 		if (likely(status))
-			*status = s & 0x07;
+			*status = res & 0x07;
 
 		break;
-
+	}
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		if (unlikely(!acpi_ec_read(fan_status_offset, &s)))
