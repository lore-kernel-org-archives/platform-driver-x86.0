From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 06/11] platform_data/mlxreg: Add support for complex attributes
Date: Tue, 14 Jul 2020 15:01:58 +0300
Message-ID: <20200714120203.10352-7-vadimp@mellanox.com>
References: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714120203.10352-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add new field 'regnum' to the structure 'mlxreg_core_data' to specify
the number of registers occupied by multi-register attribute.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/platform_data/mlxreg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index b8da8aef2446..a2adc3ad45f2 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -80,6 +80,7 @@ struct mlxreg_hotplug_device {
  * @hpdev - hotplug device data;
  * @health_cntr: dynamic device health indication counter;
  * @attached: true if device has been attached after good health indication;
+ * @regnum: number of registers occupied by multi-register attribute;
  */
 struct mlxreg_core_data {
 	char label[MLXREG_CORE_LABEL_MAX_SIZE];
@@ -92,6 +93,7 @@ struct mlxreg_core_data {
 	struct mlxreg_hotplug_device hpdev;
 	u8 health_cntr;
 	bool attached;
+	u8 regnum;
 };
 
 /**
-- 
2.11.0
