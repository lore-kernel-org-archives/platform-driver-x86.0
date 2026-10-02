Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347B3E5578
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968523; cv=none; b=Rg2NS7v085nkRLMFsq4BEgOP5H8bMnl7vgQheTtN/+41BdaWPJbfIhPYhZtJqxytEqU4RrkazwbbMpNuqzj2c1wJQw3tbtHMMZxuQN/w9RvytQ2V/tnjItPEbHmN5HFblvP5WBQJvNTg/2Z7MI1OaCXJtfaur0Mupw/ZK/ZTUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968523; c=relaxed/simple;
	bh=XAQgb0F0u4DegmBOA3E903aqLrqIrvi3IpWeNxWb+gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuF8D7apGQN3sxdX8UVbhZJkyv8iJE/gnZ1CxRIlf2uQ2KC4HuQTjzyubuRKlY9lBUw0Y6qUhiAPPGXGt6Afs2UZ/izwZBAiVLOtRcSCNW2rMTQUMtAruzFIu7U7RU/wjy9qpbqApBcAH7x2i9585+QnGotwazudphZ70ODYnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXdVWcxb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXdVWcxb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1560405e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968520; x=1791573320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIvFwZrJp04ZdQA1Z5QwmseYff1JrQtZkKNKsph8seM=;
        b=MXdVWcxbmecbwEivTOhXdex5vMSFzZMPBbIUzYyKvIxct43IGIdtPaXkNDhS3j6WI7
         qkXnMOKz4pukuES0QhPQEJlUrf6nbmeLbbo/6Jn51Ck/hEFi6wUg9pnP0ECmu2jBCgpd
         YgAu9bY6IsvU1gUNVXedUY/XnovRr59wbncOmLoWnmS9T/TitvFNNi5BOKjyr2/P3CEo
         Tpi2gJNbjN7/x/COPtWbMPEIiOClfC2ZmMmlefTRddyl6i2SYieWhUwRZk4wiESlg/QS
         OysgbdRZF3fS/pPoiCO4t/T6lcwnli43PFWbuIXUI6FzxtqubU6+adVXMdw7le07jIKU
         oNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968520; x=1791573320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cIvFwZrJp04ZdQA1Z5QwmseYff1JrQtZkKNKsph8seM=;
        b=SmSbC9jZLjNRqtLC8N9LaWxkL4dvtW6hVJSTSTq1zEaqNpqJAaqS2st8TX6lIyuGdj
         Yu6cNKS1b3iRO+6NAmNalt/RXChqUc7tp7buZmVb4Umh99ltaaojWMo3XxCc3obqrJd7
         45XQ7wpifonfjOp7Zb9y20zk6UPGBhi7exAiQMA2i8g4q2QwgWeLnr/4g8BYc+6/LnCB
         gcjPPX1RHsVDOy3nd2A6UVf/Lx86tNUUv5RJJ6nBJaBryHgsGQ32pg4VEo14djSnAJwP
         dVRKwC40jHCr+hGxozOgUUe4jYUnufD1+7pFvtZHDEn+n/72oWnhfMId7ScuhsWy3ozZ
         uMwA==
X-Forwarded-Encrypted: i=1; AKwUvBxbYGqP24D23XPLTz7b/Myn/MXzcJ8suCCN2UZI82yNzt1HzOXuk5/gAiQ1hVoXwKMhjwafhvwxNXjHDwYBXWrF7DQV@vger.kernel.org
X-Gm-Message-State: AFuF++mvhxAfkw5q1sEnzD1a4j8t+j9sgiN91WkFrXX8J/LzROh3ta6K
	J9t5Fmd3TxtC+fmhlq+/EFtaelgvUosmuayOBDAZBacpZbz/ipHQ/kuN
X-Gm-Gg: AYBFou0LE38NKLKq5lUfI61whNvmf2hMdATPxo7piNqDVZLwv5zUY0tTFBFXJZ7pdDV
	zF+jQUHFRA9tN1/s+tRmu9JH4CF5L9+HWd/X17BfccxbF3XdzF36jfb3KLJ9duy6DCWVp8efRJp
	b3fCdcayXlPXIL7GDCyzdVkiT3RVJVPr9upx9DxX/xReKBR39at+zANSiDxNnlQd/0AhP536tR2
	69kaZP/CZ2eoyC47+CXCt54T7pltz6XltZGf4ZWYDHsRNcqQQGij5XwLKnJUylw+DN13QralpJ3
	iE2KqHAlsLbGIo4Rvol18R2z0UuHHfV1ubpcA7KNIp3401rH+gGkkoxph/CuBfRtUtpLQ5CwGv2
	QksJkMjiBs2MHpm/L6zgRs3IW4ZQd/HgHnCtolxlYAGq3jiqQxHwRkcO9MQ/ikoX36nboKadGU6
	Iaew2m0lVJjqBmLMQYM57EdEWHKifzPUyPWW9VufKgV7UkHXAVRScIgpXVvKNG1ektcAiXoTuHq
	mFMrgb2AtWmGd6pFMQwI64dTVCIMmXQ6/uBjRE9lOfCtE4/VlTQ
X-Received: by 2002:a05:600c:3152:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a027584bc4mr63811445e9.22.1790968520005;
        Fri, 02 Oct 2026 12:15:20 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:19 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 8/9] platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
Date: Sat,  3 Oct 2026 00:14:33 +0500
Message-ID: <20261002191434.58529-9-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

auth_token_store() copies the token with kmemdup(), which does not NUL
terminate it, but hp_calculate_security_buffer() and
hp_populate_security_buffer() treat it as a C string and read past the
allocation.

A lone newline (echo > auth_token) is worse: kmemdup() of 0 bytes
returns ZERO_SIZE_PTR, which passes the NULL checks, so a later
attribute write calls strlen() on address 0x10.

Use kmemdup_nul(), which allocates one extra byte for the terminator
and never returns ZERO_SIZE_PTR.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index f0eb5c445..19f0f9f16 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -316,7 +316,7 @@ static ssize_t auth_token_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current auth token */
-	bioscfg_drv.spm_data.auth_token = kmemdup(buf, length, GFP_KERNEL);
+	bioscfg_drv.spm_data.auth_token = kmemdup_nul(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.auth_token) {
 		ret = -ENOMEM;
 		goto exit_token;
-- 
2.43.0

