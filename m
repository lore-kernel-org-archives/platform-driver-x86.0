From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 1/7] platform_data/mlxreg: Document fixes for hotplug device
Date: Tue, 27 Mar 2018 10:02:01 +0000
Message-ID: <1522144927-56512-2-git-send-email-vadimp@mellanox.com>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove redunadant description of label in struct mlxreg_hotplug_device.

Change location of access_mode in struct mlxreg_hotplug_device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/platform_data/mlxreg.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 2744cff..19f5cb61 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -58,11 +58,10 @@ struct mlxreg_hotplug_device {
  * struct mlxreg_core_data - attributes control data:
  *
  * @label: attribute label;
- * @label: attribute register offset;
  * @reg: attribute register;
  * @mask: attribute access mask;
- * @mode: access mode;
  * @bit: attribute effective bit;
+ * @mode: access mode;
  * @np - pointer to node platform associated with attribute;
  * @hpdev - hotplug device data;
  * @health_cntr: dynamic device health indication counter;
-- 
2.1.4
