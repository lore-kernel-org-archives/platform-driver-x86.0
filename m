From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 23/44] platform/x86: intel_telemetry: report debugfs failure
Date: Tue, 13 Nov 2018 00:49:29 -0500
Message-ID: <20181113054950.77898-23-sashal@kernel.org>
References: <20181113054950.77898-1-sashal@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181113054950.77898-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, Matt Turner <matt.turner@intel.com>, Len Brown <len.brown@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>

[ Upstream commit 8d98b1ef368feeb7720b8b9b6f3bd93f2ad892bc ]

On some Goldmont based systems such as ASRock J3455M the BIOS may not
enable the IPC1 device that provides access to the PMC and PUNIT. In
such scenarios, the IOSS and PSS resources from the platform device can
not be obtained and result in a invalid telemetry_plt_config which is an
internal data structure that holds platform config and is maintained by
the telemetry platform driver.

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
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index ffd0474b0531..1423fa8710fd 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -951,12 +951,16 @@ static int __init telemetry_debugfs_init(void)
 	debugfs_conf = (struct telemetry_debugfs_conf *)id->driver_data;
 
 	err = telemetry_pltconfig_valid();
-	if (err < 0)
+	if (err < 0) {
+		pr_info("Invalid pltconfig, ensure IPC1 device is enabled in BIOS\n");
 		return -ENODEV;
+	}
 
 	err = telemetry_debugfs_check_evts();
-	if (err < 0)
+	if (err < 0) {
+		pr_info("telemetry_debugfs_check_evts failed\n");
 		return -EINVAL;
+	}
 
 	register_pm_notifier(&pm_notifier);
 
-- 
2.17.1
