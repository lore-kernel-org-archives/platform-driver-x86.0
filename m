Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E54F93B0
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958854; cv=none; b=SZpcjSd/zOOdFNtr0zHTs1IJBypMUr22VaZmSRMNmQI2wH7L9HYeVKfXNUQhthVHg2BUoP7AUDZOZqCd+eG4WfpYzkNnIjpnB4gcqOYfZh26cbYtTrAyhYgFX0WOwxcdjrKBIn7WyZpjvlbUjoykfAHd9QQQuFPJSGodroc9Dhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958854; c=relaxed/simple;
	bh=lfITw/QlCPLT2hDY+F+YEFDIOjNSDWAu/9gTiS5czGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CG4FAC7p7iofgDyjQiQPSslqvR4H9uBWPYJclkTQXwg/m36YU0j24jHgb52vpb9txcwxjEA/ZIsFg/7sISKYs3dXEccmixwRy5YSIOVp+T1gc/rlwIDAh0bxeYQve89WQqlu1ZvAbE6m7mvg+TyyYRtFD+qYluqGUpjMlYmfEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaYmqquP; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaYmqquP"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-886ce63c1c5so1325336b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958852; x=1791563652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqUnd1cgNckY/e7U9WYUStVE1s7mj23JAq+2f4AlHm8=;
        b=aaYmqquPpTKsg7TC0zp6u1nBemRC6yO7jBsZRzC01BkCfnv2YUJWnOIr015zzAeoEW
         2F/WumqippgSOBV1QXgK/jF9pvEMTTklJeWCiwL8o9L0edxhBJAbamCaWIdkJ/IBS3VC
         nqYW1Bx/ZLTwEXdHR+wRkjfVa2ewKKIi4hNt4yeGf9Y6G0/ipXwjgjos1y5frl8VZujg
         IyhzjXvSS/pw3F0qD6OpvOePkqTilNaeyXfatiLKaFqKG29qIsHel6lllb80CDpfeFWe
         Ya2gEbhemnpwRM5x4cUW9/Ml7NmK1J4Pi+WMAX9jPjhiZsGc2i8Mncek4g1MDJceNbrG
         XTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958852; x=1791563652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqUnd1cgNckY/e7U9WYUStVE1s7mj23JAq+2f4AlHm8=;
        b=ZjkHzH92Laa4erQLOST5/+B9yTTegeIXlzyMdUv1hrH6Cvsfz3dCKehv8Zv6i3v2tf
         OMnTGH1oh8OVF9Q9H9lNTJGeGljSK/VzrwktefNDX2zFiEBArBIelwSvIlHcJOFula2u
         p+AbweJPL1uZHvyfQtjVBZooqC1rl4vKc0zxE21L/8Uw6VFCyVzsAhU78YVd/jNNVTz9
         Dtr8KLuaRxH/q0HaZ+15kZ9PKjRgEu0nWuqrethCRwDAAbD4RM0Y2JLf+Xpj9k4uBl8H
         a5+rFmQqHZheMll5pzyXmrtNMAZGv+NcMHiVXvLbz0gg4P9Z6sJaMW2t7tAn0PlxAPjk
         BT0A==
X-Gm-Message-State: AFuF++lmWuLY7+B0NYS6IWJ0kBPaAIEDPGxWINkO1QWnCzTilP6ArXy2
	Aq60YAHmQej+qQ+DHw1Ps2gdNwJGDgXCijCnJIkZtZdWPC0lFdMBzaWG
X-Gm-Gg: AYBFou1JB/S+rAK7DuZelHCCnB53d0xPPIaBrsPgJnN87tGr1Gh0gXOda4X4U0OqaZw
	JO4S+iJ8p1zvqn7GaAI2ycMyIL5Kw8axH/ojEG0JpnCBO7vYDw7wrw2OO2VbuF8kLqopDaLkfCF
	QjlvREdvBo0w2EKYWWnryS5lv0MydQgslxvkW0jPWQmZ2UPguV1PkcHtGGQAYe0GnX/CcWKgwjS
	T3Sn76/DZHPBkDabJq/rHg3gkTyhHNWhqTCVsrLIJ9BGFqjnKoPzbwDtfySNBGEDzNpI6Br4Wug
	nl8qaUSyf2pwCHHkx0oeEjV8dKGF/IsQqlynbvATbVngYcEM7zylzV6T07Mc2PqgAygviehIn7C
	Mj0F00GmY36ISEDWTaHwX23IOJPcdEbqQ7UpJgVH5Un+Ypnl7rOlK6shiLGSd4LMa1YjV4N2s2K
	LV8KqWnvlow7fPcryeRx5T2wnXzdZUcojmitqF/fg1+9sLyvgueFPyPpUgDRTA97ZVgNE=
X-Received: by 2002:a05:6a00:3e1a:b0:881:d48e:713c with SMTP id d2e1a72fcca58-88af76cd0f0mr2787395b3a.40.1790958851586;
        Fri, 02 Oct 2026 09:34:11 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:10 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 4/9] platform/x86: int3472: tps68470: move Windows MFD setup below the device-type switch
Date: Fri,  2 Oct 2026 09:33:45 -0700
Message-ID: <20261002163350.1248431-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Windows path looks up the board data, builds the tps68470-clk
platform data and registers the MFD cells; none of this is needed for the
ChromeOS path, which registers its own cells. Move that handling out of
the switch and let the ChromeOS case return directly, so the Windows-only
work is no longer done for ChromeOS and the function reads top to bottom.

While at it, return -ENODATA (rather than -ENODEV) when no board data
matches this machine, to distinguish it from a missing device.

No functional change for either path.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 88 +++++++++----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 35909a683..9161a656f 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -155,10 +155,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
@@ -176,53 +172,57 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
-		if (!board_data)
-			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
-
-		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
-		if (!cells)
-			return -ENOMEM;
-
-		/*
-		 * The order of the cells matters here! The clk must be first
-		 * because the regulator depends on it. The gpios must be last,
-		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
-		 * the clk + regulators must be ready when this happens.
-		 */
-		cells[0].name = "tps68470-clk";
-		cells[0].platform_data = clk_pdata;
-		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
-		cells[1].name = "tps68470-regulator";
-		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
-		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
-		cells[2].name = "tps68470-gpio";
-		cells[2].swnode = board_data->tps68470_gpio_swnode;
-
-		for (i = 0; i < board_data->n_gpiod_lookups; i++)
-			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   cells, TPS68470_WIN_MFD_CELL_COUNT,
-					   NULL, 0, NULL);
-		kfree(cells);
-
-		if (ret) {
-			for (i = 0; i < board_data->n_gpiod_lookups; i++)
-				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-		}
-
 		break;
 	case DESIGNED_FOR_CHROMEOS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
-					   NULL, 0, NULL);
-		break;
+		return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+					    tps68470_cros, ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
 	default:
 		dev_err(&client->dev, "Failed to add MFD devices\n");
 		return device_type;
 	}
 
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+	if (!board_data)
+		return dev_err_probe(&client->dev, -ENODATA,
+				     "No board-data found for this model\n");
+
+	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+	if (n_consumers < 0)
+		return n_consumers;
+
+	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
+	if (!cells)
+		return -ENOMEM;
+
+	/*
+	 * The order of the cells matters here! The clk must be first
+	 * because the regulator depends on it. The gpios must be last,
+	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
+	 * the clk + regulators must be ready when this happens.
+	 */
+	cells[0].name = "tps68470-clk";
+	cells[0].platform_data = clk_pdata;
+	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
+	cells[1].name = "tps68470-regulator";
+	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
+	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
+	cells[2].name = "tps68470-gpio";
+	cells[2].swnode = board_data->tps68470_gpio_swnode;
+
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
+
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+	}
+
 	/*
 	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
 	 * for the GPIO cell already does this.
-- 
2.53.0

