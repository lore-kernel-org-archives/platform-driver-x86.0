From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform/x86: panasonic-laptop: set pcc after null device check to avoid null pointer dereference
Date: Mon, 28 Mar 2016 17:26:12 +0100
Message-ID: <1459182372-14018-1-git-send-email-colin.king@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51090 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753761AbcC1Q0Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 12:26:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harald Welte <laforge@gnumonks.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

acpi_pcc_hotkey_remove sanity checks to see if device is null, however,
this check is performed after we have already passed device into a call
to acpi_driver_data.  If device is null, then acpi_driver_data will produce
a null pointer dereference on device. The correct action is to sanity check
device, then assign pcc, then check if pcc is null.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/panasonic-laptop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 3f87097..39c1ebc 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -651,9 +651,13 @@ out_hotkey:
 
 static int acpi_pcc_hotkey_remove(struct acpi_device *device)
 {
-	struct pcc_acpi *pcc = acpi_driver_data(device);
+	struct pcc_acpi *pcc;
+
+	if (!device)
+		return -EINVAL;
 
-	if (!device || !pcc)
+	pcc = acpi_driver_data(device);
+	if (!pcc)
 		return -EINVAL;
 
 	sysfs_remove_group(&device->dev.kobj, &pcc_attr_group);
-- 
2.7.4
