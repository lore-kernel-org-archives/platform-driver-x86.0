From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: peaq-wmi: Remove unnecessary checks from peaq_wmi_exit
Date: Mon, 30 Oct 2017 14:07:38 +0100
Message-ID: <20171030130738.14415-2-hdegoede@redhat.com>
References: <20171030130738.14415-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171030130738.14415-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

peaq_wmi_exit will only ever get called if peaq_wmi_init succeeds, so
there is no need to repeat the checks from peaq_wmi_init.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/peaq-wmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 2da48ecc90c1..9b9e1f39bbfb 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -66,7 +66,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
 }
 
 /* Some other devices (Shuttle XS35) use the same WMI GUID for other purposes */
-static const struct dmi_system_id peaq_dmi_table[] = {
+static const struct dmi_system_id peaq_dmi_table[] __initconst = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
@@ -102,12 +102,6 @@ static int __init peaq_wmi_init(void)
 
 static void __exit peaq_wmi_exit(void)
 {
-	if (!dmi_check_system(peaq_dmi_table))
-		return;
-
-	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
-		return;
-
 	input_unregister_polled_device(peaq_poll_dev);
 }
 
-- 
2.14.2
