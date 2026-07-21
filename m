Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3143F8AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674078; cv=none; b=iVJtYVgHChlUtbxIozyf9JMJ21VwwIlp51pyVuFze46VGbTN+PTMxBQ7yJJnUsfX6EeRq7jzIwPqZSggeC/J+isXsHl2FHunZktW/WCuVojuG6h6yJ6DQgSPEVBqrE+NKWaeDuBvKgTx/VyRjpSdV4m2azf0qwBgi9cko2pCDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674078; c=relaxed/simple;
	bh=my12m8vPC16KTTrb+fRsNPK1+3Qhk+aOEetxbA+nlBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6+20+SpDkzxdsNbgpraiH/o53xoKSatgflrgl1c657Vvwp4/Eh9R5k8EIcDVq1r56ji1KrLe9O23ZrBRe8sczTVByRWN8wnRr9IYWDlxzXiSF1VMxa78aJ1ld8foKzCNAj7M5OJCssoBE5KNWuRfL+VekzUhQsOSyBbzQJvKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y64GtJRi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y64GtJRi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso3156304f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674070; x=1785278870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGHlnFua3ddbOxL2BdXDGmU9Mh9h+RP5G+w2AHEGFhA=;
        b=Y64GtJRiWkHTifVulO2X6lIzYKKvaq2dIPctbe+B7fIS8WQUUPhgaJv/W5Q6CqevbD
         4SYcyZ82Xm76+pRmscGvp+wDMchexDld0a2ScBUxxJ1kAgHWAI8NrYwkdVe51rQceSxo
         znqBChpVkcIAzPaXBIL3UpUeEpazR96ro/46/jh20pJup7WGdfM42iquHqBiBoP70wAo
         HIJCIyM6teTwDsVm8JQY0gk1NLuagWBgTWHq/uKtBZdgayT2DvqsvWiWduU52VHZ4gVs
         oF+ZH1fwryML+8YJBUmmPVAO/oR9h5Msr8ue4mjtjhWg6zb1LENBffdrH/vyQ0r4ZtFi
         nw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674070; x=1785278870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGHlnFua3ddbOxL2BdXDGmU9Mh9h+RP5G+w2AHEGFhA=;
        b=m5XtbOKopHa6soNQjKvXLJ7C4AbmdpNOyX/XBTZTCMBhNGILd9KIMVBqbbJ1S4V1Po
         HXbTPy4X864UDAomc19Xd6TigWqg545giBrdEuF7Prx0TgVTeXg47NoD5okr4ujhVkJz
         AXKKtKFFQD1GjpYRfbjsb9ZxZyN2P9niVfpcSwKC7NxXKj9aHSB9PGNeTQZ3LQFYdydn
         oUOAE9eA97znm/tSrHNCXC2Hjsa/K4qAlBHvoJdT1oi1BoatWulm1Gvn/Ytr72XiS/LX
         3NIyRMLs9QBXnSrQah7AV8e+RHwEItA4Oxu8EYmSAAiZQ8TeZPP0ttd/xf+i/yMSeE82
         elNw==
X-Gm-Message-State: AOJu0Yxognc6AWGabpjUvap49rIRql/sQuP22RlKf9DNar6XZoRfq//K
	yEKD/3048AjskztPciT/hXQdFldXNLsvXLwaBz2w8eZyB/ymyEddKI2IqxJfdQ==
X-Gm-Gg: AR+sD13cVK5a43ud93qPYAnhZHYhMKSUxCBMnpFdM+jIk1aYKLt6C3Vtf/WE1TXeF/x
	+9Xr+pSjGWcoq1lbzUlYVeU21dFuuI46Qz5TwmvPG1U9EOF9FFBZrjK1gnUzsN2XUGxOdNF2tQv
	7m2Vqm+WrkLJtVLBSkoNpgO9F3QvDf6WvFkEKrDqp6W3bU9hw6l8mH0DUc0LilWjxMPUyOJzIkj
	imW1bfhRPHlIusHMLUv2qgn6dG/4l/DPyJ+8flrJQKhWRmnDTXjJ9XoUJqIMj7NSkgInwxnxHRo
	IVKjzezeUmFTDsiQczionBOLJWveHEh6IF6EwzY0iQAS8qH2RafGUjW3HILX8j+OG5kcCv/+4T9
	BwCUkb9wrWugTdW8E+1C6gHqhQjbc5eZGcSboc/gjPAOkvdtUzM17gUSZ5JvQCQ2pfvFi9M9Hrw
	nImg==
X-Received: by 2002:a05:6000:2505:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47f84061735mr2108026f8f.0.1784674070369;
        Tue, 21 Jul 2026 15:47:50 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm212850f8f.31.2026.07.21.15.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:49 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v2 2/2] hp-wmi: use modern cleanup and refactor allocation functions
Date: Wed, 22 Jul 2026 01:47:39 +0300
Message-ID: <20260721224741.33624-3-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721224741.33624-1-yahia.a.abdrabou@gmail.com>
References: <20260721224741.33624-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Refactor hp_wmi_perform_query() and encode_outsize_for_pvsz() to improve
readability, ensure memory zeroing, and verify bounds.

Replace the brittle if condition tree in encode_outsize_for_pvsz() with
a switch statement, replace the manual out_free label in
hp_wmi_perform_query() to free args and obj variables with compiler
provided cleanup __free(), replace kmalloc with kzalloc_flex to ensure
that memory is zeroed before use, and add a bounds check for
obj->buffer.length to attest that it is larger than
sizeof(struct bios_return).

Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/patchset/20260712191130.41183-1-yahia.a.abdrabou%40gmail.com
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 49 ++++++++++++++------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5ac29361dc17..bf74667838e7 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -552,16 +552,20 @@ static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
 /* map output size to the corresponding WMI method id */
 static inline int encode_outsize_for_pvsz(int outsize)
 {
-	if (outsize > 4096)
+	if (unlikely(outsize > 4096 || outsize < 0))
 		return -EINVAL;
-	if (outsize > 1024)
-		return 5;
-	if (outsize > 128)
-		return 4;
-	if (outsize > 4)
-		return 3;
-	if (outsize > 0)
+	switch (outsize) {
+	case 1 ... 4:
 		return 2;
+	case 5 ... 128:
+		return 3;
+	case 129 ... 1024:
+		return 4;
+	case 1025 ... 4096:
+		return 5;
+	default:
+		break;
+	}
 	return 1;
 }
 
@@ -590,8 +594,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 {
 	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bios_return *bios_return;
-	union acpi_object *obj = NULL;
-	struct bios_args *args = NULL;
+	union acpi_object *obj __free(kfree) = NULL;
+	struct bios_args *args __free(kfree) = NULL;
 	int mid, actual_insize, actual_outsize;
 	size_t bios_args_size;
 	int ret;
@@ -604,7 +608,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	actual_insize = max(insize, 128);
 	bios_args_size = struct_size(args, data, actual_insize);
-	args = kmalloc(bios_args_size, GFP_KERNEL);
+	args = kzalloc_flex(*args, data, actual_insize, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
 
@@ -619,19 +623,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	ret = wmidev_evaluate_method(hp_wmi_wdev, 0, mid, &input, &output);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	obj = output.pointer;
-	if (!obj) {
-		ret = -EINVAL;
-		goto out_free;
-	}
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
-		ret = -EINVAL;
-		goto out_free;
-	}
+	if (!obj || obj->type != ACPI_TYPE_BUFFER ||
+		obj->buffer.length < sizeof(struct bios_return))
+		return -EINVAL;
 
 	bios_return = (struct bios_return *)obj->buffer.pointer;
 	ret = bios_return->return_code;
@@ -640,20 +637,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
 		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
-		goto out_free;
+		return ret;
 	}
 
 	/* Ignore output data of zero size */
 	if (!outsize)
-		goto out_free;
+		return 0;
 
 	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
 	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
-
-out_free:
-	kfree(obj);
-	kfree(args);
 	return ret;
 }
 
-- 
2.55.0

