Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC83A782B
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811958; cv=none; b=DuuosJQpQu7VDV4hYQGijxCxB6H/LQwKIIhKD8oiE/3qCi+7oKQbQg3wZSeWeRwcSG5fapnGRdoltbj3nti/O1YyDLmdNArzbgfguT0ONEYvyx2nI8CfIj7on02vngWWsGfJF4M/480HaxZwKk/tKBmowNFwsGx2Ks9mH+z2t48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811958; c=relaxed/simple;
	bh=pkISsqV/Vd/AkxRoaxIZdYMzBbCImLUZNm6/QZ3JzIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WY/SBW2KnwRjbkK5HJOdZqcaZ08xZvxmmKnG4gyVokgrDF4T+ezUR7OUBLSDCw57P5Ks7H9HG4ZSpxONsIoYy1Zx8jHzCXtWiguvxCZeflr25BBLxq99atepsk3WTjba9bLvIIDsnvdyYkibf6K+LVJKBMalLqxGUx0wOfZ8UY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGupfWbU; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGupfWbU"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso4011643eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811956; x=1777416756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMmU13XWi2hz/awwYwuaTGeoy/1gyMry/mt49asroCk=;
        b=OGupfWbUQAXYCzcLTVxk4AAuqIZ+3ToqdEVaY7cmfRSvUWs4Z/GHUopGy6GOKz/wDK
         qs03Uyx3Fsb71jjW8XY0/JyluX+ZZE75bsUBvzd19z9y1c+N/0ZXNojijEUbu1p4T1Ef
         ev2KpeKOJoL5/MYOlDGAxYxoa9HyqHKqHMJdAN/9oIRoj7bQyxyvV0aA+1puAScURy0c
         RbDlj5R+NAk4veVRzWZ9GmncKcqRuytq0eDUKNaJeL9vS4NYd1BgT70YMz+WzB1Tv+qO
         QVdqJBizZRBiNoxiJOk7HR0LHBMwgwPa0lMD5038+kmNujYB4Nu6GUGKVyLdXsYexYUi
         DNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811956; x=1777416756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMmU13XWi2hz/awwYwuaTGeoy/1gyMry/mt49asroCk=;
        b=CdeHVXlrOYkamcBxlw4rDgIAmhw2/ghf/CQgWcco2DNykR1FUxrJ8BBZqDDUjSk9EP
         /7l9Sub7B4ZLy9+kSqOCSdghxp2wmXOszMLaAkXqdYcROdTA+EV+yuc/7GhDGZoFyQwP
         eGSot8C4nIW9G0lKXOCZwVdP/ykjc93H/EunO6TzIPkJMsY9NjoQC7sJ5zWmJGoiyX4f
         hICTj4hy+/F4S2PCXXpnfWmnKABelCqjz5BFnHhCqvnyIBPUPsHec7dseQPnKDlNXMYb
         hQUo1/xG1bTJMHWVl1Igo447L8lTxgjJPHfOmOvfOxRYbgz/7XS71zbYao5wkYKY1krz
         Ho+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2/jEoF389WwYwS2Dx4Rg//2dBNBH+9U2vvDvaidHPLYh1A+dVLatIsRHrlmgpyFejPwB/32DrKnJyafrskEztWmgS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10lmPbc5ygPNEaMLof+mDFHoPXXWDsZLYKdeiMhG8T5KQ5A7Q
	ModgthnhI9gZhFOsW2gSWhsIAG1Z36ACJQU/jnfPgbsxbD/QdniroEn1
X-Gm-Gg: AeBDieve48UzaTiZ209IRrBs8hh++L1HG4Z+knc5dYntu9Zw3GWG4UvOiDFsUtSOBSc
	VXA4jlftheNJULRXLl59giAhzLQEveMNEfe1BveMyxjOu070PDCO5XgFhQs1Turgz0Bed9FpyNW
	TvhaJ2IprITggScxDPcYnFckAQZ1h/8eAUxBbbmVvEdzQZnZwgGKjOh9VLx5dJ1UVV1HtMXlMJu
	ANTfQCCq4gfcJktWsLQ+Np58vSTCedJiDJpKLSip8O1Dhay/MLfJLi397+FbT9oqu2koYV1Xk98
	ZAEyW4dMXhj5HUZhYFhDTcrAqp+5aFy3k+jA80F4gBivmkU5I7iSn+SOIj+N+OwqgWPp4HMbvLv
	357+HXR9p8yCm+5767q/c+2sbSVvOGioaB3uZyv/vv2faoTZ9xwRYiX9Iuof0yx2qmNB+AX2WVF
	Yh6PYfqHN69K5aKHvrCG8oGcMx7rUJEMdA
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr9582888eec.3.1776811955691;
        Tue, 21 Apr 2026 15:52:35 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:35 -0700 (PDT)
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
Subject: [PATCH v4 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Tue, 21 Apr 2026 15:52:14 -0700
Message-ID: <20260421225217.12472-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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
 drivers/platform/x86/intel/int3472/tps68470.c | 36 +++++++++++++++----
 drivers/platform/x86/intel/int3472/tps68470.h | 10 ++++++
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..e121eb24a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -147,17 +147,40 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct tps68470_clk_platform_data *clk_pdata;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
-	int n_consumers;
+	unsigned int n_consumers;
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
@@ -176,7 +199,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 		if (!board_data)
 			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
 
@@ -233,7 +255,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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

