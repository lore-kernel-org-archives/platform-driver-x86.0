From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] platform/x86: surface3-wmi: Balance locking on error path
Date: Thu, 15 Dec 2016 19:41:06 +0200
Message-ID: <20161215174106.13916-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:33883 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752075AbcLORlN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2016 12:41:13 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

There is a possibility that lock will be left acquired.
Consolidate error path under out_free_unlock label.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
In v2:
- address Darren's comments
- update tags (in particular put proper email of reporter)

I dare to push this to testing ahead. If anyone has objections, tell me asap.

 drivers/platform/x86/surface3-wmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
index 5553b2b85e0a..cbf4d83a7271 100644
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
+ out_free_unlock:
 	kfree(obj);
 	mutex_unlock(&s3_wmi_lock);
-	return 0;
+	return error;
 }
 
 static inline int s3_wmi_query_lid(int *ret)
-- 
2.11.0
