From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v1 1/1] platform/mellanox: fix the mlx-bootctl sysfs
Date: Mon,  9 Dec 2019 14:23:29 -0500
Message-ID: <94727fab054309cd98c876748fd27b130ce5031f.1575918870.git.lsun@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>
Cc: Liming Sun <lsun@mellanox.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a follow-up commit for the sysfs attributes to change
from DRIVER_ATTR to DEVICE_ATTR according to some initial comments.
In such case, it's better to point the sysfs path to the device
itself instead of the driver. This commit adds the missing
sysfs_create_group() so the attributes can be created under the
device. The ABI document is also updated.

Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 Documentation/ABI/testing/sysfs-platform-mellanox-bootctl | 10 +++++-----
 drivers/platform/mellanox/mlxbf-bootctl.c                 | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
index c65a805..401d202 100644
--- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
+++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/devices/MLNXBF04:00/driver/lifecycle_state
+What:		/sys/bus/platform/devices/MLNXBF04:00/lifecycle_state
 Date:		Oct 2019
 KernelVersion:	5.5
 Contact:	"Liming Sun <lsun@mellanox.com>"
@@ -10,7 +10,7 @@ Description:
 		  GA Non-Secured - Non-Secure chip and not able to change state
 		  RMA - Return Merchandise Authorization
 
-What:		/sys/bus/platform/devices/MLNXBF04:00/driver/post_reset_wdog
+What:		/sys/bus/platform/devices/MLNXBF04:00/post_reset_wdog
 Date:		Oct 2019
 KernelVersion:	5.5
 Contact:	"Liming Sun <lsun@mellanox.com>"
@@ -19,7 +19,7 @@ Description:
 		to reboot the chip and recover it to the old state if the new
 		boot partition fails.
 
-What:		/sys/bus/platform/devices/MLNXBF04:00/driver/reset_action
+What:		/sys/bus/platform/devices/MLNXBF04:00/reset_action
 Date:		Oct 2019
 KernelVersion:	5.5
 Contact:	"Liming Sun <lsun@mellanox.com>"
@@ -30,7 +30,7 @@ Description:
 		  emmc - boot from the onchip eMMC
 		  emmc_legacy - boot from the onchip eMMC in legacy (slow) mode
 
-What:		/sys/bus/platform/devices/MLNXBF04:00/driver/second_reset_action
+What:		/sys/bus/platform/devices/MLNXBF04:00/second_reset_action
 Date:		Oct 2019
 KernelVersion:	5.5
 Contact:	"Liming Sun <lsun@mellanox.com>"
@@ -44,7 +44,7 @@ Description:
 		  swap_emmc - swap the primary / secondary boot partition
 		  none - cancel the action
 
-What:		/sys/bus/platform/devices/MLNXBF04:00/driver/secure_boot_fuse_state
+What:		/sys/bus/platform/devices/MLNXBF04:00/secure_boot_fuse_state
 Date:		Oct 2019
 KernelVersion:	5.5
 Contact:	"Liming Sun <lsun@mellanox.com>"
diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
index 61753b6..9482eab 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -282,9 +282,16 @@ static bool mlxbf_bootctl_guid_match(const guid_t *guid,
 static int mlxbf_bootctl_probe(struct platform_device *pdev)
 {
 	struct arm_smccc_res res = { 0 };
+	struct device *dev = &pdev->dev;
 	guid_t guid;
 	int ret;
 
+	ret = sysfs_create_group(&dev->kobj, &mlxbf_bootctl_group);
+	if (ret) {
+		dev_err(dev, "failed to create attributes, err=%d\n", ret);
+		return ret;
+	}
+
 	/* Ensure we have the UUID we expect for this service. */
 	arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);
 	guid_parse(mlxbf_bootctl_svc_uuid_str, &guid);
@@ -305,8 +312,16 @@ static int mlxbf_bootctl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int mlxbf_bootctl_remove(struct platform_device *pdev)
+{
+	sysfs_remove_group(&pdev->dev.kobj, &mlxbf_bootctl_group);
+
+	return 0;
+}
+
 static struct platform_driver mlxbf_bootctl_driver = {
 	.probe = mlxbf_bootctl_probe,
+	.remove = mlxbf_bootctl_remove,
 	.driver = {
 		.name = "mlxbf-bootctl",
 		.groups = mlxbf_bootctl_groups,
-- 
1.8.3.1
