Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04791276038
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332368; cv=none; b=OZWQwL3XFxcACwzhMJ80iUO0Ex9pi4JTq2jPUfnk+hSmACL7ln9G4+zWFOQFiijCLBbx7COaRJ0wGKcIqWw2yIX1CrIX5E2E0JK4eJ2/9LzNfBOA4bGOzyYMKFwkBJrCah6NbzWZ12HJhFe/ANBcfb/hbZ21d0ntMWKglBxcDQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332368; c=relaxed/simple;
	bh=GK1SbB55IuQ87Y7Df/a+D9qlkQLTQbT9Otqq3Bdp8+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYm05c46F+dW9PbbznpsE62ARjhiF/ZTMX1K+rmjNWEfT9kxYJneLz/KNmfV1ZQh0UaYoJKgkt6g7+Yu4+A/CaNthFpm+ee4Y88XwQJzpYtN721xH11CevRBghYdPQZRJJcG7fHPgKUOtg4Ojo4Ss5YAX75gcTly7Ly6tGEbehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccb0e85312so8980625ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 20:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786332366; x=1786937166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLazUXwrZhpv/i2Hotn6S5qSVCMwZ3ZrEakPX3ozuD4=;
        b=XuaM7qdviuYCI05wbE9wg/rvZFRy1TbREVDEW01jzYiAazbkOAHzeepB2tH9O2cD70
         Mgq+LPhgHBi9t3la4ICrCS4t9s9znO9tg4jFIFFn8G7efZY6AZmyYKGwmbGvTO1M8K9b
         fu0qyAYFBN5K3pZCo2a7seNjbtoT4OCZEZIj3bm/nHN+zjBxBmpDgrJLDmuh2opKHuoi
         XDyozPSEaperBblG+81nScipuxs8vVHWOSiKHor5K04+LyYs8V2vpWWdEA/CA5u6RQWZ
         UBOXKOEpKXKYklMvzMO0ZuDENgLUhvNjlDwRT0QvT9eHlHNDJzODiPFBLtBwVmUA7QSh
         P8LQ==
X-Forwarded-Encrypted: i=1; AHgh+RpycjWoQVjIuRFEJLvVtJuPXFn02HYjiyEnrYahqnh2wu7JUzLDvRVjQpp+YCcdlPQ2IxSW9/0Cw79YVgo0fXMgnqon@vger.kernel.org
X-Gm-Message-State: AOJu0YyENMRoGQQX+AeVRcHuAk24FKKRltKqW7+JeEoaHS7FH+O/7zGx
	5/f/rQr1pRRAuznTGeQSdvW2qLG4RH3a30rSZQRBojmLJxITkThkosw9
X-Gm-Gg: AR+sD11iLGAmx/N4RlpLm5sN4z/PEtO6bcKA9NbQg4ClfUP9NdnVphceuuloM8Mfpb9
	8bL079Pw6pR+TzQhR7WeWwjB6Kpqt3pOJcPrbIzM6VeW2BhrP05wsBNzI7x9fH5rvnKzJ35dg1G
	el1ehXoBWf1896/Rywt6t4CAEYZIkfTWiPhOvJrZ0Adx+dFdsZDg1ZcauHXg8m1m68bM89Ou775
	7nFkGRXGQbJY5+c6VSjWw5ndPNyhyWtkOCXw19KMAEPAUXhnhyqNl91GQXn5si5Qt0ecljiDePd
	ITy35IgUbOTdY5bKypUOSw3/xTfI1zqlBNq1A0YUB2uHbePaidyM48vXhsIcnAe7jHOMNh9mdfR
	cSKWUyyWu/78vkcnNXN9tqriQVgVTbvIB1hcgcL2Y6WPF3xIhxWAuWWAFJYJUJbjs5OH9NmQTEu
	dmwOmwc7KBxzk1gV3VLYhiWPRK4ckv3h52PGresRiKSe1tzn1f9A8vOTb3RTJWrD4vgmqPw7EIj
	MuEJpxP9aF7xBn7FL/g
X-Received: by 2002:a05:6a21:99a3:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3cbce751791mr18017086637.12.1786332366349;
        Sun, 09 Aug 2026 20:26:06 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f371f4fsm3102981a12.24.2026.08.09.20.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 20:26:06 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: pratap.nirujogi@amd.com,
	mario.limonciello@amd.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] platform/x86: Fix NULL deref in amd_isp_probe
Date: Mon, 10 Aug 2026 11:24:50 +0800
Message-ID: <20260810032450.692844-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amd_isp_probe() uses ACPI_COMPANION() without NULL check. Add it to
prevent crash when driver_override matches a device without ACPI
companion.

Fixes: e1af6f0146d6 ("platform/x86: Update swnode graph for amd isp4")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/platform/x86/amd/amd_isp4.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0d494899502c..0026d6663c5c 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -379,6 +379,11 @@ static int amd_isp_probe(struct platform_device *pdev)
 		goto error_unregister_sw_node;
 
 	adev = ACPI_COMPANION(&pdev->dev);
+	if (!adev) {
+		ret = -ENODEV;
+		goto error_unregister_notifier;
+	}
+
 	/* initialize root amd_camera_node */
 	adev->driver_data = (void *)pinfo->swnodes[0];
 
@@ -388,6 +393,8 @@ static int amd_isp_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, isp4_platform);
 	return 0;
 
+error_unregister_notifier:
+	bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
 error_unregister_sw_node:
 	software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
 	return ret;
-- 
2.43.0

