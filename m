From: Joe Perches <joe@perches.com>
Subject: [PATCH 13/23] intel_menlow: Add pr_fmt and use pr_<level>
Date: Tue, 29 Mar 2011 15:21:44 -0700
Message-ID: <5ded04772957a76cc84832130be36f368035557d.1301436234.git.joe@perches.com>
References: <cover.1301436234.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1301436234.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, Sujith Thomas <sujith.thomas@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add pr_fmt to prefix the logging messages.
Convert printk to pr_<level>.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/intel_menlow.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index eacd5da..809adea 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -27,6 +27,8 @@
  *  to get/set bandwidth.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -135,8 +137,7 @@ static int memory_set_cur_bandwidth(struct thermal_cooling_device *cdev,
 	    acpi_evaluate_integer(handle, MEMORY_SET_BANDWIDTH, &arg_list,
 				  &temp);
 
-	printk(KERN_INFO
-	       "Bandwidth value was %ld: status is %d\n", state, status);
+	pr_info("Bandwidth value was %ld: status is %d\n", state, status);
 	if (ACPI_FAILURE(status))
 		return -EFAULT;
 
-- 
1.7.4.2.g597a6.dirty
