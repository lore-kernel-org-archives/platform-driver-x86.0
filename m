From: Santeri Toivonen <santeri.toivonen@vatsul.com>
Subject: [PATCH 1/1] asus-nb-wmi: Add wapf4 quirk for the X302UA
Date: Tue, 4 Apr 2017 19:35:00 +0300
Message-ID: <4a7fe8c6-e790-e855-1571-24603c5ca80f@vatsul.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rs224.mailgun.us ([209.61.151.224]:44398 "EHLO rs224.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932196AbdDDQfS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 12:35:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@linux.intel.com, Corentin Chary <corentin.chary@gmail.com>, jprvita@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, marcos.souza.org@gmail.com
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Asus laptop X302UA starts up with Wi-Fi disabled,
without a way to enable it. Set wapf=4 to fix the problem.

Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
---
  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c 
b/drivers/platform/x86/asus-nb-wmi.c
index dea98ffb6f60..1ae58d906536 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
  	},
  	{
  		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X302UA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
  		.ident = "ASUSTeK COMPUTER INC. X401U",
  		.matches = {
  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.11.0.windows.3
