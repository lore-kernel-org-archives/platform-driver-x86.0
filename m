Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261C435028C
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883502; cv=none; b=TXC6nEfR/DjAIGFEdTkGhJOtxHEndcQyiezvbNgMHuKIEJuO1gsHSaGDW2tDkKY5RD2g4sGRAXVYivRjtTNwbc357TORQ83+UmEhtpJQPGOyDG25mopfbti8QZlebE4Fm0P9E9T1y9qatQ1IS8uyXKobX0IcBuc9ZndI/sxhy3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883502; c=relaxed/simple;
	bh=N4TxLI2v8z6B4Ah2iyY8sMoXsy+6vUVc+OSw2XOc9sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raQ0CUN9qL/SfxWFh66tv1b4Ty+n/De9u0m13Iiva4CwJZKOpIroxqucJxRz+4SGpdsPTPT71cElkaUQ9iIX+JjF8TKy4yG/yxCg0ojO0+o7C/8RV+qnggA//WjOnEASlm6bl4clQyzBRfLJmSZeACznHWwhgxInwg8YSiTn1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZT71jrL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZT71jrL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so13517115e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883499; x=1784488299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJa8KJA6hgLDVfbVdBJpuz1UEkSFIEDcBkqK66J3oM0=;
        b=EZT71jrLPYa+xGsWq/dfnh+/3mi/V6XPLN2wpRztu8Dl7q6YssFDELY6HQhcY5eVSO
         bWgxlfmcb506N2wU7CIxcL+sNEmHDV1B5JFbfdYjYUOM/OLZMTGXwClLl2c9BXarqx7D
         EPPVEz9uPzauGcVqH4BmGmW0sGSkbPoGT3+M3u5H32Dixda5zsAsyb8mgdTeF63R7Fhw
         9YXA8MqJmCnjhKEJIXSAmJTStAP8UGDfxFu1inSZ1NtSENvvv920Ol7Y3V0St57antUw
         W/jALPadV0xwdv4pv2REnlAEfUlJlSnpQty0JZxP2BcPmpkt3m0dlHFRSpRsEsGdmugt
         SBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883499; x=1784488299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJa8KJA6hgLDVfbVdBJpuz1UEkSFIEDcBkqK66J3oM0=;
        b=K6eK7WjFBL8GomFH63R5ZwDc7AkF1q4nMywTdolmLkjfU1l4KjeZc4G+A5uQZQHJjU
         TlT42pSKJIhH8Viff8CyTDglD1ArklK8Bmw458RDa2/FRbOa+KD6WXPrRygNbs5QBRFC
         lM5L9HPDXukdAA86gRBDUfmEHX6dgBlGutlpd1v40ep5S4JtxuuiSOD8VWimdTommDwZ
         kS512nvcmGilzBji/T6ZFA6JTPqWuJfF7Eg8w6eg8dvxMVBLWoRuZ6HOoy+LvVq0gbWd
         xkbhxDrcRgCTLAxJ3dEo+lOfzz4pRLKEWtaUmQxNudTytrqF2o61paJNpMFDHtHFPnPM
         nbKw==
X-Gm-Message-State: AOJu0YwkFhDcFtjdeRkhseWG+Ubh1dKWnsuG6Ph/WyGXZC7JaDSisVp/
	6Mf+bTIUVKf7FOfeTqFVAd3AYKS0kg+/+uc75LT9coeBkC7Ado3dyEwV
X-Gm-Gg: AfdE7clFoB883yfcYCQvWZTLGwks/S6Lb97CjiFCR8gfumZOTbtBHKJbE400uz875wS
	nmkklu2nL3++th+Y7oHA/CNoh2ECJncTl6iAkRk3cWJ4joeXXM7jd/pi+t5Q+pdphXhmOna1nLV
	N1/ItOMCOwaoZAae5NzZsaii1F5evZqQUCr5fmxh+NkLXkSg0JLtozCkECmjx2dQY0DmNy7exmG
	P5DNhHM2B4eJE1jQ56jdARazyNAkUyUM7gfik85xcaeuoK8angPaGDW7QzjmJJboACZa6TfIXew
	64SPmEBK0TzEorm3mnhRQTt5s47Mzf03lt/UeV+rUro7jELEV8WUGMaWO94qqUtmpbeg4TJ7Kpz
	7VPs0unMi+IXVoOgdnTdTIxO0LURJlkbeifFY5oNNqh7RG1GiIOOQ7yPOp7SZDdLm8ns4kec7Uc
	n/3ClOHSgJde/cmA==
X-Received: by 2002:a05:600c:3e0d:b0:493:f5bf:4deb with SMTP id 5b1f17b1804b1-493f8818c63mr70945125e9.25.1783883499308;
        Sun, 12 Jul 2026 12:11:39 -0700 (PDT)
Received: from user ([197.197.151.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm234468265e9.0.2026.07.12.12.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:11:39 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH 1/3] hp-wmi: refactor to use __free
Date: Sun, 12 Jul 2026 22:11:28 +0300
Message-ID: <20260712191130.41183-2-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_query_perform currently() uses the out_free label to exit the
function and free the memory, but doesn't use the __free cleanup
attribute to simply the processes of exiting and freeing memory.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..c924fbb5503f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -581,8 +581,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
@@ -608,18 +608,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	obj = output.pointer;
 	if (!obj) {
-		ret = -EINVAL;
-		goto out_free;
+		return -EINVAL;
 	}
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
 		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
-		ret = -EINVAL;
-		goto out_free;
+		return -EINVAL;
 	}
 
 	bios_return = (struct bios_return *)obj->buffer.pointer;
@@ -629,20 +627,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
 		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
-		goto out_free;
+		return ret;
 	}
 
 	/* Ignore output data of zero size */
 	if (!outsize)
-		goto out_free;
+		return ret;
 
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

