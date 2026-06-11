Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AE378833
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166591; cv=none; b=M2S03hyLFzG/wI44KdUpCNDI4fMOab4IycFZ6NQUuYR2XUUdhO9pBDPEDRXFud9XY/BRU0oyXWqeVRNOab6RxlAqY9l0SRFAtfE73onUxkMQGcBxnNIDZBg7zlZUzjsmcY1PFXeryip7dk+g+2EL0eK9Ed19W08z63mM0mKpT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166591; c=relaxed/simple;
	bh=eOXUiRTU62DT8pBaqCNMtgFsXYo1Mq3DTgIfeZj/3VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NG+yEmeTHo09pSo1tuJDXMTYqAdPKog0BgO3WcqWMc8zUqagvvkTWVNgELyWD/bdkkymWI5ud7Pwjjl/TcLu9N/mmsnObH1O1byFGZLpZyaTA6g5FGoE7qwKDkVT37G1pghk9YHjlXvUKGPwT1WLO+tthJyfwOAShsVsooEZ3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5Z0jvzE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5Z0jvzE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so10224205a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166588; x=1781771388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmQBDUKUi8edzX/XCrjva8dOSDu8H7sDICZRwwYP1I8=;
        b=M5Z0jvzE0ewJn4gkTo6kLtmSgk47oUCD+UARW6z+VuJ72zPlGiYsAgud0ak3W/GYzx
         Sz4o5yKZM5/tYmPYucdeG0vtcfJUp3PhZQNFK6Edg8DldLsu1HyF5eZB64m2gXcupvQH
         ym4nEt0sM3LgDI6IIshYwsAZmf7eP0/hAD6WChIh1UYldVwX3STlsIaR8Hul6pX6y0/x
         rAefGBvcycD5PyP8HgoSU5daZ5ZvgDqKTp0au+WvQxuTahBbCesHFE4T10c/ULNHMr6F
         Hg715BrqjARf2lEgDYJoc8Fu87VK4XpD4vPMbFsS7fAulLKIwXK1uFdxftiLBaJP5Ty3
         WRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166588; x=1781771388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmQBDUKUi8edzX/XCrjva8dOSDu8H7sDICZRwwYP1I8=;
        b=lajDlxCEVw4C4WU5j/FHzZCoyhaIgndgzf4Qh7yHkZyshTPRyvcQ2+F/sIo3riVgFq
         n+BFVlqQbrTDvc9ntEytEFkTw9cJzWVQ6fuAHhv+kaIln2hOXK5UVY8NtkKOqBdq3+5f
         ajG7iEDnaxvjb/fkNyAwX8mctvPtOYZEIyJaAhj+O03lQQ3A9/kI67lkzWYQlev/qoQ6
         OGU2U++A9Y7l7MaUISx3VUE4/7r+dyXvroSu/SMVLr89Pe3YS9eOTfpoBMo5e53cSVBe
         5PvUNhXe+ziIf3Okbb9oLaPScwxvkX/f/typG1R3OcGF/+1ORNcG2Kd9agHrjwuUXwY6
         jk1w==
X-Gm-Message-State: AOJu0Ywxeek38je4B8028JmX2eTv++DDcYQtOBazr9NBTwJXtvuhxksw
	5pRQpa51PQvRtS0zdyI4IN2+U9QV9ZUJVat7z75nLczks3s39X0dbHvtrW2XqQJM
X-Gm-Gg: Acq92OHVOrpHOBrm5D2ItYmMOkaoAteRO3YzCF4MOqc9IB2BcoQ36jyQjSDZldyRXyZ
	piMk+xIJjm5Gjdqkh+dPkHqxq32RNHqZHqq9BhgROdBPvL9WKMvCKjJA+2ImDbeBXDgFMbicQEI
	Y1MuDwTT2Fcwj2gcmGtzRA7MwpB6pwbgZK05gGRxfWDuBn6iOajG6MXWR4oAPPhCyM8HOf3AdId
	JNArBCVF+cDKu6QE9/t2EDe5UK+XkpeIycOf/B09wFw5btqNRfjcO9nTN+u8Ycy+YNST1dJXSAp
	UuevqwvXG0mwtiNM2SVg+jh/cE+Y8JPu0/XdgNLuNr46Qu6b+kyLmIAMsNLEvLGhP7FyOcnZb14
	ly0x0sKrBXFScOKk0NZAlXJPbH7bc3tAg8FQQrHdi3CPd/ThGT4Oqax/K7oYSsaaboix4guzjSD
	3kKjOat/vKD1j0wSffO084oS//1m+x
X-Received: by 2002:a17:907:72c5:b0:bfa:e7bb:f059 with SMTP id a640c23a62f3a-bfc872e1864mr83710166b.38.1781166587795;
        Thu, 11 Jun 2026 01:29:47 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b771bsm27347866b.54.2026.06.11.01.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:29:47 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 11 Jun 2026 11:29:35 +0300
Subject: [PATCH v3 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-x86-tablets-yogabook-v3-1-de407672e4df@gmail.com>
References: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com>
In-Reply-To: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781166586; l=4628;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=eOXUiRTU62DT8pBaqCNMtgFsXYo1Mq3DTgIfeZj/3VU=;
 b=gDj93c7t2OqR53+FQYzQ/LZ75vY8UAcvLzJMfq9yerw85y76lJlVyRloRlCzyrli+THWtR3wn
 wKzMbQj9tc4B34QGvTzOhTifkaV87bZmk88xRnRsCNMTLi//zNFkLwF
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Add drv2604l i2c_board_info for drv2604l haptics drivers present in
Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
initialization and self-calibration.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 94 +++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..81453217fec5 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -10,6 +10,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/efi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -114,6 +116,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_0_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_0_props,
+};
+
+static const struct property_entry lenovo_yb1_x9x_drv2604l_1_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_1_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -159,6 +187,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.polarity = ACPI_ACTIVE_LOW,
 			.con_id = "wacom_irq",
 		},
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.0",
+			.swnode = &lenovo_yb1_x9x_drv2604l_0_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.1",
+			.swnode = &lenovo_yb1_x9x_drv2604l_1_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C4",
 	}, {
 		/* LP8557 Backlight controller */
 		.board_info = {
@@ -283,9 +329,57 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	int ret = 0;
+
+	struct device *drv2604l_0_dev __free(put_device) =
+		bus_find_device_by_name(&i2c_bus_type, NULL,
+					YB1_X91_DRV2604L_0_DEVICE);
+	if (!drv2604l_0_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_0_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_0_dev,
+						  lenovo_yb1_x9x_drv2604l_0_props,
+						  NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s: %d\n",
+		       YB1_X91_DRV2604L_0_DEVICE, ret);
+		return ret;
+	}
+
+	struct device *drv2604l_1_dev __free(put_device) =
+		bus_find_device_by_name(&i2c_bus_type, NULL,
+					YB1_X91_DRV2604L_1_DEVICE);
+	if (!drv2604l_1_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_1_dev,
+						  lenovo_yb1_x9x_drv2604l_1_props,
+						  NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		return ret;
+	}
+
+	return 0;
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
+	.init = lenovo_yb1_x91_init,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */

-- 
2.53.0

