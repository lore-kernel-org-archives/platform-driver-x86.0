From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: [PATCH] asus-nb-wmi: Add wapf4 quirk for the X550VB
Date: Wed, 22 Oct 2014 14:32:52 +0200
Message-ID: <20141022123252.GC1876@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12261 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932865AbaJVMfr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Oct 2014 08:35:47 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>

As reported here: http://bugzilla.redhat.com/show_bug.cgi?id=1089731#c23
the X550VB needs wapf=4 too.

Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3a4951f..c1a6cd6 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -182,6 +182,15 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X550VB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X550VB"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X55A",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
1.8.3.1
