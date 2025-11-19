Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C682820B80B;
	Wed, 19 Nov 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513203; cv=none; b=MrNPcKDCDY/rXdEhzVgNBU09v2CX+ggkZTgaRLXLisDcf4KVk9Um3UYRgRwKSEwn/uZb6EGIzmERXhNmP16qDQSoWvkCXp5gTzudfF2E/huT9gOrKqK7i3njtaMROpxOMlWBr0FX99rHABDOSoiW3zDzmvdUIWVu11FZn8Mt/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513203; c=relaxed/simple;
	bh=Wfu9i4e4wEFMx2aRATlYI3jpvrmK/iJtkoSdP2AQcko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl/A/+Ea+ygJKTwgrJBb6w3QRbjsDi9CdmZj61mkyfzhTqwjYtIbgZE23QD/0pTIp0tPt8Hd3j0A9wPms11y5gPwPV+0UGbMgxI+UF6c/o3UVCK3McReySsnYqRWF6gfzTKxBNqJLulhdLD3UmIuw7RFXU1PP7wpZUHBGp8azsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8go9U4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8go9U4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C2CC4CEF5;
	Wed, 19 Nov 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763513203;
	bh=Wfu9i4e4wEFMx2aRATlYI3jpvrmK/iJtkoSdP2AQcko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t8go9U4xqjRVR2uKg245VTigteivmUxvUGWjQmPqbx4zP36Th63tlpzjFSBwK6gUL
	 KoLOQO1MIMBFv44obUbS4zy9MSacKQnuvL7T6UVJSjFNo2OMRNp0Z00ynWtKSabgqo
	 ceqZ0cJLBm/1eW+xieWxShdQ+4x8rbCS0MiAZkKCgOnflQWSGffyeuvtay/3Dh5t/9
	 G+4hZQc+sSCa2UyJFr0isfPsrh4+CSHuOcxBMfW8aMYa7XajPWc7pYMq4A2bBwc6Sr
	 6v0X/eBKwijw6qk0MWnHMm36RCTrfwvvngFtOGCs9i/fu09sZNEJd+2OKMJsALAkyT
	 ivRcD844ZvjPQ==
Received: by venus (Postfix, from userid 1000)
	id 933B118121D; Wed, 19 Nov 2025 01:46:38 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 19 Nov 2025 01:41:42 +0100
Subject: [PATCH v2 3/4] platform: arm64: thinkpad-t14s-ec: add system PM
 hooks
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-thinkpad-t14s-ec-improvements-v2-3-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3943; i=sre@kernel.org;
 h=from:subject:message-id; bh=Wfu9i4e4wEFMx2aRATlYI3jpvrmK/iJtkoSdP2AQcko=;
 b=kA0DAAoB2O7X88g7+poByyZiAGkdE22jI2ZzfxN2zN66zgiYsDTEsmH2Yep7SfZdnocSWChy9
 YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpHRNtAAoJENju1/PIO/qaY44P/inz
 47v1QihpG0ykBD2sAKtdnOF7ULJRe6TIyQWUeOxpfqMzg5lGgAecRmfWlXXn7/nZi7PlBG6ycmw
 GIo9DJMUG1y9hT8/l2JyiUsoLO9U6IEt33gFQHkc/nlyIRJ45OLR7d1acxhgrPHCrcjDx3Odkua
 6/2booVDtpVwUFxL0s1YiUWs3BD0sLX3/PMKDAjO4iJafTlCwUAt49pDJ91nvAH7XH50HvKhLcu
 Q5jak9BYwZL4EW+asfWB3fNdc9kDwObkp9++N9DrHBmQwf8/uvWtFOJsiijMcFfLjwgM5GAr9gL
 6xdhLaYOACg5lISzLkMO9fsX7fq2W9jzZw31YO3hgVcyrJWTXAuyC2TkGRQtXs2/TnHjUgr+qVn
 yXzN8og1+dUckEZ34pRyng0Jpd64/0QHj80Dfvxfx0bNKRY8dW3sw5qKy+epY5bY+/9xWYPRwXi
 Nxw6et9Vc6ATX67qaEM/QNiY3y2eYGbvmR5eXXY8+hLwa3wiLGQK30QZMSYy8UbX31R6AF1atOP
 99Ad8v0aQSbuSDtZ+KAuZGq7jw/kq2iI7Qxa/fP9ErWb3BGpoFqk1HTMQe9ZC8aOuUDpqF1c/RH
 znRJaCHwR7d9tg8Fjv8KH4mkbgvZYsNBmp5sQqmy7Lm8fw7j2IbPKtbnZ5wHbf/Q1u11HFxJHx3
 uPFcZ
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Improve support for system suspend. The register information has been
extracted from the ACPI DSDT code handling Windows Modern Standby. I
took over the weird multi-write function from the ACPI DSDT code where
it is called ECWS.

In addition to writing to the 0xE0 register, the ACPI Windows Modern
Standby code also does some changes to the thermal configuration. This
part is not implemented.

After this patch the laptop's power and LID LEDs will switch into the
typical breathing animation when the system is suspended and enabled
normally again after resuming.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 54 +++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index cf6a1d3b2617..cf8eff50d710 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -20,19 +20,23 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/pm.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
 #define T14S_EC_CMD_EVT		0xf0
 
-#define T14S_EC_REG_LED		0x0c
-#define T14S_EC_REG_KBD_BL1	0x0d
-#define T14S_EC_REG_KBD_BL2	0xe1
-#define T14S_EC_KBD_BL1_MASK	GENMASK_U8(7, 6)
-#define T14S_EC_KBD_BL2_MASK	GENMASK_U8(3, 2)
-#define T14S_EC_REG_AUD		0x30
-#define T14S_EC_MIC_MUTE_LED	BIT(5)
-#define T14S_EC_SPK_MUTE_LED	BIT(6)
+#define T14S_EC_REG_LED				0x0c
+#define T14S_EC_REG_KBD_BL1			0x0d
+#define T14S_EC_REG_MODERN_STANDBY		0xe0
+#define T14S_EC_MODERN_STANDBY_ENTRY		BIT(1)
+#define T14S_EC_MODERN_STANDBY_EXIT		BIT(0)
+#define T14S_EC_REG_KBD_BL2			0xe1
+#define T14S_EC_KBD_BL1_MASK			GENMASK_U8(7, 6)
+#define T14S_EC_KBD_BL2_MASK			GENMASK_U8(3, 2)
+#define T14S_EC_REG_AUD				0x30
+#define T14S_EC_MIC_MUTE_LED			BIT(5)
+#define T14S_EC_SPK_MUTE_LED			BIT(6)
 
 #define T14S_EC_EVT_NONE			0x00
 #define T14S_EC_EVT_KEY_FN_4			0x13
@@ -202,6 +206,14 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
 	return ret;
 }
 
+static void t14s_ec_write_sequence(struct t14s_ec *ec, u8 reg, u8 val, u8 cnt)
+{
+	int i;
+
+	for (i = 0; i < cnt; i++)
+		regmap_write(ec->regmap, reg, val);
+}
+
 static int t14s_led_set_status(struct t14s_ec *ec,
 			       struct t14s_ec_led_classdev *led,
 			       const enum t14s_ec_led_status_t ledstatus)
@@ -554,6 +566,7 @@ static int t14s_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->dev = dev;
+	i2c_set_clientdata(client, ec);
 
 	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
 				      ec, &t14s_ec_regmap_config);
@@ -593,6 +606,26 @@ static int t14s_ec_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int t14s_ec_suspend(struct device *dev)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
+
+	return 0;
+}
+
+static int t14s_ec_resume(struct device *dev)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+			       T14S_EC_MODERN_STANDBY_EXIT, 3);
+
+	return 0;
+}
+
 static const struct of_device_id t14s_ec_of_match[] = {
 	{ .compatible = "lenovo,thinkpad-t14s-ec" },
 	{}
@@ -605,10 +638,15 @@ static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);
 
+static const struct dev_pm_ops t14s_ec_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(t14s_ec_suspend, t14s_ec_resume)
+};
+
 static struct i2c_driver t14s_ec_i2c_driver = {
 	.driver = {
 		.name = "thinkpad-t14s-ec",
 		.of_match_table = t14s_ec_of_match,
+		.pm = &t14s_ec_pm_ops,
 	},
 	.probe = t14s_ec_probe,
 	.id_table = t14s_ec_i2c_id_table,

-- 
2.51.0

