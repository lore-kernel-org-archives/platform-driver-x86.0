From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 11/12] dell-laptop: Add a force_rfkill module parameter
Date: Sun, 17 Nov 2013 14:00:26 +0100
Message-ID: <1384693227-5859-12-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39364 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753972Ab3KQNAw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:52 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Setting force_rfkill will cause the dell-laptop rfkill code to skip its
whitelist checks, this will allow individual users to override the whitelist,
as well as to gather info from users to improve the checks.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index fe20f67..bd67c89 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -93,6 +93,10 @@ static struct backlight_device *dell_backlight_device;
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
+static bool force_rfkill;
+
+module_param(force_rfkill, bool, 0444);
+MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
 
 static const struct dmi_system_id dell_device_table[] __initconst = {
 	{
@@ -567,7 +571,7 @@ static int __init dell_setup_rfkill(void)
 	 * actually testing the rfkill functionality is only done on Latitudes.
 	 */
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (!product || strncmp(product, "Latitude", 8))
+	if (!force_rfkill && (!product || strncmp(product, "Latitude", 8)))
 		return 0;
 
 	get_buffer();
-- 
1.8.4.2
