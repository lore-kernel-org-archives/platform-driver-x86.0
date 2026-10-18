Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575D3BFE3E
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294439; cv=none; b=b4thYQY9fcIsPEVHIL5fJZnKFHAaA4/OEVMrKRrscSAI51b5JBDqjRIq6VAr0WEQwjvKXGuNX2KPg5ER+e5ghpPGrjOoLBzCGrG+568doimWjvJssWIqF+G5v9ByajGrObAPaLr8vyJCdjuASTslRS0bF9uOLwWF01bh05aFjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294439; c=relaxed/simple;
	bh=iVbohgY+rmCUkvsLlybYzGH5dGh+hT2gpULT/kkoPak=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OqjfTswSeo3roR2LeuEb/dTzNLSkgiaskKmqmMebMG6ZTat5b+6xMtm13psjYRtcDWaPhzbySB+UNFlFLvQ0WQuMr//u0n2vWsa6mVOiNcQOmoVOOxBlykZJ0U6hcan77HG0uO8iNgSdb35wwuSPqd+AnHKeTY5o2+WcALSh9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWx3gb9i; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWx3gb9i"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b55859245so18609016d6.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294436; x=1792899236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0T1mzJG9BohDm53AyHgfyQvkB4J+HKUMcwN4frFX8Q=;
        b=jWx3gb9iDI7aNvOQzqcvrzi5EwXlVAKxhTFtwVEx1kKgPh7C2CtobtwCNEAZo4ee6M
         bUvUDWTijPbZYPMoY3gNPNTGAWVdpnorFzhz//TfhMCs4j7E1nI6ODIJx+McXhaijHcr
         kO2TZfS8XgTtqTi4ZqkNkO/caLn6xcySxBMUtqNLEZS/Yos1D5eN334BueXXK9Kb4sKT
         OXk0ENqmcnDzd0ei/vni62Ml0ZamYCWGRhoP/ThY26DL4N7OfxsScJr3Hq5X/OxhGV/z
         nQZuOE11Ia0E0o5inRChIhMzA/ougpnks0qSDVDXNjZ0xawOcmxuDP7Ts96JYO6Te5Eh
         4nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294436; x=1792899236;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0T1mzJG9BohDm53AyHgfyQvkB4J+HKUMcwN4frFX8Q=;
        b=TlZf+z+GQGdMlYtwAhVePP+1nq2eJ7NELjGAOwykcQ4fnBlEeB19OGFoGaoQL7V5hj
         S5IVWWWjC7aykZj0ovGLjMieqKwd12NoxlwZIxljjUelthUmiM1a/ASNdKbSyVNXRvF1
         oES4KDEx+N0BYyCuNsqIy1yJlXSEowNDqPIID2uTDibk0LqmEEH+7+n3ZXjWyzzuxuSg
         3phdMGSKt5VYRnMSFjQvQJJMjzIKTibVVsPe71zqaxCNFW3RTVB7gztaQfg/K9SlREKh
         cPi764qZp8h/Vrmbxoalc4yT9xxR9rFlkdwLrQHiGDreTXtYam/wdiouMBgzPzKMkpDS
         dDAg==
X-Gm-Message-State: AFq9FYJm82eHju9m4x9jYXJqmwoGNS3DhYzXMOfU0JI5t4zCs7H3seZw
	LNUd4Yo1C8uXKNYhF91xuNZKhKzVA0IbKYsqpbOml0W7fMHoH7y0G2c=
X-Gm-Gg: AYBFou1CXCpbkzYqODQdkUfoeuzPyMV8/+QqeI8cvetySs8X8mjMAck1m4rH+OFhIDI
	5pII13BrHo6uLVNtQIRQjlVI9wGPLRxlr3R73oQaz1LPzhIR19oU5933QNq7vqa1y/z0OtUIqEK
	UAegNC6dvroIJUKRY7FhPErS+/2aBqHihB/u/LDvkN3NdgDYyUJxw+07LBJjFnuUMB2T0+oO1ZO
	P9bh1oVDCrAIj/C1GjNktoIj2+UIwpOwHewaZPz/FpTlwwTRwDi+3a20X8xOqzKcJgYJQhWRE2S
	UpJeehIKyx7LB/dg0CSYTjepOGd4RMYT1SsdFKt8LVkUSMRWOkQVdaqNZT8E9p9mxH0d1FSCjRV
	C+diiyanpjEhBLH9pW5jhanwL9xajwTFc+e2PtSHxqybu6JIk4j5RD1hMp8c5yG2mH24fqUHWwY
	hHaNoBp6teY55yNW3tPdnPKYroB1Iwy3aPZNNCtD8YATU9X3z/A7pnlZbZMShPW1QvbElXrmiel
	fdx/b5rb0EhLclCyukqM3jowh6rBuJZ3UTaKRG/DGACKjubhArHlaCamNQqQ0CQEHJ5wQxFPLdS
	rFNHKi1oag8nfB4fVY0YokV4Notz
X-Received: by 2002:a05:6214:4521:b0:91b:5d39:e144 with SMTP id 6a1803df08f44-91bdf6392e9mr71140146d6.57.1792294435926;
        Sat, 17 Oct 2026 20:33:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62831896d6.10.2026.10.17.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:33:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform/x86: gpd pocket fan: Cancel work before releasing GPIOs
Date: Sat, 17 Oct 2026 23:33:53 -0400
Message-ID: <179229442299.3956787.17526066623947466315.gpd-pocket-fan@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan worker changes the direction of both GPIOs and schedules its
next run. Its managed cancellation action is registered before the GPIOs
are acquired, so devres releases the GPIOs before cancelling the work. A
running worker can therefore change a GPIO after the driver has released
it.

Register the work cancellation action after both GPIO acquisitions. This
makes devres cancel and drain the worker before releasing either GPIO.
No work has been queued yet if GPIO acquisition or action registration
fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: b82a7b018b93 ("platform/x86: gpd pocket fan: Clean-up by using managed work init")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index c923673..ced9379 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -153,10 +153,6 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fan->dev = &pdev->dev;
-	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
-					   gpd_pocket_fan_worker);
-	if (ret)
-		return ret;
 
 	/* Note this returns a "weak" reference which we don't need to free */
 	fan->dts0 = thermal_zone_get_zone_by_name("soc_dts0");
@@ -175,6 +171,11 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(fan->gpio1))
 		return PTR_ERR(fan->gpio1);
 
+	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
+					   gpd_pocket_fan_worker);
+	if (ret)
+		return ret;
+
 	gpd_pocket_fan_force_update(fan);
 
 	platform_set_drvdata(pdev, fan);
