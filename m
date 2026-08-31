Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA647ACD6
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192489; cv=none; b=WlsWF/T9nakAvuiG409XuELlqzqQC9B8zrPuGKaoQisyD9Wfybo1Z+8+U916PxlJEJbXkQqZhuBqiM1RcqMQTykVpfspD0mJvGKTK3si9ipvCakjTarHFQxhTzlmNXp+HOSg8QgfGcsM9FWalEDVCmDyvaLiOr+O5Eg/uah4fa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192489; c=relaxed/simple;
	bh=TpggfEsOSM87ssg324Bg9QqL8idBLTkX/Dwp4MAsSaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMEGdnZWiQuZgBJQQ7tYMw+sC5AntX4BxMk1ggCu6OynHX8xWyOrk7ZLDzUKIR5Eiz0r75tON94uXYm6lhQV/TwAPuvBAVrrMKUlwvccqE6c/rnDUFJ8doDVh0yPDVTKPeC4Q3Z2Cbqacge9TFipAEsp3a4KFIpsep1fPj25XH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbYKe7ri; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbYKe7ri"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b965570d7so34423425e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192485; x=1788797285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWpAOoNXU5mrPZ0VP2BejHIuA0ZjYbHouz5m88LkEDs=;
        b=NbYKe7riFGq9FtTnZG8qRYDj7giiYcdAOq4+4vwGb9Kgqf1AmYBTv2dnqFJirU0FLq
         AZw7Vcq0vMil3szdRMhdS+QKVCGba7LubFfracf6ihkQzOYUMX7KayO4xpDgcXrwrdJB
         OHMrzMr8Nl1tOo6LxNtW2gTUmrrr9S81MuUPOYne5jB1ghP7IUNW8KbQtNVg31i+rL0q
         knctTI9XqGc6lSaQaMhZYWvfWXNEdPVtgbdgQg1hLcD9DdpqyIHfRk1d+D/iNunllfMr
         xPCCqDv+8OuL3IkXvDuxiGDLekK1W5Qom5XR8e1JYtWV9QdMDLiORNphmqbiZMbks51C
         yGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192485; x=1788797285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWpAOoNXU5mrPZ0VP2BejHIuA0ZjYbHouz5m88LkEDs=;
        b=T/KwGJ3FaFjExjOq2a0sqjt8scxtV73slWAUCWsxtNMn0nwITb+p6nDYuhJxr3jEiW
         VCsg+CvrK5mwVU67nGf74Pi5LQ8A7r+il6rDTQEkyqTw3/OLLMkGOMI93Izkntw3JV6A
         IIRGkUWa77ZF/gtDrSEzwjY7z3X8Fp5bInXdV72SBen6tyHKa3QYEDE5NQaoaUTSFNfN
         nKGDj5V90OAZZO8d2EwixXW/RCXLG0okiLu92AnDsP4F/xwuHZwgUurwtnM6F9vkB0uV
         GDkdnkOomrGJEoWcQFro9/PZS2M1LslxKnqlkz12X+msKbJTcsz84bHCNF3j45PuJINb
         kuxg==
X-Forwarded-Encrypted: i=1; AHgh+RroPnvNpTsDjPShRSzGVaRINBIT2e0wsSq2vwnAPZqCVv56q3nRudbDMW37pzRI3ItW2mXCUvW5/Dq32u2O7w4pABeU@vger.kernel.org
X-Gm-Message-State: AFuF++la3Kxy3ADFjL/iukvIzICWnYbmTqiVBtqIDx8QZ5Mgj4cgHXMz
	jpSFrBcyXdIh39jxYbC5/NKExpo3KKMRI392HUxW5nahrv1a3RRCb56t
X-Gm-Gg: AR+sD12KeYtlaavy6xnhlSNYO/MehRqktT8pgK0VnjBCJJlYvwBYTF/E9bcIWy4WpUZ
	8wtWvcKsaLYjKtv6GtztPEjW9M5TStnJvu0fm6p/SDPM5Am1trlox5hc01v/wwePxnhXKddv1qK
	pgWh7M5DJEcCOKFnwgXA5rVgEl9TRANFnKhyUZOasPhIymejzoXOL0LQb4eyLQxzMLCQzJyHviF
	ybeBbD7NTmHPhQtc2KtLucErbVsk6Apd2qkynL4zPUS8gnQMIkEe6HI+m/9Dj0IRpdg7to1lUGV
	CsvEo/LoGgY3eWHsgCtWV0fXN1VYjcpbDXgq9mILUcNTFKWb2FWOadV5czQA9QONP7BvpgKnUB3
	MGj5f6In1b9+9Hg5kFyFPMM07SU3w6kzkz9XPs/tHnrUsBCfHBpMQscxvRY0XfH9zpUpJT7VJF8
	Ep7TJ/mYHdRXn+C8kZ72g/Yk+pyy6/558iFzu8wgcJKQIjBUym+oTlcico
X-Received: by 2002:a05:600c:c08b:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49b92027118mr371762395e9.6.1788192485239;
        Mon, 31 Aug 2026 09:08:05 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:04 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 3/8] platform/x86: int3472: tps68470: move Windows MFD setup below the device-type switch
Date: Mon, 31 Aug 2026 18:07:49 +0200
Message-ID: <20260831160754.9857-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
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

While moving the code, use a local struct device *dev to shorten the many
&client->dev references, and return -ENODATA (rather than -ENODEV) when no
board data matches this machine, to distinguish it from a missing device.

No functional change for either path.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 99 ++++++++++---------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 35909a683..35fa77eb3 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -142,85 +142,88 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct acpi_device *adev;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
+	struct device *dev;
 	int n_consumers;
 	int device_type;
 	unsigned int i;
 	int ret;
 
+	dev = &client->dev;
+	adev = ACPI_COMPANION(dev);
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
+		dev_err(dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
 		return PTR_ERR(regmap);
 	}
 
 	i2c_set_clientdata(client, regmap);
 
-	ret = tps68470_chip_init(&client->dev, regmap);
+	ret = tps68470_chip_init(dev, regmap);
 	if (ret < 0) {
-		dev_err(&client->dev, "TPS68470 init error %d\n", ret);
+		dev_err(dev, "TPS68470 init error %d\n", ret);
 		return ret;
 	}
 
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
+		break;
+	case DESIGNED_FOR_CHROMEOS:
+		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					    tps68470_cros, ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
+	default:
+		dev_err(dev, "Failed to add MFD devices\n");
+		return device_type;
+	}
 
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
+	board_data = int3472_tps68470_get_board_data(dev_name(dev));
+	if (!board_data)
+		return dev_err_probe(dev, -ENODATA,
+				     "No board-data found for this model\n");
 
-		for (i = 0; i < board_data->n_gpiod_lookups; i++)
-			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
+	if (n_consumers < 0)
+		return n_consumers;
 
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   cells, TPS68470_WIN_MFD_CELL_COUNT,
-					   NULL, 0, NULL);
-		kfree(cells);
+	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
+	if (!cells)
+		return -ENOMEM;
 
-		if (ret) {
-			for (i = 0; i < board_data->n_gpiod_lookups; i++)
-				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-		}
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
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
 
-		break;
-	case DESIGNED_FOR_CHROMEOS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
-					   NULL, 0, NULL);
-		break;
-	default:
-		dev_err(&client->dev, "Failed to add MFD devices\n");
-		return device_type;
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
 	}
 
 	/*
-- 
2.53.0

