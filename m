From: Benjamin Berg <bberg@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Accept flat mode for type 4 multi mode status
Date: Tue, 14 Nov 2017 17:14:14 +0100
Message-ID: <20171114161414.14297-1-bberg@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52180 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753160AbdKNQOf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 11:14:35 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Benjamin Berg <bberg@redhat.com>, Peter FP1 Zhang <zhangfp1@lenovo.com>, Lyude <lyude@redhat.com>

On the X1 Yoga 2nd Generation and most likely other notebooks the FLAT
mode is reported. Decode it correctly rather than warning about an
unexpected multi mode status to be reported.

Signed-off-by: Benjamin Berg <bberg@redhat.com>
Cc: Peter FP1 Zhang <zhangfp1@lenovo.com
Cc: Lyude <lyude@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 91fab1a13a6d..d23c84222e9f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2106,26 +2106,24 @@ static int hotkey_gmms_get_tablet_mode(int s, int *has_tablet_mode)
 			      TP_ACPI_MULTI_MODE_FLAT |
 			      TP_ACPI_MULTI_MODE_TABLET |
 			      TP_ACPI_MULTI_MODE_STAND |
 			      TP_ACPI_MULTI_MODE_TENT;
 		break;
 	case 3:
 		valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
 			      TP_ACPI_MULTI_MODE_FLAT;
 		break;
 	case 4:
-		valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
-			      TP_ACPI_MULTI_MODE_TABLET |
-			      TP_ACPI_MULTI_MODE_STAND |
-			      TP_ACPI_MULTI_MODE_TENT;
-		break;
 	case 5:
+		/* In mode 4, FLAT is not specified as a valid mode. However,
+		 * it can be seen at least on the X1 Yoga 2nd Generation.
+		 */
 		valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
 			      TP_ACPI_MULTI_MODE_FLAT |
 			      TP_ACPI_MULTI_MODE_TABLET |
 			      TP_ACPI_MULTI_MODE_STAND |
 			      TP_ACPI_MULTI_MODE_TENT;
 		break;
 	default:
 		pr_err("Unknown multi mode status type %d with value 0x%04X, please report this to %s\n",
 		       type, value, TPACPI_MAIL);
 		return 0;
-- 
2.13.6
