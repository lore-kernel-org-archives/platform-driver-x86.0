From: Scott K Logan <logans@cottsay.net>
Subject: [PATCH] fujitsu-tablet: add support for Lifebook T901 and T902
Date: Wed, 19 Mar 2014 13:15:30 -0600
Message-ID: <5329ECD2.9020707@cottsay.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ns1.cottsay.net ([74.94.84.57]:40250 "EHLO smtp.cottsay.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750934AbaCSTV1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Mar 2014 15:21:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Robert Gerlach <khnz@gmx.de>, platform-driver-x86@vger.kernel.org

The button mappings for the Fujitsu Lifebook T901 and T902 are quite different
from the generic Lifebook T mappings that are defined. This patch adds
mappings that are specific to the hardware on these machines, and allows
users to take advantage of features like screen rotation.

Signed-off-by: Scott K Logan <logans@cottsay.net>
---
  drivers/platform/x86/fujitsu-tablet.c | 65 +++++++++++++++++++++++++++++++++++
  1 file changed, 65 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index 570926c..c3784ba 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -71,6 +71,44 @@ struct fujitsu_config {
  	KEY_LEFTALT
  };
  
+static unsigned short keymap_Lifebook_T901[KEYMAP_LEN] __initdata = {
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_SCROLLDOWN,
+	KEY_SCROLLUP,
+	KEY_CYCLEWINDOWS,
+	KEY_LEFTCTRL,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_LEFTMETA
+};
+
+static unsigned short keymap_Lifebook_T902[KEYMAP_LEN] __initdata = {
+	KEY_RESERVED,
+	KEY_VOLUMEDOWN,
+	KEY_VOLUMEUP,
+	KEY_CYCLEWINDOWS,
+	KEY_PROG1,
+	KEY_PROG2,
+	KEY_LEFTMETA,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+};
+
  static unsigned short keymap_Lifebook_U810[KEYMAP_LEN] __initdata = {
  	KEY_RESERVED,
  	KEY_RESERVED,
@@ -302,6 +340,33 @@ static int fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
  static const struct dmi_system_id dmi_ids[] __initconst = {
  	{
  		.callback = fujitsu_dmi_lifebook,
+		.ident = "Fujitsu Lifebook T901",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook T901")
+		},
+		.driver_data = keymap_Lifebook_T901
+	},
+	{
+		.callback = fujitsu_dmi_lifebook,
+		.ident = "Fujitsu Lifebook T901",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T901")
+		},
+		.driver_data = keymap_Lifebook_T901
+	},
+	{
+		.callback = fujitsu_dmi_lifebook,
+		.ident = "Fujitsu Lifebook T902",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T902")
+		},
+		.driver_data = keymap_Lifebook_T902
+	},
+	{
+		.callback = fujitsu_dmi_lifebook,
  		.ident = "Fujitsu Siemens P/T Series",
  		.matches = {
  			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-- 
1.8.5.5
