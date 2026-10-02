Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB94F96D4
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958856; cv=none; b=ADFn0bQkYmfoYxCwAY180SvMWN2jHvBKSSyKVMEoop0LGu6sc5jjRmqpuHnO3v7PQofvZbO31STyIWAPhRWSGNkmPNsRCuew47M9z95mNvggAE2/4M2iAPfNZ3X2IQhjvnNUe+QIgrMm7HroA74LmghBxcOb3Mu9PwI7srMkPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958856; c=relaxed/simple;
	bh=0eK0rZW+Bb/wgQko0hLrGoTCtS96mFKwLCxqAk5ubl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggIJHYAr4D/UylvDRdP5iQgDY5zHoE3Bke2o29Wio3+Kk7RekbZo8rEDIWi30urKyNTE6IdLEjZuA/WIIMUKTgo1ZyFN/LXED4bC75COyn3/39sD/HatfpCoobIS1kqFN+DbCk9/aIy7y2xVCGEUUwwCoBse2k//2mBd9AKTiXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0AElWIK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0AElWIK"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25400so3295820b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958854; x=1791563654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPmxwiXeVlIKKgR8njqiI8v8S5H7LLeX96HR5dBYRSk=;
        b=S0AElWIKOPeV0u1yhooqFtFbuEM6VXaWuRTRuB7nvEoJX8TjAbf6vpfQzXqNm8sJ7n
         W9LpMdpc2yTuPSJa3fV0eiPndecj+fKtPbeLlV4uyUZXpL2ZeGyRW/IcavvhNZ7+ibnr
         VoaPQVBhM2E0EqnW9z7dKctqhhC52DU+zmc1ckw0E824CVU9X974mOT3Ibzj2H/GYq8j
         yCN/7aUffcXjo3W87NWKvL/m3L4fMczjpdCgCCw2nneYsNsy8WXl2OWmvbT0hDxVRF8C
         /SejVpkbFdbRBAd+ZHGyx1Gy7tTNVIC7wrHoki6jDTvIazLyARTM7sN5vBZCuDevuOuo
         Bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958854; x=1791563654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPmxwiXeVlIKKgR8njqiI8v8S5H7LLeX96HR5dBYRSk=;
        b=lWOPerI19AiGHtoDsbOT+WdHQuOR4LdGuL6Fq5ANb6LptXDURIukwq7mJf8acjGhIX
         a8ZJjISmvyG/Ah8D/7o2YM1bSTN+2nTTuJz9+vFJYSltJQNI51G8KRPrc86VdTwxmGmB
         s4zjFmBJRh7H7IAvhifnpD1AZIlC13ywCSb8MSUUfYFhQyGTx/18+6/s0sUKh9XsQuyv
         dEmYcMCvPyogFhOXYPA8HecvoB3z6BUy+dTcCvG7L6M852r2lk1QVY7/ykqiz3EoIFtf
         lMBkmGI3Z74ZXVt1sSPW6x6B49QOLjOqNnnUzZrYvfDvOE1Ckdviizek410o6Tx/clyE
         v7+Q==
X-Gm-Message-State: AFuF++kMIuD2hXkA8pARk56VpkIVmTCin2h21mSoOaWQvKdSxVVkcZ1E
	lYTy1NYmMW7YwqVbgCmh61LneoX7xwq1G/PrkPrY6xKJ0F2K+6HvsxHN
X-Gm-Gg: AYBFou1uIy07tkj7IPvNY/eLm3/KaeiM2pc2BHaJIMO6us9s6/oXjasTKr3uF4HtO1n
	IWA/+pclrDtVQM8LPjUaKLq7UkS2wU+Y/AE6ao396WevgeU767oHt2q5WY72ZY7VXM3O4KIhnFf
	tJLES2bZk1jQJkKJt1RW2hQklxMBmBDo0j+1MqApOMoMAdWBa5/BDTs+CMpB76vGchgMn/krofX
	rci1R1O8zPZvEGDqLHu8ugRZsPv70tGWQUa8TVlF5YEqCeOLSd5syta7eULo0SYZ2jTVctFVZtP
	iENacr5Zh+qcu0yRyuoa+le6ulOlVi3aYH4NDHTUTLKspu48FVfARhS/uybMiWgTxIjqiUoTGrj
	kCLlBxa535jx55bO86LBYzusJgzUPpwcDJ0ucaaqLwMttfPPVrCy4fiovFXOif7u518Uzw+kWoo
	40XRZE3K1OQU46ta3ASu3kPlvuZpoWkiJrpYTU++LEZme2ZMtuF2DlPILpX5bFhiKoV3I=
X-Received: by 2002:a05:6a00:2883:b0:874:705d:f63d with SMTP id d2e1a72fcca58-88af4e2f1ecmr3326787b3a.31.1790958854332;
        Fri, 02 Oct 2026 09:34:14 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:13 -0700 (PDT)
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
Subject: [PATCH v12 5/9] platform/x86: int3472: tps68470: add static clock consumer support
Date: Fri,  2 Oct 2026 09:33:46 -0700
Message-ID: <20261002163350.1248431-6-tchatard@gmail.com>
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

On some platforms a sensor's ACPI _DEP does not list the INT3472 device,
so for_each_acpi_consumer_dev() misses that sensor and never registers its
tps68470-clk consumer entry, leaving the sensor without its MCLK.

Add optional n_clk_consumers/clk_consumers fields to the board data. When
set, probe builds the tps68470-clk platform data from that static list
instead of walking the ACPI consumers. Boards that leave the fields unset
keep using the existing ACPI traversal.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 19 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/tps68470.h |  8 ++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 9161a656f..a11afb323 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -187,9 +187,22 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODATA,
 				     "No board-data found for this model\n");
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
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
 
 	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
 	if (!cells)
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 3bbaade96..68303e6fa 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,12 +12,20 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
 	const struct software_node *tps68470_gpio_swnode;
+	/*
+	 * Optional static clock consumers, used in place of the ACPI _DEP
+	 * traversal on platforms where a sensor's _DEP omits the INT3472.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.53.0

