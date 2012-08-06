From: manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH] thinkpad-acpi: recognize latest V-Series
	using DMI_BIOS_VENDOR
Date: Mon,  6 Aug 2012 16:23:20 -0500
Message-ID: <1344288200-8502-1-git-send-email-manoj.iyer@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

From: Manoj Iyer <manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

In the latest V-series bios DMI_PRODUCT_VERSION does not contain
the string Lenovo or Thinkpad, but is set to the model number, this
causes the thinkpad_acpi module to fail to load. Recognize laptop
as Lenovo using DMI_BIOS_VENDOR instead, which is set to Lenovo.

Signed-off-by: Manoj Iyer <manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e7f7328..17692c8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8658,11 +8658,16 @@ static int __must_check __init get_thinkpad_model_data(
 	}
 
 	s = dmi_get_system_info(DMI_PRODUCT_VERSION);
-	if (s && !(strnicmp(s, "ThinkPad", 8) && strnicmp(s, "Lenovo", 6))) {
+	if (s && !(strnicmp(s, "ThinkPad", 8) && strnicmp(s, "Lenovo", 6)))
 		tp->model_str = kstrdup(s, GFP_KERNEL);
-		if (!tp->model_str)
-			return -ENOMEM;
-	}
+	else {
+		s = dmi_get_system_info(DMI_BIOS_VENDOR);
+		if (s && !(strnicmp(s, "Lenovo", 6)))
+			tp->model_str = kstrdup(s, GFP_KERNEL);
+	} 
+
+	if (!tp->model_str)
+		return -ENOMEM;
 
 	s = dmi_get_system_info(DMI_PRODUCT_NAME);
 	tp->nummodel_str = kstrdup(s, GFP_KERNEL);
-- 
1.7.9.5


------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
