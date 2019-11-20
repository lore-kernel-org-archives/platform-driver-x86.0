From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] platform/mellanox: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:40:09 +0800
Message-ID: <20191120134009.14222-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/platform/mellanox/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 386336d1e48b..56e037623b29 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -41,19 +41,19 @@ config MLXBF_TMFIFO
 	depends on VIRTIO_CONSOLE && VIRTIO_NET
 	help
 	  Say y here to enable TmFifo support. The TmFifo driver provides
-          platform driver support for the TmFifo which supports console
-          and networking based on the virtio framework.
+	  platform driver support for the TmFifo which supports console
+	  and networking based on the virtio framework.
 
 config MLXBF_BOOTCTL
 	tristate "Mellanox BlueField Firmware Boot Control driver"
 	depends on ARM64
 	depends on ACPI
 	help
-          The Mellanox BlueField firmware implements functionality to
-          request swapping the primary and alternate eMMC boot partition,
-          and to set up a watchdog that can undo that swap if the system
-          does not boot up correctly. This driver provides sysfs access
-          to the userspace tools, to be used in conjunction with the eMMC
-          device driver to do necessary initial swap of the boot partition.
+	  The Mellanox BlueField firmware implements functionality to
+	  request swapping the primary and alternate eMMC boot partition,
+	  and to set up a watchdog that can undo that swap if the system
+	  does not boot up correctly. This driver provides sysfs access
+	  to the userspace tools, to be used in conjunction with the eMMC
+	  device driver to do necessary initial swap of the boot partition.
 
 endif # MELLANOX_PLATFORM
-- 
2.17.1
