Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF5353A9E
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861788; cv=none; b=K42UZ5HH+ry6ubrQFH/wZYazlXfuUya9zi8e9zdWxPsqoota7QW4CyQ5Yc166Zml8Td+OgBN2RN3G2PnGHG6aYmYUix5/K5WhIFxUcEsCNaEq+2vZ+rJ9zy8gn6cbZUXYWqC5gz25EMxOK2V0V1RAL3AUMeudfnkDVjUb4aRIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861788; c=relaxed/simple;
	bh=vNuwUj/mX1I2dCPd9YQdszRmwxME2mWk4VVqsZlPGjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdxIFRMbETNG0MXYX6eCv9Y+oZ9WUGsXBD8gVD/Ju0t6kXRL7NLoh4kfmRAxWzGKqd0YTN4DIXo7aFesAZiuvLUP9LybSNkwRvU1ADsprLa6tILoKHyRnejnEgPUDmTwunh+inpwTX/kqkcKpOl+jSy/SsHGle7heelgDtPyz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4AEqHtT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4AEqHtT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so8782855e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861785; x=1788466585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6E50MuFruFxc4u2sjZ0zpI88/7CpGxeczTeAdNIzYY=;
        b=D4AEqHtTePzn6Pib4uhF0kHsn3k9eMvPETuo6bueBgiQogJ73L8MOx+xtkxM/3JwBk
         1ibp7/YCmBUOPVKz47dz9TIyVUoGQGj0n1cABUQ5VxzaOsL25J7BG19BZ3iY/l5d3nuv
         RhmRI0OQ+OWchV2WRimmOB02GfKQufhxehnjAZZE/JVccBgA85yT91DSu5AO9l3cX13c
         4nIHDigKIcGUMcYh8+sxzsv6Se1JOtWp7okaod77BmRaKjbh0h3B3QAWXh933A0rCZIL
         VArQjZs5VA9oioRyHrSTPi4SWynM3W+CxUSCGTHp/huYHdMiWztoONJygxYT+VMJPi0r
         wOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861785; x=1788466585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6E50MuFruFxc4u2sjZ0zpI88/7CpGxeczTeAdNIzYY=;
        b=DyEjzoWx+YbV3kmgUYDj1Kg8eJGmUcDixX0URg3p2wxv9b95KR67Cd9mezwW/QKY7Q
         tZquyeP6ybhQagsTqfeoXCoHLpCqtnuX+eb97JTcTD3l1Xi9j2g43eHe0sFjMNO+KzXL
         pHVjG4vvIuBR2gd/0WR4kEl2ppzsvmqXUVsajgWdpQiynPEi8Xz+MJ7jfuGXGf+LG2EF
         OwtIX4LVm1B3qHLoPvAONy9UoYkgnxOGdhZ1tJpDJqMQToWSqAalkJqH/l5Y583/tRlz
         UV2tO/IanS8uUqe8ukDVBn8kbxFDUbLBB5uZkEhYr99sHqCmeVYVhTufrUuXAnYb/x46
         4Vyg==
X-Forwarded-Encrypted: i=1; AHgh+RqAscwtbt8sdPyHaqlJya6r2OE7QKaZ0s4dI8yD2CUvd4sRUnu3AK1aU6QyBuNShL9tt+Ejk0R68f82stcsa/UHEJh7@vger.kernel.org
X-Gm-Message-State: AFuF++nILMvKpZxXGXgn1Ffz6xXUd8Lp0b3Dkm5h0gi0au+5xiJMcGXL
	PpsdrOw2c5CcfIeZlxaKGd9mUt6hfdl7rKhETbR1gwBb7kVoOXmf2JUa
X-Gm-Gg: AR+sD13E/nJ3Ty9Ca2f3sDl29xEyFYyppS91IKMe7X48f+XXiWBjxkpXYJ1TYuRz0nm
	yTEi3/GzGy0F2/ONwpQn42lvYmpIyBNzPfjXO/H4PcSIbsynhZPVds/xO3S+YxRlP6S6qt825kn
	P8RtCnBOqjbQJ5PY69AAJRsZrF0QYmSu9piR48l5P41GuOi7qRVwgC5EWaSEZrb//lHxPY56xHi
	xyhP4O9cZZKfCFuPYp1OMmhdEKRZKZna+ppliY4Gvq9/ltBYUMXCbXGyHY/nr8V9s36RCNZM6h4
	tD+Vav5rv4AJDkeRZp83tnRidTptzdBXXV01e2YmVFn3mi1bL1+QmUIm/g+56DRooYW2t9/hyA/
	8XnSXOUj2GJH/IOMMd6rh/NtD1eMNg7y+yyqKl1a0xp7EXJGe8V9AGCNTKPUQQ0DOmJKXWKXPqz
	zw2INxrsuqNuQ5fwRI0WuBvT/oxyMZ/yjJ+uQItrui9mGmJuU6hrGompJ6
X-Received: by 2002:a05:600c:474f:b0:49b:e22:4ee4 with SMTP id 5b1f17b1804b1-49b91a58979mr21413085e9.4.1787861784308;
        Thu, 27 Aug 2026 13:16:24 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:23 -0700 (PDT)
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
Subject: [PATCH v9 3/6] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Thu, 27 Aug 2026 22:16:08 +0200
Message-ID: <20260827201611.99825-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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
front camera is never registered with the tps68470-clk driver, and the
OV5670 sensor driver cannot acquire its MCLK.

Add optional static clock consumer fields to the board data so probe can
register the consumers directly, bypassing the broken _DEP traversal.
Platforms that do not set these fields keep using the existing ACPI
traversal path unchanged.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 105 ++++++++++--------
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 2 files changed, 71 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 5baed848a..8423c6d20 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -142,9 +142,11 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	struct device *dev = &client->dev;
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct gpiod_lookup_table * const *tables;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
 	int n_consumers;
@@ -155,10 +157,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
@@ -176,52 +174,71 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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
 
+	board_data = int3472_tps68470_get_board_data(dev_name(dev));
+	if (!board_data)
+		return dev_err_probe(dev, -ENODATA,
+				     "No board-data found for this model\n");
+
+	if (board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(dev,
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
+		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
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
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
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
2.53.0

