From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: enable resume on lid open
Date: Thu, 17 May 2012 13:48:04 +0800
Message-ID: <1337233684-9370-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:34874 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246Ab2EQFsK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 May 2012 01:48:10 -0400
Received: by dady13 with SMTP id y13so1966812dad.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 May 2012 22:48:09 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

According to the ASUS WMI spec., to enable resume on lid open should
use the device ID(0x00120032), but it doesn't work indeed.

After discussing with ASUS' BIOS engineer, they say wake on lid open
doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the same
device ID with deep S3(0x00120031), and the deep S3(resume on lid open)
is disable by default.

It's reasonable to resume the system while opening the lid, so add it
in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 1015CX.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index beda7fc..30e978d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
 
+/* Deep S3 / Resume on LID open */
+#define ASUS_WMI_DEVID_LID		0x00120031
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
@@ -1487,6 +1490,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
 				      asus->driver->quirks->wapf, NULL);
 
+	/* Enable resume on lid open */
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_LID, 1, &rv);
+
 	return asus_wmi_sysfs_init(asus->platform_device);
 }
 
-- 
1.7.9.5
