From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v1] platform/x86: thinkpad_acpi: Limit size
 when call strndup_user()
Date: Tue, 14 Jul 2020 13:42:50 +0300
Message-ID: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

During conversion to use strndup_user() the commit 35d13c7a0512
("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
missed the fact that buffer coming thru procfs is not immediately NULL
terminated. We have to limit size when calling strndup_user().

Fixes: 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
Reported-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f571d6254e7c..f411ad814cab 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -886,7 +886,7 @@ static ssize_t dispatch_proc_write(struct file *file,
 	if (!ibm || !ibm->write)
 		return -EINVAL;
 
-	kernbuf = strndup_user(userbuf, PAGE_SIZE);
+	kernbuf = strndup_user(userbuf, min_t(long, count, PAGE_SIZE));
 	if (IS_ERR(kernbuf))
 		return PTR_ERR(kernbuf);
 
-- 
2.27.0
