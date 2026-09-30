Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3916522F1B
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804630; cv=none; b=pIUk6ni3r7ywnvZJI0+vof41I+0QQzpHURKBmNTTaShQ5kV/vAYGNmQ9K+7q87PYZ/1ebgsJ69c8zQAy+lI8PGxgzxFCa58nhmBBy3yKQgrY981QEuHtJCtK7FIfRS/PucQ7SYmxaBwN+QVQBkAOwhioOFnhSzP7PvkAgyOYhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804630; c=relaxed/simple;
	bh=OdlS7s1mPHGrcu0CPS8FKPyzygbRnniwzOGYOk7XL7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8TJwBnJUjgTjG8TKO4ThbFnph0MIb6/xIT77xJWXZv3HgVqYXFRBZmZiCIjMFjDBO2zdMCiXk+dE7r6JoQIx5OUlrPXM2FWERzT4lkWHjHUIOJhG/v3RySJQht9MYAjeMlTVX3v1P9SNfTh1XJjuaT8RlSFvqJOr1V2kmLqnEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0dEZc0p; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0dEZc0p"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2852584a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804628; x=1791409428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcYP4t6SR+tHZM0rfR5UPQlcdnVv/54YvSAwMnKZ6SA=;
        b=E0dEZc0piKNkYmjjxaiFjU1jClW335GaOy4ZvqF3cNTJYlRxmOHbR2YztED7wPwv3O
         gdaIy3teyPm4SVqu+CMuSxosfEeOhMnBtsy76KBuhTQoVtfjDEBIP9auuWd8HuxvTv34
         MCpnzTWixnVaqBB189FIGiOUouhtjwGfomqqmrOX4NMxKss6Nk5etzs5GCndxxSCvUnA
         va/u7gsHHLVEmLurGZ7kmwl25Hk8NcjRnST1e5Bpak5CKmVj5npdQgA9bN50r94M6Beq
         icjBy0hDvi8ouE2r6sbsaY7gHMrVD/6J+Gnxs9G6+kjaWVf97ZAFFUx2izIG/kVDad7E
         RAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804628; x=1791409428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcYP4t6SR+tHZM0rfR5UPQlcdnVv/54YvSAwMnKZ6SA=;
        b=u+D2rGyXfcdxURPXOq2ZdzX4KsuEMzZZ4BO8eLNv7J4rBrIA+cWh6IJ+y6YB1OASRO
         Kj0bEnPWhsr4B3fsXvePc+fQqBOFB5F2O0JOtX7NzuYQif+BizanoVbVCpyyEqGnG8uk
         s0A7bq9y77mpBprWPLXhPmILO7NCtYmWbwVr4J0K0xrZO123IacqXSFf30rFmEQkMaDq
         2+7yFwOBKMw8nL8YXfhPxuD9hOevrIchpRWa+udO/KFL09E96HZc0g0FR3Zw2UAzNYGr
         5J1n8NTFr1xt5PAHujDR48DMQagL8BiEX/9sYT1LH96a/zU4UXBJMxm+N24geNphAz+F
         cCgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+G5KPN/q48FwIzHS+emc5IxLhnBigBLAa7g/Jt3OAmz92A0+0SXSCn+1GKeQv0/Bv9Hg9GY8MKLvOqbijucyY9MnU@vger.kernel.org
X-Gm-Message-State: AFq9FYKE1dEcmvPMk9oYBHt3ANcWlVFoJCrs30PkOzKogaGr2+lA1jxX
	P/mWSjAmz/X1r5erpip+WX+HqI/xb/KWnj9ZA4NPzqW6rXaaW6iecjkG
X-Gm-Gg: AYBFou0WvlSaI+Qop2z9DlofxeHlxb+ntl9OF/02YjE8XJoUdUL3EgOk/sxedoorI8A
	wrgaMPKJ/iVRbq0D6C4xxtSRn7Yiy4vmUZT7qMTD+1tH1hzzyLY45nWj1BVE8juNevljrpQE9RG
	3wYORQU1zm6L+hHhdC4Y2hA4DDbAvicFGpNw15hASkcK9obJwNudI+IDvA+rp8YYWjGO3wu+ILU
	Z2Ulq/dGZN9Ss/pJKV/ypi9XUI/0yNYJzyKkIvpgp0AwuQ62/a96mxULbOiR8O8E5tPFHyfpMBe
	rA8p8ttrVC4kmo1SVdIXBYpTfTZHKrTkJgUK26MK3P7hJBjkqK+CtGBtyl/SYA2R0cNYQlDUszY
	LAeZ+AAxnU5YDE0jLSkZte+1p0Hy4h+zUEp+Zr4J1XyqsL6wVJv6+ZGXUZItrJwrm5hNSPPaCuI
	Rhsx++4ik3Boht7HJQWMSiRh9ueGo/r9x5RBPrEtkVQAKC5iaE71t3NUqiu0Dtcbpuvbw=
X-Received: by 2002:a17:90b:5890:b0:3a4:96d4:e6dd with SMTP id 98e67ed59e1d1-3a4d18a64f1mr1982153a91.42.1790804628104;
        Wed, 30 Sep 2026 14:43:48 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:47 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 5/9] platform/x86: int3472: tps68470: add static clock consumer support
Date: Wed, 30 Sep 2026 14:43:17 -0700
Message-ID: <20260930214321.600863-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
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

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 19 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/tps68470.h |  8 ++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 35fa77eb3..df0f5f962 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -190,9 +190,22 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		return dev_err_probe(dev, -ENODATA,
 				     "No board-data found for this model\n");
 
-	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
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

