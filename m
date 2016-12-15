From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/1] platform/x86: surface3-wmi: Balance locking on error path
Date: Thu, 15 Dec 2016 03:26:27 +0200
Message-ID: <20161215012627.594-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:40238 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932261AbcLOBbF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Dec 2016 20:31:05 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

There is a possibility that lock will be left acquired.
Consolidate error path under out_free_unlock label.

Reported-by: kbuild test robot <lkp@intel.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/surface3-wmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
index 5553b2b85e0a..ed7a3b77a0cc 100644
--- a/drivers/platform/x86/surface3-wmi.c
+++ b/drivers/platform/x86/surface3-wmi.c
@@ -60,10 +60,10 @@ static DEFINE_MUTEX(s3_wmi_lock);
 
 static int s3_wmi_query_block(const char *guid, int instance, int *ret)
 {
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_status status;
 	union acpi_object *obj;
-
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int error = 0;
 
 	mutex_lock(&s3_wmi_lock);
 	status = wmi_query_block(guid, instance, &output);
@@ -77,13 +77,14 @@ static int s3_wmi_query_block(const char *guid, int instance, int *ret)
 			       obj->type == ACPI_TYPE_BUFFER ?
 						obj->buffer.length : 0);
 		}
-		kfree(obj);
-		return -EINVAL;
+		error = -EINVAL;
+		goto out_free_unlock;
 	}
 	*ret = obj->integer.value;
+out_free_unlock:
 	kfree(obj);
 	mutex_unlock(&s3_wmi_lock);
-	return 0;
+	return error;
 }
 
 static inline int s3_wmi_query_lid(int *ret)
-- 
2.11.0
