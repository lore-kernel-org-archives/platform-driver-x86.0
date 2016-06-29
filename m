From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][V2] intel-hid: remove duplicated acpi_remove_notify_handler and extra indents
Date: Wed, 29 Jun 2016 11:41:15 +0800
Message-ID: <1467171675-32174-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:45721 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455AbcF2DmB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 23:42:01 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

Two lines are indented incorrectly and is fixed. The second call to 
acpi_remove_notify_handler does not result in panic or generate error
messages, but it is unnecessary and the function returns with an error.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index a818db6..ed58742 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -122,8 +122,8 @@ static int intel_hid_input_setup(struct platform_device *device)
 	return 0;
 
 err_free_device:
-		input_free_device(priv->input_dev);
-		return ret;
+	input_free_device(priv->input_dev);
+	return ret;
 }
 
 static void intel_hid_input_destroy(struct platform_device *device)
@@ -224,7 +224,6 @@ static int intel_hid_remove(struct platform_device *device)
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
 	intel_hid_input_destroy(device);
 	intel_hid_set_enable(&device->dev, 0);
-	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
 
 	/*
 	 * Even if we failed to shut off the event stream, we can still
-- 
2.7.4
