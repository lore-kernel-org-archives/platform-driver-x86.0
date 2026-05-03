Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB226F476
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830480; cv=none; b=S/c+ScKwtBzcGa+G7ntPcjy1NQhezD98cHewAC3AKPGb9TmAEMNnbFFF7N2xR16x/dBVTVsSO/sSRm1wCyR5nvVuXiyRsRmd6yYsEtwKlYHdAWAj5wtf6E1qwfdoIlZbkmn5pmqb2dgsFgnrLTzgXu1noTZ5rXW8pbRdJ6tPrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830480; c=relaxed/simple;
	bh=5Izs4oqlAg/oLqWTsxU+lpipGMZ71nOo5k/p9Y+roEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OdoXtEr0ietXWCMpWT+EBBnyjImJk2AylwYViWJ1udIK1rMcXK8g2Osnob+imjU8E35sFNqCvsU5gnx1RGR7Jgs6zZRWrF072dI4NPtZ1+Xkd6mxpqcB+vzbMRrepcq7UupCumvTVqGeACTQsEsKh58Z/DfapVqkuEI5qhktLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMGJ0o7A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMGJ0o7A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso25854795e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 May 2026 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777830476; x=1778435276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCT3kh7x2lacjDawq7c4azvrL61Zh5Gry1KIhjeiS34=;
        b=VMGJ0o7ATVv7Svr72aKfdytpNWdAw1K7cFP0QO0KFZgSg4J6YM52vGDkqarXyt/htC
         Z7/hnCbOWjjgF6VKtQk/qYPHt05X8XMse4A1rLMqSwJvzxXiD67TN9a0ltj0PoJMqV5y
         YP3nG2fmQR92i1rlQpdDMIiwsrO/FTsN1Nit9vcZUwYMclss5or2xHFGIUxM2OJ3FkMe
         3Qgm25Tnlxg6GLJTpI5Eay2wWs0/90BCqacvemBKPai8u++/fbypmfymt/o7e56NmWSt
         iCKzg9jzSJ/NgmY71GHf5Hc0zbBTuFF46qhXeo7Y07pEH7NeCe/xGvvyUiOnLqVcfoWJ
         tAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830476; x=1778435276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCT3kh7x2lacjDawq7c4azvrL61Zh5Gry1KIhjeiS34=;
        b=PpqhY4reR2VoIPGDKRAs2iXcEMCWLXGep+W63keiqJqECKDIi5b5dE8Bx5NA6hjm1e
         rbK+R6tVqYi7yPS0BTPoiyyux/Izt7ftq8tkEuPOm/aHf9rXbui67OyAowYpxvS6XDR4
         ZlsI+0+gkHT8/ndGxb90zSKEG2CA2dC9CxTwkrvxGYJmKguXwMBmTqqeWNuLXjGEefgc
         SUxr7ClWrDO88bIzO48kc0MSAOND1rD1gpXnblsNqbx5XLa92aBpmVmqkm4P/iX6mN1S
         r/o3UFUy8KOebKm3++J0HONyS2T1/0AEWJKbQMxncimAMZfwRyOrB2YgP2gTKTMxCj3z
         EdRw==
X-Forwarded-Encrypted: i=1; AFNElJ/rjUippIFCF7J1eu+K+S70pBcLo6RONApbk4U4UewSIYIfzNYIsD0/xQ/pwEYltaYTuqj8BscInxhV86dKuRlKLd88@vger.kernel.org
X-Gm-Message-State: AOJu0YwxcmApGwU/Iz8eJvdHaWIlbc2WAYgnlmwWHltYR0E0/RN4SCyT
	oFwHrH/HjscYJt6A9zX55Mu1t83DkN81Kdbbl2ObHWywND1mG8lxvOgi
X-Gm-Gg: AeBDiesCOabQhWHJRXffdwYybDG3HHxY5o1ROJQGd5IvENcIImWDUE+v8vNZSDtq9la
	qCmvVxWPgtrp1hpr5QFcDsRrGaF16TMwrEXuf1BrU3hcDkiqil9WOmVBq/rr2d+dwtseSKP/XPV
	uBhrKRQWgwWSj53Dyaa4EHCf67EHkKOtj+zQxao4cEshKmZjmwk2aV2LZ2pH89ap0lr87v9XyHQ
	aqTYren38huZRtZxZRGmHlDmkc9uFhxwysKt7j3IU1uCu7eW3ycaX1imr2I2VmpMmapOQGWpXMj
	BaOGPefyKy0TikNNzg+QHNyeUiCbR4ZgMCCqgGW3QbICSs3/QHhlKbQojYDvuupHRZkqCtqfWWN
	lJYIafmn6H6VwqbeM09qevIImlz/LN75HNLcbiOyf55m6/9Xd6ezCBKMbQZfGVaHwTql4cUz/S3
	sTMKk8+crbKMiV9atu9E3HTFIbDdW4KFlL8PyQ47vMHxg=
X-Received: by 2002:a05:600c:4ed2:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48a98638cdcmr112152715e9.9.1777830476134;
        Sun, 03 May 2026 10:47:56 -0700 (PDT)
Received: from xyz-asus ([2a01:e11:29:8040:722:5fad:62cf:2b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm190236575e9.10.2026.05.03.10.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:47:55 -0700 (PDT)
From: Armandas Kvietkus <armundunelis@gmail.com>
To: luke@ljones.dev,
	denis.benato@linux.dev
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armandas Kvietkus <armundunelis@gmail.com>,
	fxzxaxon@outlook.com,
	Armandas Kvietkus <armandas.kvietkus@proton.me>
Subject: [PATCH] platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()
Date: Sun,  3 May 2026 19:47:52 +0200
Message-ID: <20260503174752.26288-1-armundunelis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the firmware does not support the fan curve WMI method,
asus_wmi_evaluate_method_buf() returns -ENODEV. The caller
fan_curve_check_present() already handles this gracefully by
treating it as a non-error, but fan_curve_get_factory_default()
still emits a pr_warn() before returning, producing spurious
boot noise on unsupported hardware.

Suppress the warning for -ENODEV only, consistent with how
this error is handled elsewhere in asus-wmi.c.

Reported-by: fxzxaxon@outlook.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 drivers/platform/x86/asus-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412..9b12a9e1e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3538,7 +3538,8 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
 					   FAN_CURVE_BUF_LEN);
 	if (err) {
-		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
+		if (err != -ENODEV)
+			pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 
-- 
2.54.0

