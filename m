Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7729D264
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094057; cv=none; b=CWY+N6zePl9ZQeHSDsQzf7F46O+ux/Tr+ELTmUdH1Edn7kq2YLD0iZwE7145y5gLmphe2o9VNPaEq23g9p6CfbsmzU+1iaJJzcAJGcBLyEb/NbI1V9/BjmHYt0uBZt/L/sBf8FyqQGR9nyv4BIs5ZL1I7l7d2zxJUHyymmQ5zCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094057; c=relaxed/simple;
	bh=OHzbodFEY9XsX/j0bYvyJY/ulMoblMKGEPhSTs/cpEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhOOarKFa5lveYIYyQw5aB0RuAO6R9gtlrg1cWN1YLVTGgBN5sUyz4Kd/W9QM3ZQ7IrG9ZMo9WQJRBCGxx42Os6Q/qIq39Xbc1Jp8Gh9gkIQe1tdaSz1jaLC0k9QImlZAlttft9LQvW8UYdX/qY3w7PzkQKPtY5/rDaadlclMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX9BSdnw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX9BSdnw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d891442388so14402773eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094055; x=1777698855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b19XW2BL5kvqhEId+iwDdtSDQMuam1C47LzXsM6NykA=;
        b=VX9BSdnwNj/h0MF4LT/18RTFks+0LbENNMqLGJSFsmL+epmQBjxy4k/Ij43lIAfXEU
         Tf0o97d0BAjqLuDCkjjTjGKU/Kz+vWr2hdRNmElauznzy+hEHlrvQsdimzDcwvRlhFDZ
         En3DGQWKj1qErFDnoxGG3noCqNYhW01CJf2bflCoa3OG/7qd64JYdbMA8UjDUulvXHDw
         6GpO+DrZUzb7nMS243eV7fH4/iQBgIrKcQNpVng67G8a/8UirogOp+c4embYQZEDlLuv
         Kk+s6op62qTZOHF21nRuOsriuDHAcCkAiSlq5T8taN6wkRd6FnR5EpdiDFyo32DtG0GL
         A4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094055; x=1777698855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b19XW2BL5kvqhEId+iwDdtSDQMuam1C47LzXsM6NykA=;
        b=fvfb4U4oEi80Kapi//9Q9M7Tepw8YZ583t6y4zbfC7D+24xVmzld3dkUKpnHOBlbcb
         nkE33jao77jYMEd1J+tNtQR+LnVE5HN/oOHD2s20xOJiXL0Zy/MOJXDgTNCQPOF6o520
         dYsIzbuVsGoOKhdymxloqQU9WS4dqYj77N8QLEWPYecCjVbxyv1eIowS/9xY6s9wekYa
         GmM7oI+5f0wKgDG/T65b8ydNqmHNXn0DEy5FtF/p4sByUau1cR5+VYRh+S1lL0YSyXAm
         Q0z7MkQ3s0y+8cCBVm8+9stWxiYy7l+gqAtPVVkroETyyQFOJZdMS+NuYvLrsftDUft7
         lDBA==
X-Forwarded-Encrypted: i=1; AFNElJ9pc59b5aR8OsYuJ/9gAnRUvNAiWc/ximLlqwtQnqZEYnNUUkmqEwiFPtFojZVsntrxLnZNEpjO8FpcCkPADte/Ss0e@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1QL06X/C1czh507sxLzMfYXb+jpuJDZNqMJAXSYfkHSCirqS
	JdaxRZh5UkX9ot8OcLXixvBD5F/eSux5PZfd+HjAfxXqvCkumzc7TVq2
X-Gm-Gg: AeBDieuCv1L8F9rNGAd3qT5zTo/3oYbc85oNC7liiaK0zuSafWSAVM0DhoggmWCx2dV
	HVQfx+oMq5N6vmZEb72uPENeHuS9ZpYye9CbUQRPyD2drc8kR+BYMk5AhUl74+4gXb+KrXRwTLi
	ADPAxCxCXnPCGWIaFGEd3En0EUwCrOJP957dr6dW8vmnQXQs2moiIeKGMZsidNBrhOK8iGAzBaY
	AdR/ioydhbSktQPkNLms6YaQ95ZIp3cp8qfyxs/2Vy1j3ndJICu9r4yV3GpdWg5In4w6/mZ82yx
	5x3N76HFUwzRebzJnvn7P+KmkB5MIeqZpDI0NMFL/z+o3Q1x95FyoUjBZQCVbg5GEyz7PRcJ8Mf
	Wo61OCY0uwLw4ieytwMM6ELYyeNQ7EOIhxNBA42mo5VcJeLALzLlphm+TEQ5BZwaLMstX5RpBAV
	o3yQHT1kUyeQjP/r8Sjlhd04ELgUCtmaN3hQ==
X-Received: by 2002:a05:7300:2327:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-2e478c1ff0cmr22162963eec.21.1777094054937;
        Fri, 24 Apr 2026 22:14:14 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:14 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v5 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Fri, 24 Apr 2026 22:13:39 -0700
Message-ID: <20260425051342.8960-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
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

The board_data lookup is moved before the clock-pdata allocation so
that it is available for both the static and dynamic paths.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 113 +++++++++++-------
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 2 files changed, 79 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..e148b4532 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -150,14 +150,37 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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
+	/*
+	 * Look up board data before building clock platform data.  On
+	 * platforms where a sensor's ACPI _DEP does not list the INT3472
+	 * device, for_each_acpi_consumer_dev() misses that sensor and its
+	 * clock consumer entry is never registered.  Board data can supply
+	 * a static consumer list to use instead, bypassing the broken _DEP
+	 * traversal.
+	 */
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+
+	if (board_data && board_data->n_clk_consumers) {
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
 
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -176,52 +199,54 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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
 
+	if (!board_data)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "No board-data found for this model\n");
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
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(
+			board_data->tps68470_gpio_lookup_tables[i]);
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
+
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(
+				board_data->tps68470_gpio_lookup_tables[i]);
+	}
+
 	/*
 	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
 	 * for the GPIO cell already does this.
@@ -233,7 +258,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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

