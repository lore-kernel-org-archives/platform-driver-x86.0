From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 04/10] eeepc-wmi: use attribute group to manage attributes
Date: Mon, 29 Nov 2010 08:14:08 +0100
Message-ID: <1291014854-17961-5-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:33844 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754873Ab0K2HPE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:04 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id A7B4D862AD
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:03 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |   23 +++++++++++------------
 1 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index fb548f4..a70d76a 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -560,24 +560,23 @@ static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
 
+static struct attribute *platform_attributes[] = {
+	&dev_attr_cpufv.attr,
+	NULL
+};
+
+static struct attribute_group platform_attribute_group = {
+	.attrs = platform_attributes
+};
+
 static void eeepc_wmi_sysfs_exit(struct platform_device *device)
 {
-	device_remove_file(&device->dev, &dev_attr_cpufv);
+	sysfs_remove_group(&device->dev.kobj, &platform_attribute_group);
 }
 
 static int eeepc_wmi_sysfs_init(struct platform_device *device)
 {
-	int retval = -ENOMEM;
-
-	retval = device_create_file(&device->dev, &dev_attr_cpufv);
-	if (retval)
-		goto error_sysfs;
-
-	return 0;
-
-error_sysfs:
-	eeepc_wmi_sysfs_exit(device);
-	return retval;
+	return sysfs_create_group(&device->dev.kobj, &platform_attribute_group);
 }
 
 /*
-- 
1.7.3.2
