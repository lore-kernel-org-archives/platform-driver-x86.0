From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] platform/mellanox: Use 2-factor allocator calls
Date: Wed, 4 Jul 2018 10:29:08 -0700
Message-ID: <20180704172908.GA33650@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As already done treewide, switch from open-coded multiplication to using
2-factor allocation helpers.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/platform/mellanox/mlxreg-io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index c192dfe6bd65..acfaf64ffde6 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -152,8 +152,8 @@ static int mlxreg_io_attr_init(struct mlxreg_io_priv_data *priv)
 {
 	int i;
 
-	priv->group.attrs = devm_kzalloc(&priv->pdev->dev,
-					 priv->pdata->counter *
+	priv->group.attrs = devm_kcalloc(&priv->pdev->dev,
+					 priv->pdata->counter,
 					 sizeof(struct attribute *),
 					 GFP_KERNEL);
 	if (!priv->group.attrs)
-- 
2.17.1


-- 
Kees Cook
Pixel Security
