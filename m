Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD23B3BE1
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015517; cv=none; b=lgnGKAipSWU0F9x50tdCbBcIZYnRf2WScF9RjoOmxP7kntL/SRhKeuHaPtUfjFH33xT6nSxJZfCETNtJXdNpcqj45D/jQO1+H4iI8kC0uDJDXsUCFV+yZzxXG6fEOE16KXuRHXO+haXvf3diAB8w5Cv+Azg8kTlSOfgoyEXvV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015517; c=relaxed/simple;
	bh=n/+GTYvLUZZ9pA5+4U9usoGSvJ8enP8PsX95i44Jayw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seQ/jXFxT8iV8oADbHfc02wxjEGzj4wHMK6pDCTaGmyeviCduMIctt9CH92JsBKA86VnQB3K8CbZVyBY/TvYn8EjaUVq8QmQ30k7vNqS1OubDkP7U/ftVvLHVttaMyuI9Oda5Lb73XMjfkY0kShlo1mYMv19DbgVh6cLUhr44Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYHwSVET; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYHwSVET"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so3648430a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015515; x=1789620315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xagfVfFsWbuH9k8xQPhdcSwtP7FeIrzvWmgH85ROu0g=;
        b=DYHwSVETGxzi/X+Bu95tNjJQk81goQVCKezkFTp74u4Ggf9D524rKFNl/oemFeDEw8
         t17kP/o3C11tcDOIXXVhyP10ugJWFbDCPgDxIM+KU2v54kb4VUaGIMXCvhNWq0RWcwWO
         +acpYbBaZGP8IgCZ4qIIgwxuidxkJcwFtMdeASKJWGm4xPBi4+CpDIcPDxXHPka5FBde
         Bu61DpLwAuA0v4xtixawIhIqfLBTcjxdwf4MPQ0RJi+qNQEWi9wytsHsyenr79Ead8D+
         us/q9Fwt0cLy0tUJ0Q7ZeESGt8d6dSL8+tJy9eZ4AIBoQYH5++CNDk/BcZqLWeLUOaF6
         jrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015515; x=1789620315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xagfVfFsWbuH9k8xQPhdcSwtP7FeIrzvWmgH85ROu0g=;
        b=PAeB8i6mySYfRjtoBini9jMwQPjYlzLHuvbAq+p/AGtjx6jEc3BSj5W4BilBOSkIQk
         0ev1ibWads3tuz2iCTWNTp3f9mSETpL9D/1Y6baMyN3fDN1Mo+ayXPbL5kXlElnQdELc
         jXxIA5RnEGfQoeVBpl/+AQfaTor3rHYfgvA9Wu5KDqSI097ZjOVnvL17ZhNXiBqAqsyE
         mFDNP/FPv82YGQY+73nJwaO11dYcxxw3N1N0xADz0m8RGbpbFwDgTevkn3sT4r7o7uaG
         XLzHNl+CSVncjNz4bOKbjqEOjgf0G4xJ2L0UZKG00ZBEFEXes2Rm4aPmrWRsxnGvZo/d
         vgXw==
X-Forwarded-Encrypted: i=1; AKwUvBw8prrKwXYTkPuwOQS8zwht89lRluzrQbSG4ir52DXaTI2kJGqAv+zGFhvK9rMYMUiHuYkrANpqkDcV2fobgzc47kJO@vger.kernel.org
X-Gm-Message-State: AFuF++mawX6pO74Kx7t9Li+Cc5Z3WhUGNadLiAgQDxHhvas6uSvfFqpZ
	aME7DUrl29BVlZVtpy2hGjmD3fS7VuEkdHe1NWCL14zSR+BEPMwiTbqn
X-Gm-Gg: AYBFou2DdHl2zelZRUDwshc1llyzy99V08R7WJUe8n3xAMujtwgIpakHidINc1BnTMA
	Sbh//7xU6K7Nm8pSciMZbzdumKTByi8t3SRwzmAElnrcSkSGzyYNauQJG4rKEZhOYz6R4NX1HbB
	x3B+qKEXG+R2jMr5zptAfyIpVhRUDGD2ONTaowmytSg+AwbdKS8ISg40MUL/7GK+LO8MP9g2evW
	+AFVXfhN2TA0q/VJKRdZr8IH3c+QEJAlMGe9bHQUMT+BHUdYXXrwa8XPLJGWmhDzcUuqt1aKCSD
	Mj/xK7m6tcuPp44j7LmG8Cz6xxXx8qJhq/ady6L9hCjTQHwy9qFJj4rGtC3N8vADf5dR8OboRKM
	MnwvbKs1fWsMZ6r5yP6mlLPzGWDWSp6Lqvt3YKOeW9EkubqqyoqPJ0sc/XXhNcPTJcqOs2Z5GM/
	mlgnnDUHAoTyk0h0tKRRi07tlCbVyhluTtWB5Jkn6IbRb4o3bspKC6GVcK+B7KWlRxduQ4V8nq8
	3VtgbBpOwFMqJ3Bt+oh+2jS/Q==
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr50676984a91.8.1789015515410;
        Wed, 09 Sep 2026 21:45:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] platform/x86: msi-laptop: Fix typo in struct quirk_entry comment
Date: Thu, 10 Sep 2026 10:14:40 +0530
Message-ID: <2b5e16441db21479603772f0af0b47a1502e4667.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "cann't" to "can't".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/msi-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index ddef6b78d2fa..0a0c756a5598 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -117,7 +117,7 @@ struct quirk_entry {
 	 * Wlan/Bluetooth/3G, those netbook will load the SCM (windows app) to
 	 * disable the original Wlan/Bluetooth control by BIOS when user press
 	 * fn key, then control Wlan/Bluetooth/3G by SCM (software control by
-	 * OS). Without SCM, user cann't on/off 3G module on those 3G netbook.
+	 * OS). Without SCM, user can't on/off 3G module on those 3G netbook.
 	 * On Linux, msi-laptop driver will do the same thing to disable the
 	 * original BIOS control, then might need use HAL or other userland
 	 * application to do the software control that simulate with SCM.
-- 
2.48.1

