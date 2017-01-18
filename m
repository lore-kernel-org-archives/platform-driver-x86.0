From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] platform/x86: surface3-wmi: fix uninitialized symbol
Date: Wed, 18 Jan 2017 09:13:46 +0100
Message-ID: <20170118081346.8451-1-benjamin.tissoires@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42906 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751441AbdARIjT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Jan 2017 03:39:19 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The patch 3dda3b3798f9: "platform/x86: Add custom surface3 platform
device for controlling LID" from Nov 25, 2016, leads to the following
static checker warning:

        drivers/platform/x86/surface3-wmi.c:168 s3_wmi_check_platform_device()
        error: uninitialized symbol 'ts_adev'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---

Hi Dan,

Sorry for the lag in treating this simple defect.

Cheers,
Benjamin

 drivers/platform/x86/surface3-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
index cbf4d83..676cfca 100644
--- a/drivers/platform/x86/surface3-wmi.c
+++ b/drivers/platform/x86/surface3-wmi.c
@@ -139,7 +139,7 @@ static acpi_status s3_wmi_attach_spi_device(acpi_handle handle,
 
 static int s3_wmi_check_platform_device(struct device *dev, void *data)
 {
-	struct acpi_device *adev, *ts_adev;
+	struct acpi_device *adev, *ts_adev = NULL;
 	acpi_handle handle;
 	acpi_status status;
 
-- 
2.9.3
