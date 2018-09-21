From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/6] platform/x86: acerhdf: mark appropriate content with __init prefix
Date: Thu, 20 Sep 2018 21:44:20 -0400
Message-ID: <20180921014421.30804-6-paul.gortmaker@windriver.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

These three functions are only called from the probe code which is
already marked __init and hence these can be __init as well.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/acerhdf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index eddcd8e94a88..5f579fcde315 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -619,7 +619,7 @@ static int str_starts_with(const char *str, const char *start)
 }
 
 /* check hardware */
-static int acerhdf_check_hardware(void)
+static int __init acerhdf_check_hardware(void)
 {
 	char const *vendor, *version, *product;
 	const struct bios_settings *bt = NULL;
@@ -695,7 +695,7 @@ static int acerhdf_check_hardware(void)
 	return 0;
 }
 
-static int acerhdf_register_platform(void)
+static int __init acerhdf_register_platform(void)
 {
 	int err = 0;
 
@@ -727,7 +727,7 @@ static void acerhdf_unregister_platform(void)
 	platform_driver_unregister(&acerhdf_driver);
 }
 
-static int acerhdf_register_thermal(void)
+static int __init acerhdf_register_thermal(void)
 {
 	cl_dev = thermal_cooling_device_register("acerhdf-fan", NULL,
 						 &acerhdf_cooling_ops);
-- 
2.15.0
