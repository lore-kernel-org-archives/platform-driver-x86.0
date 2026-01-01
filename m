Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA213B293
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Jan 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767277040; cv=none; b=gNDbf6p4iwzndUqY2mZksXwM884IzvMaIBJjwLyRJDRYpv2Ds0rYkCz/oDPzeaGOEYi15JT+Grx83ueGZ0FFlG2aiTHxOR2+WcOMzB9SCB3wfBHNjE7TMJN4TOtn/7EqRyqq2Ppv466cc/lTrmEhbD+MDWahfHjSP4SPk4u5WtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767277040; c=relaxed/simple;
	bh=mkc+ryhQgFCsUO37Wjz+nZllxjZFroeJapa0eqhboVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EF9imkHtQzB1KyxutjrUf0lTmibeQrCxSy9lhpq7/HTQD1y1tO1vK4fMz7/Q2dNFEg3d/CmZmA6YT9TQ2KfaQwmNIuMVaO5za7TNsB4EY+kFq78SkZlCd6ZHQXk5xXaKzYzdvYikN2cMfMokb2I6Z80MvYuZSEQCPxppxetfyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAg0yOdT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAg0yOdT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f1bc40b35so201937165ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Jan 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767277038; x=1767881838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVTX+GtTA7AL3KxZR+tY/E2IHW72ZkU1gmOsLX8Ik2E=;
        b=RAg0yOdT7hvxyJ9Te9kIFS6q/Of44vz2bXPERBBaTSEDXzLLNDskWsNtYqUtKVqe/e
         c4LJKuF5C4F8FdbkMXUevBAV+iMzOjcpH6k+J1YlGojjUMdfcI57vxiFvVT/7BI2m3Jt
         6epVe8Cq4fVAQVPnUPL4kcDFK3K3HIzOyurK5BfA2dl1n1ybt0CJcntgeOdTI65GsTT1
         r9NSG6g3W7RyOK978qxQH3tL3K/p361aqj4EzuHLjoeEYk0J75OSCX8PIJOV9HnydavC
         aZaHj2R/J7cmpUK5eUIMn3JYq8hHf83RgQTpA3c6eekEXpUq9RwTQ3nXqF4D4PUuB1ti
         pgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767277038; x=1767881838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVTX+GtTA7AL3KxZR+tY/E2IHW72ZkU1gmOsLX8Ik2E=;
        b=Pb48jjv84FRGh07i0WekWdy4pgUzQDmG11E9ZaZkHZjS1KB6qDsWOgRldgsLetG/x0
         NLt0/injRxThPMK48xf0CN6GERL9TR49RtorCmhvnIlTRRNgkgamt/FrejjcOdEkFpes
         85vTY8Qs/Qv7/YmU9uUmGkD+2HpVI2/Eq4fMc/PfDkMrr4zkK+wnBuIhfGFTWsziku1O
         vVjCA5D3A+xIq87qSE44Sc1jt0154OLUxB/Kr/6Exqsp4Yft+9aHBsQJ9C1dvm4VhdtV
         n5uNeneL7jyeDQCpuKVPpX6z/MQ+E1/c7I9QvE1lvsWUltwTAChgG+GYu8O1qWDI1BW8
         Jwtg==
X-Gm-Message-State: AOJu0Yz4PMYZ6AIjEBq5X2uRGpicJ/+h2vhlsL3mWxwHCVdQ1483OglX
	wq0bS23nK9bzhEPqQgpVJ67zfZ+nI71kGLlD0WoknmXFTx37iOg7dLaFo9JVaw==
X-Gm-Gg: AY/fxX4Y92pDiKMuJEhKqux8B7kJKRLMp4oB0SeGeL3DHApD6hhAzMpYa/pN0FNxuNv
	x6TGPZTC3yQ6BzZopJB72upYXu7NcEOGTFOvCM5bLGh/PFR8HHfHS0rOPPeH3HQGgO21D7eQZ56
	kS+TkKAmw2KKBeLckhTRKzWCf1Pv28MKNMGaj6FKoGkGfOUQKeSxcWzRTiMsTrO3vtv1nXs/eUk
	SHQY5/VLIlCxdK7mTRih0nYRqbGYRRC6uhW9Cu/tIB60FL1mnTEozyTdgAtVmjGEdvwlyzyAoN2
	TOWzcXq0AUUc2XuownnoW6UcIa/Q92n+VV9VXiTeWugFM3asZlJCSU2ywZZjOopz984el9laiky
	JgT77MVIDs++M7N3oxgYCS6PSYe0X8i1ap0Zm01KtEg64zyrfN8docux3A2szyQgZ+7cajN8XUO
	Y1p4ztsBt/pf6Rj47oVA==
X-Google-Smtp-Source: AGHT+IHiqbCwv8zP5RLWdsredRkFEGo/XQFDWKDywZPK8qLnCdf8f0OWsqF6zQrePbqEctUPWxGLDA==
X-Received: by 2002:a17:902:e74c:b0:24b:270e:56c7 with SMTP id d9443c01a7336-2a2f22069e3mr418824975ad.7.1767277037655;
        Thu, 01 Jan 2026 06:17:17 -0800 (PST)
Received: from rivendell ([101.0.62.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a39018dc8bsm105497475ad.43.2026.01.01.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 06:17:17 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2] platform/x86: yogabook: Clean up code style
Date: Thu,  1 Jan 2026 19:46:57 +0530
Message-ID: <20260101141657.54258-1-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit cleans up the following checks flagged by checkpatch in
yogabook.c:

- CHECK: Prefer kernel type 'u8' over 'uint8_t'
- CHECK: Comparison to NULL could be written "!data"
- CHECK: line length of ... exceeds 100 columns

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
Changes in v2:
  - Drop cleanup for "CHECK: Unnecessary parentheses around '...'" 

 drivers/platform/x86/lenovo/yogabook.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
index 31b298dc5046..69887de36c9b 100644
--- a/drivers/platform/x86/lenovo/yogabook.c
+++ b/drivers/platform/x86/lenovo/yogabook.c
@@ -57,7 +57,7 @@ struct yogabook_data {
 	struct work_struct work;
 	struct led_classdev kbd_bl_led;
 	unsigned long flags;
-	uint8_t brightness;
+	u8 brightness;
 };
 
 static void yogabook_work(struct work_struct *work)
@@ -338,16 +338,18 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 	int r;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (data == NULL)
+	if (!data)
 		return -ENOMEM;
 
 	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
 	if (!data->kbd_adev)
-		return dev_err_probe(dev, -ENODEV, "Cannot find the touchpad device in ACPI tables\n");
+		return dev_err_probe(dev, -ENODEV,
+				     "Cannot find the touchpad device in ACPI tables\n");
 
 	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
 	if (!data->dig_adev) {
-		r = dev_err_probe(dev, -ENODEV, "Cannot find the digitizer device in ACPI tables\n");
+		r = dev_err_probe(dev, -ENODEV,
+				  "Cannot find the digitizer device in ACPI tables\n");
 		goto error_put_devs;
 	}
 
@@ -453,7 +455,7 @@ static int yogabook_pdev_probe(struct platform_device *pdev)
 	int r;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (data == NULL)
+	if (!data)
 		return -ENOMEM;
 
 	data->kbd_dev = bus_find_device_by_name(&i2c_bus_type, NULL, "i2c-goodix_ts");
-- 
2.52.0

