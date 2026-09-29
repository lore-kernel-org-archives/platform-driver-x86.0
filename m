Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CD3D3008
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696430; cv=none; b=GC8CtaxupHAlkvPYksdCk/Djb8EUrfKVdiFjbIqgWNDSKrgRpHdIRrv3aV54NV/4XWcjcinJUtBJZulu0XAGSbSIVa4DRRIGZ5CCAXnFDje2ZuAwSxeSc7RzIu/woML47ujdZ6wcYmyWiE+KZruj2bYg9U1dwdDLjYCgomIS980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696430; c=relaxed/simple;
	bh=mH0jZwfkHRJ/f29fgMIPF22P1sLjDotROPwF1ZstbgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7QtTeGprDZUE9qUjahu1e98g84xvJqnV5zdikTVijiok5angptoTe7aUct+bQXtjPtbrDLmR8/U/pE/n9thHWdRPJFG+QGKWTQu2MOmFNnfVRzG6s70I+c/Z+uRSnRiV8O9i4kvPZHqA3dm70dbSLUiNoPx4L4j8QvgNiyI+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja/b3UN/; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja/b3UN/"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so1947615b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790696429; x=1791301229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1NH6lS9ZrNrd0d1hVfQFU/u7ZfW1VWDSDy434/8Djw=;
        b=ja/b3UN/AwTtivYeaxzJI6I4mcgnN+EiRtwUaEhfUiE8bp+usNEi1af404K0AzJc8V
         cl6+WjBSlAdyedwPs7sMq0EgWO99OZ/IsqHyxxUIj/CGrfuDoR3mQOmRv+2HaAuKY0Sw
         06HbF3XlyJuSJwWjvep84riHLlifQANpVnQ05ZHYx4vjNMyaxPEafe1e3cES69Q5qOcd
         EdXT3nC5qO6GM2pA7cXypGOJCxjdpuE+VxVXn99IOu1oq4rxiuvW68b5/m3ZEnKU4FLe
         sJBexnF3NzDJ8ABjYgdx6+I2HvOKB61fZeC7jcdZxEeY62QXp2Sng0fm4UofXsM/3/ho
         HaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696429; x=1791301229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1NH6lS9ZrNrd0d1hVfQFU/u7ZfW1VWDSDy434/8Djw=;
        b=XLdLo9mivihNpjNhnKtthq27bTEytQh6Zo7LKd7+c8v4QEw0t1bCpHt5iwSH1H8VkX
         SiGdNmTrh9/BkjuTTQEcGg96f7ZV9EcfVc9BL4FPvN0ZYaDDdqeg245Z/bYSdfjcgaNo
         y9UnyLjzzNK5+GipX3bXLnSQpqSRw9U+4lC32F2V86Fm+Ye1UdPBOTmrzEzuO365BLaG
         yv5UB+sGCK+dS627k1J//SdFnUhT6vZIArJ5SSoNm8SCOflc68nCSKr0qRSF6jIoV2tH
         pXafhh45smKO4NW+hg/si+id6OfgMA/QDUc4TeaRMmjyIxWA9+II6QtT4LAzpG60GzUr
         zp9Q==
X-Gm-Message-State: AFuF++lyY1YkQq8eqVZG9rHWLW3XC+ikzf2wRGKwr6JctpRdibS05Ndt
	1DhS7NqPtIBexlT2lVyKTWIaT6Y9aULALNm7v2Fcz3iIPJolNJpEYvHIeGq+MmK5cz/78G92
X-Gm-Gg: AYBFou2dJYnYqSRBRyV3EyV+l0CN7M40oYaGABUIZRlUlDl4/pVHG8Pik2yetw4Nun2
	uT+QOqF3SZOh2uuNpbwhwb3edZlaYeTbKCo70Xg7Yxt88Y4y3K/QhLl1NtOLGLVaHlYZsRrRmBM
	+icuCzyb3D/Dwxg4awz3CbylOt546cRIugHFpHvTi6RyzrzQAsLZV1DTg2UELec1J6+z4hWZsrT
	h4hb+8cH3nkqEcMl4uL2GMYArbqoqzuzKynLSfsnw4w8hr6HVbsjwu/CecMWA+PCTWK0dyDWcQp
	NnBtAMFB9e9Em9TEAqivOpbGAOImpL3oYIHOip5/UHGf79/mF3DpbxB2ntfpQCpJQswieALw4Al
	d/wCkbDTmxb4en9i7tEWE45oP2O2ZHxiu5e9PtVy8hSYaKeTh1ESkhw1FEqhwtsFrY+JC5TRUKy
	ADIl+OOaCiffkqZtBww0/82ArPmXvpTZe3Brph0WaVAxDQqnXuLRMiIqFD54z+ZtP1J3luVrhkA
	TeWUnqPceKoWafdgNxjUVL4V3T96hDxBXis6Pw=
X-Received: by 2002:a05:6a00:4fd3:b0:881:3f4e:4ae4 with SMTP id d2e1a72fcca58-8813f4ea2c3mr9376150b3a.53.1790696428794;
        Tue, 29 Sep 2026 08:40:28 -0700 (PDT)
Received: from zawanix-thinkbook.lan2.zerozawa.top ([2404:c140:1f09:d6e:d9fd:40a6:7730:7869])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868b412116sm163851b3a.19.2026.09.29.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:40:28 -0700 (PDT)
From: Zekai Xie <zekaixie37@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	linux-kernel@vger.kernel.org,
	Zekai Xie <zekaixie37@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add PrintScreen key on ThinkBook 14 G8+ IPH
Date: Tue, 29 Sep 2026 23:40:23 +0800
Message-ID: <20260929154023.89492-1-zekaixie37@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fn+F11 (PrintScreen) key on the Lenovo ThinkBook 14 G8+ IPH
(21VG) reports WMI scancode 0x48 (0x148 with the WMI key bit set),
which has no entry in ideapad_keymap[], so userspace only receives
KEY_UNKNOWN:

  Event: type 4 (EV_MSC), code 4 (MSC_SCAN), value 148
  Event: type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1

Map it to KEY_SYSRQ so the key produces the Print keysym as labelled.

Assisted-by: LLM
Signed-off-by: Zekai Xie <zekaixie37@gmail.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524..4cae65c 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1364,6 +1364,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
+	/* PrintScreen (Fn+F11) on ThinkBook 14 G8+ IPH (21VG) */
+	{ KE_KEY,   0x48 | IDEAPAD_WMI_KEY, { KEY_SYSRQ } },
 
 	{ KE_END },
 };
-- 
2.55.0

