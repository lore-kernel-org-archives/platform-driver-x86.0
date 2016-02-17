From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH RESEND v3] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Wed, 17 Feb 2016 13:35:46 +0200
Message-ID: <ece82c01c879e7e1fed300a001b491ed@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:29836 "EHLO
	vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933199AbcBQLxR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 06:53:17 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
is loaded with wapf=4 option. Add quirk for this.

Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
---
  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c 
b/drivers/platform/x86/asus-nb-wmi.c
index 131fee2..091ca7a 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -272,6 +272,15 @@ static const struct dmi_system_id asus_quirks[] = {
  	},
  	{
  		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X75VD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X75VD"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
  		.ident = "ASUSTeK COMPUTER INC. 1015E",
  		.matches = {
  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.7.1
