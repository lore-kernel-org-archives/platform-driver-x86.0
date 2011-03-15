From: Dan Carpenter <error27@gmail.com>
Subject: [patch 1/2] asus-wmi: signedness bug in read_brightness()
Date: Tue, 15 Mar 2011 10:06:23 +0300
Message-ID: <20110315070623.GS2008@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:45212 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753944Ab1COHGm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Mar 2011 03:06:42 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

"err" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5b779a9..a038595 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -946,7 +946,8 @@ static int read_brightness_max(struct asus_wmi *asus)
 static int read_brightness(struct backlight_device *bd)
 {
 	struct asus_wmi *asus = bl_get_data(bd);
-	u32 retval, err;
+	u32 retval;
+	int err;
 
 	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_BRIGHTNESS, &retval);
 
