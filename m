Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D935304DF
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804643; cv=none; b=lbRNranapSjjkoYEredONUYmhneOJpRJo4GiRXsy+6W4b0nEKJccBtXb5UEqz4Gp1Fd4W9FZrjrFayty9oNjx0LLPUGxXZjAdIfuU2DuPY17EBXfaCZ0uZwkas+Owhlk+ZQ4VfHUSKgoxAZXaT0weGopullqdQQ/xe+6udR1dtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804643; c=relaxed/simple;
	bh=n5rhP85eyAVowFGBZ44n1IyXNOtUn7kXNnJTMsxqjOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixYIRxB/442L63IjYwOgZEgsmW0xD2mE6wPH7hZAdgrnva5Mt2hTrYNHwM/nxDKMjgZa38Qvf/QcPdIzGAd5Ono11Rof4XMK59/GaRvtwshl9DaJW2JBum2KL7MPeP6Vr6kXzbx5XCpYQt4W1Fv9vqoZuIAEdiArEqU55PZTwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBPx6uUV; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBPx6uUV"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7e7717675so76133a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804640; x=1791409440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6cWGMpNdC2ygc1fzeq8wRAKitGkWhVyImvzt26Ozi0=;
        b=EBPx6uUVcbm7Lgq0YGL65Z8opYKPS7DZ0beejqbPUhPMyvvr81DfpsTCOI9lN7MbjT
         FHIElY4f2YsE7pGw740zxQEkvB8W/jG1IHOSOUkeAVrEkOGxor8/S48TlWXSsSVnrK86
         FaAPK22o6D1pVnRD0wawcpRwxYnQHxJvM7IE0jily3ggw/buidJ7TYx8fo9yurnp/pAq
         d50hLn7CugT3EYDP1jaUHRf+4bZnh2N0jf0toFkhgpfQxpWaxhx2VVQeEpt82JpO8yVE
         /gktyB32ad5gimBOmGOiPUn1mjJSWsMEWg+vPqCpjzHH3tdFSLvlZALabRdDtXXwjK9q
         3D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804640; x=1791409440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6cWGMpNdC2ygc1fzeq8wRAKitGkWhVyImvzt26Ozi0=;
        b=x1i5utytxB98Np0fXa/xJytc/eEoedN9KuQI8x8D3MyQvetcYjkBfrPSOY2JjDB4Fn
         8YNMkxKX5ZG1+Gbc6deZvYRGOVVNIZqsJ6BbMRfWjTjCkLON4IgPGYrBpSngU8i4e43E
         IfldwzQmPe1amV7wVaDXwbrbiAjwM3PaCkwQ7cu0F2GOP7xHoIfPQLFPy/RuWuw4/frZ
         PoVH53xShSpK1FWUdMca2jSQncMnA5DV0tbTYrXeBvvUWpro3q9tx5O3XwU9d5Lr1ZAu
         eD5fmUlZ0kU0YTTNr6pfMbx2V1143R2xOHubwRpBbedqiyKS/Wt19xy9AtlbUrKA0Nom
         bVzA==
X-Forwarded-Encrypted: i=1; AKwUvBwJojSBx3LPsb/Dr5M0fKudiLMrW9lBLtkZoHCzIBIhY7KX+ARXb/Qkqs+6GsGxkv+8OEG+8PIiu1fiIgpS9tEe/Jpn@vger.kernel.org
X-Gm-Message-State: AFq9FYLsaTK1X2akSu/GfrFCsb5Cu/4uH7PjxTjHO4nNtb9ZI2pyJsAe
	Bn8cKS+t5vB6AZhStxovCpYm5k10QJZ1JUS4DHEooJ4Q9Cn2tO+2S8/J
X-Gm-Gg: AYBFou1XiLh8f/wCg8js6V7dL+4AXuSftGQ5JMhF9C7BM3CKEGRFdXBkauLA20WVv3u
	JQLBitjMccCTtowPWzmyOkChvuaGIFS9O/GvdhvhKuGybIFX65Kg7bcouJbt7l513iHYcUF5jqG
	foRErU32Tve8U6WCFA4zhgq+VPwWUDwzNgUC8ebrLsH/93LZPhjs0ZEw8AgDnS0GXmNmKgnevRP
	l/5B+c/loxcL/yVq4xs1onHrFSwu3Lm/ISbgmPBILY5Rkz3su7tHR10e7mZb8fd79ySjiJJh+Tf
	NE2ArOx5bRbejKwWOvcrZqtPCVcxHA5zQunSE2efwvqXovJdCA/wtMDa+mjfk87/vvo4ph6fRKM
	cXD3Mzlhu+V2FTG/ywjiEKZ16RsnbBmkorBMOCp1HKWnLBkwXj84Be2GaB4fzrVuQ8eNg6XWYeL
	j5PxWJxUeOdir5DbwBPIUaKykg5vTBgAeoHmJURHSgdeWczgPtjGPYoSSNIv3wYOAja3g=
X-Received: by 2002:a17:90b:35c8:b0:39d:ec1b:9651 with SMTP id 98e67ed59e1d1-3a4f661542dmr482548a91.13.1790804640076;
        Wed, 30 Sep 2026 14:44:00 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:59 -0700 (PDT)
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
Subject: [PATCH v11 9/9] media: ov8858: add ACPI device ID INT3477
Date: Wed, 30 Sep 2026 14:43:21 -0700
Message-ID: <20260930214321.600863-10-tchatard@gmail.com>
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

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..d106cad6f 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] __maybe_unused = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

