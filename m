Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983E3612F1
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388531; cv=none; b=MtAM/KnalecRzFVYOmA9oQ+Vdr13R7/0PeaLy/59sHU3viLYtTe70edCjarMtB7SDJeAg9a8Jz9n6TsMi3cg5OZ1Hhrf7ttQIIHGqaSV/Abk25A/hDP1fAYyt59yY5J03v7F79W81FgbC0xla8g7TV2c+Vp2YTQGKbYvUQoe30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388531; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi9QlvzfXShMa40ddhbkbpw4Y5eg50OETmk9K4SiuQ1lqxzYPHAn3Y2stsTJ4wmoeB58PdF6v6in1uEwzxA8b4LA5QMIo+Z8YA9Gwdi6flUwKsmu6BjGp0S04wx1qz1125xwWKp6tb0TPDWXnUUW8Xjw7nMnWhteJiLZ+n6XY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvcVZ6cM; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvcVZ6cM"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4193948eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388528; x=1774993328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=RvcVZ6cMJxhRdvn7Bv/A9KKNs18E8ieDu7jXAZpbPgyWWP7fql5cMjdevy/uMr01UM
         VebWwpE1OZREP+SSEpcxMrTjgY5kUSGMSZr5IMspoCGuOWbMixo84xcr6eFo3xxSsbuI
         A3eAVHJdRx9Pp8DV2oTLWJoEWKX2MxywdYfPkwABPulG1UbK21M9cWeE0jCn6e9+S0wm
         TnVkv3JAjNNV1K+hBvjdB49hEvqeK3mvtEPu0mV/T9ttkN7hpE0wscqM2oPr7zbxfs7b
         bWB5Cj7FtIDzTErXXbg+OsWDh7dz4CdY+Ueq4GH0OhiIIseRyXLdkCpjYO4crZsFUXYg
         7iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388528; x=1774993328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=IGiDHN6rUQY3rCT9eEoioBwUE1za3+hVR4IyAoJ08HKxinZMrXDucQUR10U7rCYVCx
         cn16lkB9xcuTce1X3eWgMy7S0JhZaDbCe4xwozPNX6SUUuknoxNuygjsys21bJspl8Oq
         tj3mdtmrZh5s/Ho8nQI/gZWRc7eaKSKsMg9+UrNPo0JOX34rRm2u2gVyELsqtaapdgNh
         Z2s8PL4RvKbovnFAhh67fEwQ4V19F++mII6Y+VGNDBI5Fe789W7nn8WwjFFa97L4y71U
         eH4KRED6+9qIqp+TKZvPrKSdCTxvvpeG/T0OS2jesJLklnmWmi17N/GwWm4G01OrD0zf
         5CQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZigrAEV+lVaTQsw06uJcQ6ffLdqgmoiuCJf108/Q7fYFBkIitaf4W/np6E4CvopEjT74Pwbaojeoxc70zuC9TfMAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nzajY5Tgxq5M/hvWk7PQKaMXxwyIbGrp4N6nzfd09cj2NbeH
	GkOnxrIdpcf1qz1kJgymg4uqe4ABYBkIef/Ykx/LxVdDXzLOj+rh++zZ
X-Gm-Gg: ATEYQzwYB1wNqxE892o2305S4vnTv0ls/N5CKf52Cl4rwsrJsyWteVQ5tuu9Jd2MNqI
	UPt9ADNvo/nVZATdH/lpXSUBEH2Rp8Fj8k3UMaJ7kVHnAWf1dVHN1XppCeIOOobgOBvJaiGvOBv
	AA1C9Ifr1vFaM2+sCIJofj8sTAxyMPaRXzqRjXhH5FCaJK917tAeoxLIMsdxN4U/T947raluiO+
	7Zk9qo8FsONlRyTakRzg+mLRiwQ6IGCj6Uy/Kbc+Xmh/tUMTHn6wjn440kZqawmFcU3JuaURiNY
	/HooqbGfUd6sG3zd0heTNhoM0ECySW5R/C0MH27CcLAM7/bR8jd3qyvnJkvAL3CTmcoeiuWSJ8X
	o4hB8+vEwWeYMBmkZhBkNlpdUQIL96jts9PgQJSqObMh4qVAOx9W+0pTTeMnr7WbzVLWAx28o1u
	zNLWtDGwWZPW0bJTEx5dk8rw==
X-Received: by 2002:a05:7300:2153:b0:2be:e0a:f37c with SMTP id 5a478bee46e88-2c15d49e2bbmr504337eec.25.1774388528256;
        Tue, 24 Mar 2026 14:42:08 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:08 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Tue, 24 Mar 2026 14:41:25 -0700
Message-ID: <20260324214129.17300-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
and the I2C4 controller (INT3446) both claim the same MMIO region via the
shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
with -EBUSY, preventing the front camera (OV5670) sensor from being
registered.

Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
machine, matching the existing pattern used by other LPSS quirks.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..7d0964848 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -13,6 +13,8 @@
 #include <linux/ioport.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
+ * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
+ */
+static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
+	.clk_rate = 120000000,
+	.swnode = &spt_i2c_node,
+	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
+};
+
 static const struct property_entry uart_properties[] = {
 	PROPERTY_ENTRY_U32("reg-io-width", 4),
 	PROPERTY_ENTRY_U32("reg-shift", 2),
@@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+static const struct dmi_system_id dell5285_lpss_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
 static int intel_lpss_acpi_probe(struct platform_device *pdev)
 {
 	const struct intel_lpss_platform_info *data;
@@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (data == &spt_i2c_info &&
+	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
+	    dmi_check_system(dell5285_lpss_dmi)) {
+		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
+		data = &spt_i2c_info_ignore_conflicts;
+	}
+
 	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.51.0

