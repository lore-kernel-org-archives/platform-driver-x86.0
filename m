Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5813B19C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453404; cv=none; b=XGj0bpaVocH1hnGE4GoH9xYMGNdBe7SHUox0nc3VKn2E+F/xVbqz06K7F5z8IHWDdUf7S15LTsSz5jS14FH95eB0vP8kOlBa48tVrfotuVEroU/eoK+JdcFTvN53FLLiXFRdYTZXZjcmIaCD5uikgeozfy0yjsDJV5BNUvia5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453404; c=relaxed/simple;
	bh=fCA9d0oH7tGsciyCMRPrbRJOQUijmuhnOXNzwydbxb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzj/z3GWSmjK/h4KTRDvmlB9Kfw43VAEYuQH009OdAffSzWwQGWOkFzmamv/S69EwV95nwplhwMRqC0X0nejkPh1IQjG4B1gbM8UPxUldloYlboUiCsy2FvXLAN3jsIGgP3iAcn47j285mWw+kVgqSl4f7VpfTIWtD6L99SDiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khSpVdX5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khSpVdX5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so686297a91.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776453402; x=1777058202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1G6x1YyXw8l45WTHbqcq5pSU5LcJaf1UYS+jkiOeaQ=;
        b=khSpVdX5zoLafeUI7dnt6GL2Ls4O/GNVXHazD5zTRRtaC9yGh7lgBg1O35Yi27aYth
         xQi4dwJavsASsDsgcaZSYVTd80McTzgZJY0YZHly4PykPVDGAKHcq/TTf8F6FLtwZsKe
         8NZ2GbNrVTl4NBARrOBGA4JQNmfbz3ZNqCDJnJvzIwwiYMRawsPer54NszVTkALFdMWV
         Zrfye3uFGJEC2t0CF05o2Np9VTxXH2/pB7qqVRAAYodjuCINWJuEBBvNUmCwBcpfcHUG
         yQHZ+uFVz1RxjGlyLkH2+a7VPbdvwZqhY+gfJtw9OZ9JODUqfeNzf+S2yvCG5cCrK9Bz
         rgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453402; x=1777058202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1G6x1YyXw8l45WTHbqcq5pSU5LcJaf1UYS+jkiOeaQ=;
        b=iNvnzZHBIE0CytsmD55y779L3IvWF6l7cm8Gr/d7hQegmbuylopDQsSbUk0ypi47+X
         iGC44957lWaru105KFwcJgWHHjepedmlvllBEbQQzHqiZp4Cg657U72xiv5fV9IRum3C
         1w+6d7YYMGFRKi8gF2E0fiWDphqxEzrK71TfZkUfOFzK3JKh8kdjqv5xVh0RBu+zI37X
         P/anDhHHIQaHLVP1QRZvl7uVETP8v4WV7VaVbDhKuDpah/c895m68sDFS3XrFN5V62Nh
         pDU5UU3XOcDdfhjAs06oy/8WqGkM+RQ72MwFHkKuuywtNuGdWc6Q6Lzn1i7kkTjFF6TG
         vIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SsUSnZD0mhyGGSBjXqmCKCd16jzzL9nyv8XDFCF03iKZJpOWYls5GBE8dfE0K5WCSKn11Pa9kRDNhZOD1reccPsDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6xWs+XNqyktfoPdyzDFCtnl0p8nwVqoxuDZx56DDJsVbd5p/p
	9ZWS7IMmyuHUOk+ricOTZewE1FqYqiYZ7vHDPCC01O9Zjx2isp3ewtyOBH7BYw==
X-Gm-Gg: AeBDievnjgUd9QEAdLwC/IbPae7aG0UUpw6AnCIML7HPjw4tpSjR9hWn7f2svSh103O
	XoRmxOcU6rJFW2okCyrDYFjtD9bNf1hrzwEqrj7CUbMrgNO5JA8YvkEuDrRJ9qOBtKVaPBJqJbT
	EbMTcvL/cIRKG2GyARlp34yVmAOWNe1XE2chmFEQR7d6J0gw70OD25hIHBraWxGjGYLdur5h0b8
	3I81wLfZb5VQzElRwfYbLv0m5QTOTsJRQvTiqnTUF41G2ICNhT7LujKsUudR9AEbWZcCpDkizlk
	JQYHdC79mCH2EOb8n0SV14wTMUZSbSPGxusUx+8ZJNKiK/99v6LLNUxlGJlorYWZoHIMiLVDgjh
	q61+oBXK4DNUNEqiN5nJdpuqovVyqQHeLWug9eYtADYlkzrh65Z+W4e3r3iTb9ZfEyFeIJGfxL3
	TOwTbGo4ceEm5rFM5CwbcomAv26/VnVXL/8x9QVp7Rh3ele+aAuYXq6Xk7PHLbNz9G
X-Received: by 2002:a17:90b:5544:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-361403d5b48mr4098807a91.6.1776453402326;
        Fri, 17 Apr 2026 12:16:42 -0700 (PDT)
Received: from gb5.tail50fddd.ts.net ([139.5.199.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140feea38sm2913310a91.6.2026.04.17.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:16:41 -0700 (PDT)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: ayaanmirza788@gmail.com,
	ayaanmirzabaig85@gmail.com,
	josh@joshuagrisham.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 1/2] platform/x86: samsung-galaxybook: Refactor camera lens cover input device
Date: Sat, 18 Apr 2026 00:46:13 +0000
Message-ID: <20260418004613.93981-2-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c46938e0-02f0-22b1-1730-4ce87603667c@linux.intel.com>
References: <c46938e0-02f0-22b1-1730-4ce87603667c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the camera_lens_cover_switch input device to a generic input
device which can be used for multiple input events. Move input device
allocation and registration into a dedicated galaxybook_input_init()
helper which is called early in probe so that the device is available
to all features.

No functional change.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 46 ++++++++++++-----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 755cb82bdb60..a51ad6b03164 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -53,7 +53,7 @@ struct samsung_galaxybook {
 	void *i8042_filter_ptr;
 
 	struct work_struct block_recording_hotkey_work;
-	struct input_dev *camera_lens_cover_switch;
+	struct input_dev *input;
 
 	struct acpi_battery_hook battery_hook;
 
@@ -859,13 +859,28 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
 	if (err)
 		return err;
 
-	input_report_switch(galaxybook->camera_lens_cover_switch,
+	input_report_switch(galaxybook->input,
 			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
-	input_sync(galaxybook->camera_lens_cover_switch);
+	input_sync(galaxybook->input);
 
 	return 0;
 }
 
+static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
+{
+	galaxybook->input = devm_input_allocate_device(&galaxybook->platform->dev);
+	if (!galaxybook->input)
+		return -ENOMEM;
+
+	galaxybook->input->name = "Samsung Galaxy Book Camera Lens Cover";
+	galaxybook->input->phys = DRIVER_NAME "/input0";
+	galaxybook->input->id.bustype = BUS_HOST;
+
+	input_set_capability(galaxybook->input, EV_SW, SW_CAMERA_LENS_COVER);
+
+	return input_register_device(galaxybook->input);
+}
+
 static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook)
 {
 	bool value;
@@ -887,24 +902,8 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
 		return GB_NOT_SUPPORTED;
 	}
 
-	galaxybook->camera_lens_cover_switch =
-		devm_input_allocate_device(&galaxybook->platform->dev);
-	if (!galaxybook->camera_lens_cover_switch)
-		return -ENOMEM;
-
-	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
-	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
-	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
-
-	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
-
-	err = input_register_device(galaxybook->camera_lens_cover_switch);
-	if (err)
-		return err;
-
-	input_report_switch(galaxybook->camera_lens_cover_switch,
-			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
-	input_sync(galaxybook->camera_lens_cover_switch);
+	input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER, value ? 1 : 0);
+	input_sync(galaxybook->input);
 
 	return 0;
 }
@@ -1392,6 +1391,11 @@ static int galaxybook_probe(struct platform_device *pdev)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize kbd_backlight\n");
 
+	err = galaxybook_input_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize input device\n");
+
 	err = galaxybook_fw_attrs_init(galaxybook);
 	if (err)
 		return dev_err_probe(&galaxybook->platform->dev, err,
-- 
2.53.0

