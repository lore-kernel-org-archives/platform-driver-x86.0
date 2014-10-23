From: Aaron Lu <aaron.lu@intel.com>
Subject: [PATCH] toshiba_acpi: Add Toshiba TECRA A50-A to the alt keymap dmi
 list
Date: Thu, 23 Oct 2014 16:18:02 +0800
Message-ID: <5448B9BA.9030003@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:63141 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752244AbaJWI0q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Oct 2014 04:26:46 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Blindekinder <rafael.raccuia@blindekinder.com>, Azael Avalos <coproscefalo@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

As bug #72551, the Toshiba TECRA A50-A series models also come with the
new keymap layout as found out by Azael Avalos, so add it to the dmi
table.

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=76971
Reported-and-tested-by: Blindekinder <rafael.raccuia@blindekinder.com>
Cc: Azael Avalos <coproscefalo@gmail.com>
Signed-off-by: Aaron Lu <aaron.lu@intel.com>
---
 drivers/platform/x86/toshiba_acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index ef3a1904e92f..ab6151f05420 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -240,6 +240,12 @@ static const struct dmi_system_id toshiba_alt_keymap_dmi[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Qosmio X75-A"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TECRA A50-A"),
+		},
+	},
 	{}
 };
 
-- 
1.9.3
