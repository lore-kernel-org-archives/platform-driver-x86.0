From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/6] platform/x86: acerhdf: Remove cut-and-paste trap from instructions
Date: Thu, 20 Sep 2018 21:44:18 -0400
Message-ID: <20180921014421.30804-4-paul.gortmaker@windriver.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Just like we avoid specifying actual block devices like sda for fdisk
and dd examples, we should not specify specific thermal zones here.

On the platform I was testing on, zone0 was acpitz, and zone1 was for
this acerhdf driver.  Make the printk such that it won't work with a
blind cut-and-paste, and force the user to determine which zone is
correct for this driver.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/Kconfig   | 5 ++++-
 drivers/platform/x86/acerhdf.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0c1aa6c314f5..1fca33c97e8a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -60,7 +60,10 @@ config ACERHDF
 
 	  After loading this driver the BIOS is still in control of the fan.
 	  To let the kernel handle the fan, do:
-	  echo -n enabled > /sys/class/thermal/thermal_zone0/mode
+	  echo -n enabled > /sys/class/thermal/thermal_zoneN/mode
+	  where N=0,1,2... depending on the number of thermal nodes and the
+	  detection order of your particular system.  The "type" parameter
+	  in the same node directory will tell you if it is "acerhdf".
 
 	  For more information about this driver see
 	  <http://piie.net/files/acerhdf_README.txt>
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 2735815c73c5..fef3b727bc24 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -688,7 +688,7 @@ static int acerhdf_check_hardware(void)
 	 */
 	if (!kernelmode) {
 		pr_notice("Fan control off, to enable do:\n");
-		pr_notice("echo -n \"enabled\" > /sys/class/thermal/thermal_zone0/mode\n");
+		pr_notice("echo -n \"enabled\" > /sys/class/thermal/thermal_zoneN/mode # N=0,1,2...\n");
 	}
 
 	return 0;
-- 
2.15.0
