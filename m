From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 4/7] platform: mellanox: add new ODM system types to mlx-platform
Date: Tue, 27 Mar 2018 10:02:04 +0000
Message-ID: <1522144927-56512-5-git-send-email-vadimp@mellanox.com>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Patch adds new ODM systems, matched according to DMI_BOARD_NAME.
The supported ODM Ids are: VMOD0001, VMOD0002, VMOD0003, VMOD0004,
VMOD0005. It doesn't introduce new systems, but allows to
ODM companies to set DMI_BOARD_VENDOR and DMI_PRODUCT_NAME on
their own. It assumes that ODM company can't change DMI_BOARD_NAME.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 7a0bd24..912f844 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -844,6 +844,36 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "SN34"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0001"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn21xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0002"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn274x_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0003"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn201x_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0004"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_qmb7xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0005"),
+		},
+	},
 	{ }
 };
 
-- 
2.1.4
