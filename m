From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Mon,  3 Sep 2018 23:34:15 +0530
Message-ID: <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, Matt Turner <matt.turner@intel.com>, Len Brown <len.brown@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On some Goldmont based systems such as ASRock J3455M the BIOS may not
enable the IPC1 device that provides access to the PMC and PUNIT. In
such scenarios, the ioss and pss resources from the platform device can
not be obtained and result in a invalid telemetry_plt_config.
This is also applicable to the platforms where the BIOS supports IPC1
device under debug configurations but IPC1 is disabled by user or the
policy.

This change allows user to know the reason for not seeing entries under
/sys/kernel/debug/telemetry/* when there is no apparent failure at boot.

Cc: Matt Turner <matt.turner@intel.com>
Cc: Len Brown <len.brown@intel.com>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=198779

Acked-by: Matt Turner <matt.turner@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index ffd0474b0531..77212e9b22d6 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -951,12 +951,16 @@ static int __init telemetry_debugfs_init(void)
 	debugfs_conf = (struct telemetry_debugfs_conf *)id->driver_data;
 
 	err = telemetry_pltconfig_valid();
-	if (err < 0)
-		return -ENODEV;
+	if (err < 0) {
+		pr_debug("Invalid pltconfig, ensure IPC1 device is enabled in BIOS\n");
+		goto exit;
+	}
 
 	err = telemetry_debugfs_check_evts();
-	if (err < 0)
-		return -EINVAL;
+	if (err < 0) {
+		pr_debug("telemetry_debugfs_check_evts failed\n");
+		goto exit;
+	}
 
 	register_pm_notifier(&pm_notifier);
 
@@ -1020,6 +1024,8 @@ static int __init telemetry_debugfs_init(void)
 	debugfs_conf->telemetry_dbg_dir = NULL;
 out_pm:
 	unregister_pm_notifier(&pm_notifier);
+exit:
+	pr_debug(pr_fmt(DRIVER_NAME) " Failed\n");
 
 	return err;
 }
-- 
2.17.1
