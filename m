From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 08/10] eeepc-wmi: remove unneeded static
Date: Mon, 29 Nov 2010 08:14:12 +0100
Message-ID: <1291014854-17961-9-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:35734 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755021Ab0K2HPJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:09 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 697C9862B4
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:08 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 5f3f42c..52274e2 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -267,7 +267,7 @@ static void tpd_led_set(struct led_classdev *led_cdev,
 
 static int read_tpd_state(struct eeepc_wmi *eeepc)
 {
-	static u32 retval;
+	u32 retval;
 	acpi_status status;
 
 	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_TPDLED, &retval);
@@ -458,7 +458,7 @@ exit:
  */
 static int read_brightness(struct backlight_device *bd)
 {
-	static u32 retval;
+	u32 retval;
 	acpi_status status;
 
 	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_BACKLIGHT, &retval);
@@ -472,7 +472,7 @@ static int read_brightness(struct backlight_device *bd)
 static int update_bl_status(struct backlight_device *bd)
 {
 
-	static u32 ctrl_param;
+	u32 ctrl_param;
 	acpi_status status;
 
 	ctrl_param = bd->props.brightness;
-- 
1.7.3.2
