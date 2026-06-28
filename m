Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210733B960C
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684003; cv=none; b=e0l9ENK3Ntujc0VzGN44bEDirquVpVfi9bM99MzGXYR/iltvCmcLgd7n1AMu/PP9uDl4UgaXjkGVvKMLgmWYd0w2p9L5Gty7qHtkz61KyjnB/oEkXTxROd5pX8kSasA7x5pj5woZ934rKwkaQNj3yeU/7w8NXaAtPhUSoTUez94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684003; c=relaxed/simple;
	bh=c0j0KtoOsvA4lCuNyzb3A6RGtnWS4qxKbvnaBGRR0Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tFhD/ubC6mLDXUN3YmnYCODepvlx4j7rBSP02Gy7Oeq2crwIksKC+r1vMSnT9WQvlxtB6HStjH2etDlRLRmlWkNu8hiLGDnc1mnl490F6a9y+0Jpprhec3MBB2lwA0yuNAbgO8meEeyx6CJG3dFlqa3mwaekixVXDycpLd3oUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PkPA+7lG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PkPA+7lG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493a287b8c1so6055895e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 15:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684000; x=1783288800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb5vG+ZB2oT7q39V8UCnpYE6h/NoMRPCC5MT1O1MB1E=;
        b=PkPA+7lGWvOI/nqgG24fx7lpiZzHJEXIVovNTCkkoGp0DbRAX2s6qpeyFO4CSeLV1j
         e0bN68UsgG41CNv543PqChgldyZFKNl0V2f6dvEuwNFOekWebbozn5tBZ/qeydZ4BOlR
         uucU7mxYkLAYUm9NziVLgD8VBuTitXIP5D+jXWujgROYBzR8C/0Pun6+cNSWFPVRcNjT
         pCqZ4LRn0es12Q8n5PI6IumxgGxSd6X+6azyeLrU2iTmRPHq55jkGYD6eTvCHo/vpJgw
         iHG0bpZ1c0m1QEUke3N82hj61SCr8d2EiuPAVqg4a8GMQAhrKBpgJEElymfkKXhVNTOV
         5neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684000; x=1783288800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lb5vG+ZB2oT7q39V8UCnpYE6h/NoMRPCC5MT1O1MB1E=;
        b=oBmzGfkvDpytK3Em17wo/Cma9dEzZI33iZZvhJaaWRf8ZlSqnLNyPOlVCjnpk4OhEO
         xzrsLOzEweVtMSWkHBREWzwTd988DwU7FWVMjDR3zZtdgijD4ITQEi7EjHSLN8wGhJlB
         HrrnmqllQH3Y1PFB3BvUslugIeeshEhmGsqBd6o662s5Ps0XKO7slV1IEwaFoFWNQpC6
         MhZxj+vBIZLeTR0fJHSq6Xz7oHkEt3BvlQpx+OazinjQzELBh112La/127zZx49JsQVX
         sCPb+IrFMJlq6BNj9rDWK43wKTyfcHnks2qbPX1QnVlSq0xIBv3lJ57aGn+p8IRYob38
         k7EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lV7/oXfhhp/23x/nXVRbofvFmn4sUiV0Aro68MI2nQAWuczSLpR+pV3wleLdsTHWpTvuz+r/XqhhI986sAXIj65Uc@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpbDmCHt1tAjcxIFgU+HiyO9vz62zflpaapbwNBSqS5bX8KLp
	sKJcAq7KZxvFVQ2Hs16mUeUUa9PzHgv6H+3Clq3D3Qh4yD/LApC4PNDexQ32Nj4jBMtKfWzhgFk
	FRuGn
X-Gm-Gg: AfdE7ck1ji70i5Y9rKCG/zK7YCnV/zBXR2l9KjcmSv05aZbEIa28Hdfa0T1s38Chfs2
	N+KXtgcybyxpixjvQV0Q/UynZPfvTvBU4HvfRjX2AL1GOGT3712rB0S3ShBt9w08TZFi0dR6tJv
	mVcWckf0CNNz5W+buL2+qDDFPzmr6/IZnlPMo3Qp+KaIdDwPDo2SIXDbkQ4ZpIf2wK1wZtinr4m
	/3ayevuPBPpuT193WI5Ub+BGwPOmHZ32rCAPIcCGVV3XBr7tTsbCxXvQkG8LSODGj3umVWKGr+a
	aWXyvAsWz6kHAdzvwQWAE7xWBDmCnt7/0h1VGOTB6xMwSsuuyPTNmqKvzncxE5DZeLPEcV9Ft7b
	Igi3/BlpEj34lbMfAg53hLrI/1K2NL0q+oCdtzhXI/oy4H7CBioEY4mUw7RcgFkxGcRhxfT2zTc
	KknEz0oBbv9G27x8oLYQ==
X-Received: by 2002:a05:600c:8b03:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-4926689ffb5mr227680525e9.34.1782684000648;
        Sun, 28 Jun 2026 15:00:00 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fce60fsm249453915e9.1.2026.06.28.14.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include defining struct dmi_system_id
Date: Sun, 28 Jun 2026 23:58:44 +0200
Message-ID:  <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=c0j0KtoOsvA4lCuNyzb3A6RGtnWS4qxKbvnaBGRR0Ok=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkjeGbTazG7/l3ZZhTlP7WyXbtsVArmzqUmS KlmEvO+YvGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZIwAKCRCPgPtYfRL+ TtVeCACy6EqYY3NvJoV4mel+MfYdQKYHsvWpMWm3lcRZ+tTA3+1n8A4knc45Gk68EogXRy1qq0u AK8P69l2QhNW4sZQni0ZQ/FjwXlArHu1hdfHcavhMAZkctrMtw2/OOIzkHITL/UZ7ZlP48Kjt4b IJUE17UMtvex+H4/hdC6JbofbL4xeIdeqhaBFNDAwRbdoyR0WetIxurt/VY1I+b9SMUJGjPqofH uS/nqx5OBMFZ50ocmSgwbLOMeiVAFvADKCKsUH4nkxnFFEb5naexoS/ryt2BljKK8gjQlmI+JAk WQPGnbC1ULN8RU4Vb3U14o0+Rfq8isRaSBI4JS8/9zRwCVHw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitively
which ensures that struct dmi_system_id is defined in
drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. However
this include in <linux/i2c.h> will be replaced by one for i2c_device_id
only. To ensure that dmi_system_id is available add the include for that
explicitly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2498390958ad..c756961ae5fd 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/irqdomain_defs.h>
+#include <linux/device-id/dmi.h>
 #include <linux/spi/spi.h>
 
 struct gpio_desc;
-- 
2.47.3

