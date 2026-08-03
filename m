Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB84A314D0D
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767460; cv=none; b=tv+Ig1VgeoBNL6Enj5K/9zRcYbHTm7gbj9VsBsDMMSAU2BN6DKHBLQNYpGU/8sfyzjvLidnRI6KrJTzA1AUCZgayUYRBT17v0oEJ+QmCOFO8TiS05OKT+Xjw3dJP69/knHaQ2WybOrz6XQNuCitwcut5Sdl27aAISOrEPTPR/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767460; c=relaxed/simple;
	bh=GXnVaGcOYcGeGF51vfhkksxSxm5iT6MduRJD27H8KxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohRO8ipFAzOHTOBo3yDp1aKpDZR/vjLOgI2V/kMKwOWzHQQEjbXnaHLRZAxhRht5wx19SXaVdX0kggvfGUP15dm5nHwlo8g94KWAx902+hadHx+r3smoDbb0ZDswwZS2G0zM3+7QpKSSHSpFpMiRqzN4icuIVnYFjg3c/Jpe4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMgunFXV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMgunFXV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980dc26022so13781925e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767455; x=1786372255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRznYyon0XGUdVgbipyEvsqHsHiyM4eqeCRczfbwZQQ=;
        b=cMgunFXVWhAQ0qA/a8BWNqAE4aMvnXbCv+t2appMzu75LJ6iLzHYzH4FrpXyv6xGvu
         3lyZWCK1VE0nU6bVgCsWufB5ElqeEzSEU4s3ZO2gFDWkAPNYfMh/eldeTQO40U3Nv1By
         ut0WeWBmoWOeod3dBUQWsbu9AGV9Smfe1GZfsdu/3jXYzk+cDRzO2pJEKNs4tD+MIcFL
         zxL4ZOoX+1ZYpsMXJhwaR3c6xhVJ3Z/nFgotwoQLlkAh1v/t2yoFn7auBmbDDWaagifI
         6nywVuzr4zB4QNzezEq7c12+c8H/OBPYEfyposjxzs70p1xySaFcKffkBnGqoANG/LnG
         /Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767455; x=1786372255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRznYyon0XGUdVgbipyEvsqHsHiyM4eqeCRczfbwZQQ=;
        b=p+B0ErixsoFar+GDLyccauR/EBuxAzJfo/2IDVsIdDxtjLk0MKOmoeLUyGiwbIuuGy
         PGYNbbkcv28tTi1t86bsIub/xG8xUrzTEvcmzRM4TFscimiNNiqirWspmJGtcYiOsVAy
         DD+zjEI/Kf2E7LHzne/GgGvwX5LMMtHlNj70gtZBKl7YMLmL1JZ/Od51L5Vxb2oTwHZg
         5Wn9WZJ3b+zh2YedKwGuRYXXKV4FBe+qF7WD/YsbRaRu1olORwa1hyauzhMjH89c4nnD
         HPmkcRPdOD+EQp3qBCm4glogT88PvzhSAXK3g7Tq7C6b7ehzInG9t0Q8Lsl0aa+srsZG
         DMrA==
X-Gm-Message-State: AOJu0YyUrj1RyQswRGd7vzs6SdGG/JI8EXUbsWQ7+4CNQgecBOxHmvKy
	YU5F2P0BkbR91AAEoe+qx+giH1S68tTnUEsvCId8ugfZn2nPMl3HZpeNLfyXsqywVrQ=
X-Gm-Gg: AR+sD11pS/zU2anzZ75LVS/2wBQvJHDGOqduEtddg31AUpRiqqL0u+mT8UtLmwY2xQ5
	zX6Shh3ULlp51uu2zPBCVJX60bE2Gm2QrGz5ifkQSy45JqOOzW2qr9LQUr34oHu+P6ad0nX6zEx
	Xw3smqCyRoRV5n7WzDsGox4F4wVG02mpFQlRkX5xAhld9URvsfcdxUfIbEz8sfjLVf/j095lJ5K
	J1EUG1EFeJHAZDUdgow/h8B12gmgskqtTwo5WIXKkE+6+/wKVHfADeExBWjLnaqIqNXmu8ZRd8f
	ClAUQtUozZntvb66SErw0l4RSdCtjjXrdZvXfF5H3DBq7tHFqxLAzyS4uguxpSPzkhQavT0JSi7
	49uZL296MQOPtbh5cZLs3M6EMrx9vTCvbVxOpKZRrx8uTlObi7QLU4pfmUe+VVTt5kSYClsNzXY
	/cmFJ70jiRNlBVsljRX0GBG2SMCxtsjm6yUz4g7mN0Y8cKR9QY/GjBAOy9FtOEUc9tQf6M1GO9D
	cmDOmtpeNzbO9oWTD41I5WGbokztagUyY4j+UXpzA==
X-Received: by 2002:a05:600c:840f:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4980c6507e7mr211322355e9.14.1785767454564;
        Mon, 03 Aug 2026 07:30:54 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:30:54 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 02/13] platform/x86: hp-bioscfg: fix heap OOB read in sk_store and kek_store
Date: Mon,  3 Aug 2026 19:30:25 +0500
Message-ID: <20260803143037.93105-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sk_store() and kek_store() strip a trailing newline from the sysfs
write before allocating the key buffer:

	length = count;
	if (buf[length - 1] == '\n')
		length--;
	bioscfg_drv.spm_data.signing_key = kmemdup(buf, length, GFP_KERNEL);

but then pass the original "count" (not "length") as the copy size to
hp_wmi_perform_query(), which memcpy()s that many bytes out of the
"length"-sized allocation, reading one byte past it whenever the write
ends in a newline, the normal case for a shell "echo" into sysfs.

KASAN confirms this directly:

  BUG: KASAN: slab-out-of-bounds in hp_wmi_perform_query+0x1e9/0x460 [hp_bioscfg]
  Read of size 28 at addr ffff88813c8e2b80 by task python3/16022
  ...
  sk_store+0xa7/0x240 [hp_bioscfg]
  kernfs_fop_write_iter+0x3e1/0x5d0
  ...
  The buggy address is located 0 bytes inside of
  allocated 27-byte region [ffff88813c8e2b80, ffff88813c8e2b9b)

Reproduced identically for kek_store, and at multiple write sizes
(28, 57, 201 bytes), each time reading exactly one byte past a
kmemdup() allocation one byte smaller than the write.

Fix by passing "length" instead of "count" to hp_wmi_perform_query()
in both functions.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 2b00a14792e9..4d94e48c1a4c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -238,7 +238,7 @@ static ssize_t sk_store(struct kobject *kobj,
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
 				   HPWMI_SECUREPLATFORM,
 				   (void *)bioscfg_drv.spm_data.signing_key,
-				   count, 0);
+				   length, 0);
 
 	if (!ret) {
 		bioscfg_drv.spm_data.mechanism = SIGNING_KEY;
@@ -274,7 +274,7 @@ static ssize_t kek_store(struct kobject *kobj,
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
 				   HPWMI_SECUREPLATFORM,
 				   (void *)bioscfg_drv.spm_data.endorsement_key,
-				   count, 0);
+				   length, 0);
 
 	if (!ret) {
 		bioscfg_drv.spm_data.mechanism = ENDORSEMENT_KEY;
-- 
2.55.0

