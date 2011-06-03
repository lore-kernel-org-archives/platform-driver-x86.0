From: Andre Bartke <andre.bartke@googlemail.com>
Subject: [PATCH] drivers/platform/x86: Fix memory leak
Date: Fri,  3 Jun 2011 20:55:43 +0200
Message-ID: <1307127343-14290-1-git-send-email-andre.bartke@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37039 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754290Ab1FCS5f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 14:57:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: cezary.jackiewicz@gmail.com
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Bartke <andre.bartke@gmail.com>

data is not freed in the error case of
compal_probe().

Signed-off-by: Andre Bartke <andre.bartke@gmail.com>
---
 drivers/platform/x86/compal-laptop.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 3f204fd..8877b83 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1030,8 +1030,10 @@ static int __devinit compal_probe(struct platform_device *pdev)
 	initialize_fan_control_data(data);
 
 	err = sysfs_create_group(&pdev->dev.kobj, &compal_attribute_group);
-	if (err)
+	if (err) {
+		kfree(data);
 		return err;
+	}
 
 	data->hwmon_dev = hwmon_device_register(&pdev->dev);
 	if (IS_ERR(data->hwmon_dev)) {
-- 
1.7.5.2
