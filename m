From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v2 4/7] platform: mellanox: add new ODM system types to mlx-platform
Date: Mon,  7 May 2018 06:48:52 +0000
Message-ID: <1525675735-125547-2-git-send-email-vadimp@mellanox.com>
References: <1525675735-125547-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525675735-125547-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add new ODM system types, matched according to DMI_BOARD_NAME. The
supported ODM Ids are: VMOD0001, VMOD0002, VMOD0003, VMOD0004, VMOD0005.
Patch does not introduce new systems, but allows to ODM companies to set
DMI_BOARD_VENDOR and DMI_PRODUCT_NAME on their own. It assumes that ODM
company can't change DMI_BOARD_NAME.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
 Comments pointed out by Darren:
 - Modify commit message;
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
