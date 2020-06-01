From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 7/8] platform_data/mlxreg: Add presence register field for FAN devices
Date: Mon,  1 Jun 2020 12:18:50 +0300
Message-ID: <20200601091851.5491-8-vadimp@mellanox.com>
References: <20200601091851.5491-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add new field 'reg_prsnt' to the structure 'mlxreg_core_data' to
provide the number FAN drawers equpped within the system. The purpose
is to allow mapping between FAN drawers and FAN rotors (tachometer),
since FAN drawer can be eqipped with a few rotors.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/platform_data/mlxreg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index a2adc3ad45f2..9cffa9a64ab3 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -75,6 +75,7 @@ struct mlxreg_hotplug_device {
  * @mask: attribute access mask;
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
+ * @reg_prsnt: attribute presence register;
  * @mode: access mode;
  * @np - pointer to node platform associated with attribute;
  * @hpdev - hotplug device data;
@@ -88,6 +89,7 @@ struct mlxreg_core_data {
 	u32 mask;
 	u32 bit;
 	u32 capability;
+	u32 reg_prsnt;
 	umode_t	mode;
 	struct device_node *np;
 	struct mlxreg_hotplug_device hpdev;
-- 
2.11.0
