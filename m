Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14917483BEB
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832431; cv=none; b=t/RhtaGEWHh0OuTv/e6iJPpgIl/3qW64NNcEIgrr3vSfUElKoGxJYeIMhgOu6crErUQgf5VjZwtnINXudE4swrqvk/4QvUdRPZ8pM5nA3BAS2YuAYLlan4ssYkzmLADxXxGF6OV8G50DaFyKR+MMqBXF+bqDQSE2ogFSzvjLdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832431; c=relaxed/simple;
	bh=fqeRCaJ05QJbdHKiFDfxqyKSnyoUuDOaEx4VGjGig0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMYyLglweOeac7w1LkdfGUEl6LBGoELRPbPYNoSTjyGXAmsoSNAahyk0cU/0k67DltNIN2r3i/HsPlo23p9oEBfJgbvnOCMFOMANSCbhULMEDM88vgH2WaWy7W9Q9mUwfg9QcuXtP/CtNiba+jRgIL2Q/r0fRCwJPZL/Y8FtOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGbpTHPC; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGbpTHPC"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1122134a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832422; x=1785437222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0IXVWZk1Ru5X2yu0BgI0Dx4RhQRg+VvgM7kUVgisNw=;
        b=pGbpTHPC6buNyKLICHhTVHnS/5hfh7akl2eR+RjWQZTovLjNPLengDWiWeajubNxnK
         N6oJx2+lwbVNMf/QWFV9+4z5tCX8tUeMSH/fbYZIF6GofwtfwhQjGg2IHXYINYl/cCFY
         aL3JcFIb1HXzN5MqTW4Fp7baqpEEEvF0FifIU3qxfMoeFanKtzrQk7ZQijwc6T70IsvZ
         1cCZLMKC+NdlGu7wHD3EE7WNCmul8VB1NhW0cGI/aEuiBFyCeFwje6qhx4mvnzOfFqLX
         6p/rnC1ZYQ2sjXTutmD370Vtk9vBn5WqUDtXadmmT9LXsprd/IBx59B+QBKehpmrAFwY
         rp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832422; x=1785437222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0IXVWZk1Ru5X2yu0BgI0Dx4RhQRg+VvgM7kUVgisNw=;
        b=H8lhKzFItt+pc7Wrr5rEMYIx71cu7JsFJj6SSFqP8cd7fg4a8EmZfqzDDAwfK8i7li
         0xEI9O9uhcexd5mkSTDhfcxXtQvWFUNUwP+5/ZxOto7WHL6tGVD8qqsVD+NSuioUXQQW
         Xu22QgaNUMcLoaLmcRSVfart/oD9tiVFqZvljCxzdYtSMTbaqdE5uCZ5v0elSK1PCv7T
         SBDZXSA8yl/36U3XhxktuppDOfMc1dSM8kiNXmHIWs9ZffT1b28hvnILh3NaJ+TP2nJe
         nu3giXlI8Wrj5lE7i1xqM7ccpTBOD7Q+CUW+kzlDgzD9Lq0Qpc9ULXkUT31L1WLwzDeC
         Xl4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpR2aykiGyqLN+edgno6DszQzdmDQhtVSnTV/H29EKtAGIAnr0/5L0nGZHSVU2krtAxtkiyPTgHkn6Tq/iZRFfzeSZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yww06+T90fO0fwE3oRW4b0NGHPJd1Uev4XNqnxAdjnBteq0PhmM
	FBWxciMEDDgJH9r20YxqORTX7PJ+eCiQ3bw0SH/Zj3hbiHZSo3W/M3zG
X-Gm-Gg: AR+sD11sNxnk4M7YVp4kGkKudN5p7tWU2OwMVCheJ3HUtWLv12HiulFxyH8Gpw8r2xn
	ugBCgS7zoLM+lMzm8YF71LCprRpHPg6MB22LofbyMQ78KVQ1N4teRPsnNN0kxl+WOy0RLJlNf4W
	0QzJG8OvIZOb0uOTCB6w2cfQz8bb2M7Q6fiwcotQ8kSVnp+ZEPiMSfbwiN6DjiDqZqARloNPb1+
	rhQYHsb/iCLku21bZqO8SX/KESuF7XlsZx12bio7JIDKPojfrXCg/W+CQRJXUrjydIF6FTr80+/
	g8ag+m1gUZ0moDIhImE0lLDXHXDdNJhTjZA/Jk+qq74OVIxSTkq/2AGdVaxIDqCkQqfmgpYoqdy
	jumpm4SqBjN7A7HHIHC2EHQE3tkGrlDBsU4Cw+kiRlTkfPnVkBTKOAQD57XAgRNA0PAqFRnPC
X-Received: by 2002:a17:90b:1350:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38ec64a7b7emr4626593a91.10.1784832422117;
        Thu, 23 Jul 2026 11:47:02 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:47:01 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Azael Avalos <coproscefalo@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 25/36] platform/x86: toshiba_haps: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:27 +0900
Message-ID: <20260723184538.3888637-26-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index c6633b74029f..4f62476b8dd1 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -251,11 +251,7 @@ static int toshiba_haps_resume(struct device *device)
 					    haps->protection_level);
 
 	/* Reset the protection on resume */
-	ret = toshiba_haps_reset_protection(haps->acpi_dev->handle);
-	if (ret != 0)
-		return ret;
-
-	return ret;
+	return toshiba_haps_reset_protection(haps->acpi_dev->handle);
 }
 #endif
 
-- 
2.43.0

