Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1D36654C
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148105; cv=none; b=oE/8R3S3oeMcprL5Be2aVZCDUOOfdDF8l7lAb6UtAOSxVy6xqmluTjvZFey4+xGS2MXRL/Hkxx+e3VMRXgXcLQdw45BTdTPfj1DT3dNFoQrKNGI6uypnu//H5iprql1wty8LhpEz0jIThUfNWFCWQjo4nZnr3IOLXg5IX7i+EgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148105; c=relaxed/simple;
	bh=amIhiO6JmzW+kzPwLGwrMElO1KXnqHQPODse2YU5Vik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frzX2dlzjl87SuZbBlUK5HyeLnAmQED+o7Lp5t3rWqMECaM4YUHthID700+DOdFRVugFncd3bNQvK7XI+1QR76LCVH45hQgnSSvqOKQdjYM3MnjNeED2porFvm6MBxMeMHl4iNhcfZhqM0bJNIzgctNXAp62HZ/c0F8ng5yaBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf8Se+Jm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf8Se+Jm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499840a2575so8314375e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148102; x=1787752902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biMrT1thXy/ZTV9SLOUzhkAbxmjoLWgwh0fRGdvN4rY=;
        b=Wf8Se+JmKzc6ftaTwtrGvxwYCz/jr70Qa4GrwmRP4De1Nn2LW09ipLOIbArhpDJmzx
         PNZdMc7dpEWC9Ogj2JDDhLoILG5OfZcVZFh2nRnaPIBtimuvwuG1i5eJpf/9qVEgWbg8
         wys5sICqsxruKi5o1EvQyuuTDitMz0UoImRiqXeRFvO2VVpS2iKIs4WqdXTHY5Ir3hzU
         GuLKK1yKrKdDVP15Zea/YYVaEgEX89Jln8dMcK1EEdYiU7qv4PalNuWqHTax3R3HFidV
         fWuB66hX6xKFlnwbbpZ6bGM4LYE9bw9eQvzm8xrmqfq3ja/iEPfKmlnm/8HplS7KCIQD
         foOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148102; x=1787752902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biMrT1thXy/ZTV9SLOUzhkAbxmjoLWgwh0fRGdvN4rY=;
        b=K9ujX0hIqdrH0ZBKzeleIWF/i6fj7sz57pxtT9dGqOlCGovxJQE88vR12Rh5W/JACO
         3MwjtThjILbSyzch8uSANgx1kB/zvtEBFz9/zQ6MdoXYlhdiSJ47wTT9FcOBFsZ5Zc7/
         qGnPf8ArTgY078DQUD8xLm7NgfUbj1emrv169uNz4tbig2s4Y7mUN/1ljbGVlmNHT5Bj
         R3/uyAHy1oIzFL+BbSavm+TfI9gAd6crmr4oa6fSQv6+oxhPqCp4ymon4K2KxvP+QUr/
         gn3dyakMCPq2pkpMWLbgtf+z1fruPB+mGPX9uw+0G5dojwD5Q8N4pXVZhj0WEmfhtez6
         Q9wA==
X-Forwarded-Encrypted: i=1; AHgh+RrNrtKElb0SOPzJKCFqgG2Drt4hMwz5BRxe1DmwR0UqK19ii+ZfCw9k2klasvEWDTae5GoHNuLRRgT9ZHc/pX456Z9s@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8ilAwDoi0TpG9I9ZmvQZa/fE8UnUfPxF7CpoUPfHY1XqrMWe
	TvZCeZ4Hd0sN9VflicJQc0KjpOzbT5DT+FtXg+ylsj2MkedvpkNLJ+VT
X-Gm-Gg: AR+sD12nQDUdISLgRrJM/17rebWFLYpiIRSpOR7gCgZUSPPsVEGYDk1A4i2Ykce0iU5
	SKvWbsGs+tYEmK5rjTrYtIClDZrAV+CFNp74gl5CJ3iQRmpMuXbE9p+Tw0Sab1JgDYUMwDwbPe3
	Cjf8qc27hN1Hgd0uCH1LbD61hh1IfCPZ4npaOA5hkfS/D0mRxtkNRMRNHuQ5yDPRQTSbIkjglYv
	nEyN3YMELSEWfG3j1MbxyPzGPD1aWt2XkKwL7XhLUEHpz0tq0qKpprAQ9MJW9ckunf7NqZ4OBq+
	HyfqAyhpsEjY/FEMDTvLQPyPDMlEMgpdm1kp+egRWQxtmwlb5ZT/vgPjJDbaLzkCdIE6Vn0Innc
	TzcKxsm3MvfkmN0ihFZt4WwgSIq+GxuAarMOqgPy53bmyz1pJgXoyoWRZbefrEQqtBvRB4+uKCh
	ooGIv/kGiRaHBnFiQsJabjrwAMM0kvmV78QmBurpLyppToIFIa0fwMv9Y=
X-Received: by 2002:a05:600c:1385:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-499aa17dcd0mr80712355e9.7.1787148080332;
        Wed, 19 Aug 2026 07:01:20 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:19 -0700 (PDT)
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
Subject: [PATCH v7 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Wed, 19 Aug 2026 16:01:04 +0200
Message-ID: <20260819140107.1329091-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.

Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
INT3479 is invisible to it: the clock consumer lookup entry for the
front camera is never registered with the tps68470-clk driver, and
the OV5670 sensor driver cannot acquire its MCLK.

Fix this without touching ACPI tables by adding optional static clock
consumer fields to struct int3472_tps68470_board_data:

  unsigned int n_clk_consumers;
  const struct tps68470_clk_consumer *clk_consumers;

When board data is present and n_clk_consumers is non-zero, probe uses
the static list instead of for_each_acpi_consumer_dev() to populate
tps68470-clk platform data.  Platforms that do not set these fields
continue to use the existing ACPI traversal path unchanged.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 106 ++++++++++--------
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 2 files changed, 71 insertions(+), 45 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..6c04ea6c0 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -147,18 +147,15 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct tps68470_clk_platform_data *clk_pdata;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
+	struct gpiod_lookup_table * const *tables;
 	int n_consumers;
 	int device_type;
 	int ret;
-	int i;
+	unsigned int i;
 
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
@@ -176,52 +173,71 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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
+					    tps68470_cros,
+					    ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
 	default:
 		dev_err(&client->dev, "Failed to add MFD devices\n");
 		return device_type;
 	}
 
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+	if (!board_data)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "No board-data found for this model\n");
+
+	if (board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(&client->dev,
+					 struct_size(clk_pdata, consumers,
+						     board_data->n_clk_consumers),
+					 GFP_KERNEL);
+		if (!clk_pdata)
+			return -ENOMEM;
+		clk_pdata->n_consumers = board_data->n_clk_consumers;
+		for (i = 0; i < board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
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
+
+	tables = board_data->tps68470_gpio_lookup_tables;
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(tables[i]);
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
+
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(tables[i]);
+	}
+
 	/*
 	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
 	 * for the GPIO cell already does this.
@@ -233,7 +249,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701..1d3d67459 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,11 +12,21 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	/*
+	 * Static clock consumers.  When n_clk_consumers is non-zero these
+	 * are used in place of for_each_acpi_consumer_dev() to build the
+	 * tps68470-clk platform data.  Needed on platforms where a sensor's
+	 * ACPI _DEP does not list the INT3472 device, causing that sensor
+	 * to be missed by the ACPI dependency traversal.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.51.0

