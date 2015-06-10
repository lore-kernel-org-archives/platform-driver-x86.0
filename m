From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [PATCH] Add wapf1 quirk for Asus X550VC
Date: Wed, 10 Jun 2015 20:44:22 +0300
Message-ID: <1433958262-25228-1-git-send-email-hanipouspilot@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35567 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933568AbbFJRot (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Jun 2015 13:44:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>, stable@vger.kernel.org

Wireless is always blocked on this device.
There is no way to unblock by software or hardware.

1: asus-wlan: Wireless LAN
   Soft blocked: no
   Hard blocked: no
2: asus-bluetooth: Bluetooth
   Soft blocked: yes
   Hard blocked: no
3: phy0: Wireless LAN
   Soft blocked: no
   Hard blocked: yes

With wapf=4 bluetooth unblocks but wifi stays blocked

1: asus-wlan: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: asus-bluetooth: Bluetooth
	Soft blocked: no
	Hard blocked: no
3: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: yes
7: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no

Only with wapf=1 everything works OK.

Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index abdaed3..cf5ba28 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -78,6 +78,10 @@ static struct quirk_entry quirk_asus_x200ca = {
 	.wapf = 2,
 };
 
+static struct quirk_entry quirk_asus_wapf1 = {
+	.wapf = 1,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
@@ -191,6 +195,15 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X550VC",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X550VC"),
+		},
+		.driver_data = &quirk_asus_wapf1,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X551CA",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
1.9.1
