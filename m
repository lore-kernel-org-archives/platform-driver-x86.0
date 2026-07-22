Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC13E49ED
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 03:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692075; cv=none; b=dsgupAvnBYnNEPZMdzd4JcpIhuUHwhUd6NX4sXAF/IhLbVXS/Z/QoIqXjfs2/FpRG3oqTeXfgtQ5DyrgWZuw1obS1ablrPyguBB4Lu2eKC/IP8WD6Mfn5OVN2DqVrynF18L8eOHhG9RR8PZJV61+bgaa8SeXE9y6DO2RJpwwwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692075; c=relaxed/simple;
	bh=P6Hv58zO0C8SFrfDPOW3LbfbQsYmFqYkAj/bzxaGcdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uah9td+zSIRGHP3/u34k0EJFKZKorRUxTsCz3xi8NKPnaxml92KUfyJ5FxRa8eEOqYctu3/x/fRLifbFudyejR4ElkZeYrVl6RpnzMSV+QltOxq7G5agkjgox3/0+KV5fDc6Uf6S7zQrv66h/Je/wNFOUeCO5I46dXkrjn5n4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBuJbAvE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBuJbAvE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so86981135ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 20:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692073; x=1785296873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VamhtYveEhkvXGDCuAr6vNh7dVF6bHdExvf6KYobweQ=;
        b=rBuJbAvElX9S2dKN0qnMdA30VIRytyk56vOSdPsjnbT7HKUcQIqHZFeMJ7V6ICP2eF
         +YfghRByo0HC7nG24DjBmfO22/mMMuAInvTk8TK8/S5HDQQxXtyl4D0oruKwaO3upf6v
         +LZTUOBFtYLp1MfVVdTJWvHvPlxofvK/Awr2P8GSiykDLfoV1gxhgV9AgDBAIeXn8wEi
         WhSbvdAvvYvb4lMUT7eivjOAjaC3EnsgIV/PQA/pQyYXWu7BPfwO+IQEjxO73KqhA5WZ
         7h3iMLk+J+Mmska1slfKsPik3VFO856U8hO5dZ5X99OKDor1YvHh0CiHyN7u9mSs5ili
         lU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692073; x=1785296873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VamhtYveEhkvXGDCuAr6vNh7dVF6bHdExvf6KYobweQ=;
        b=LUixHzWhZmSug6LbesE0pTexrbH0aHiznjjCnqYi5MEoVqx0A31t4H66sY54hlluh7
         VmvYeXVTsou7D1h+6GOM6QiEK93VjjY7LZvxJPfdNGv7SoYr0XZjq8mvazkIYrMEDOsT
         42HFhVzVoLEu/wkaIaSdioTBBzplfiZa0LWqXoxdZIlUeq2NAR8DBZIIIp+OdsRirWu+
         nmJBillwleHmpAptQfNPECqwqJrgvRpZcGIP/evX48SGf/z96HHlXNG42Al2lg+L249h
         lp6bFDGUXPCM3BSqCDUEouPh75xrlc7uChSga3scTiOIm3wdDcBwVX+n5DHs87uIiwDm
         qZOg==
X-Forwarded-Encrypted: i=1; AHgh+RoAdJaKY0gaDIUi7syd57i3DzcxR+DvPEZGTirAOyuCGCPpVgqwOSd6BY+vSSsXdND06oyduzTsAXapl08Q3AM0hyq7@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbvun52iE4merW9T5vkij2kQ1/fOk6/SWAMNOCkHT4ZBRo6vV
	XK6PzgeVeGusolcQu1mQTAk98IYrkJtYsBwd7ihoU+J9wzDCkEQjKCU=
X-Gm-Gg: AR+sD13T6ywSSCXkM8PmRyth3W9Y+wFjwTfkA4t2eM3VztUpJIcS4yrMm1/i6HBFRcD
	Id+4ZosC8fqAImzLTiFF78joZ6qdF8rey+QVwa7inffjZU/cmVGiEPzNGvEWHSyt+/5whb5JCPi
	lEi/5ytoA2RpphsvrhGgz6gJSfzv9ekhqi4lgL1x1+igOYarRN287kNaZxnjLVj7ZqrOVQQnyS3
	AtdTtbLUdVsYOnxdvSsG91CPej584/0a4eT6d24FzXa8FCxOQHiTFMlNa6g4DZY7Djvpr9w1L/r
	5yh1zIv/e84/McwQxFnoO7v2C/dgwBu4F8chTh4BSTgXZ3H3EP9mBSRJiMJwsBWj2BOBwgts35f
	eMskbp8inOnCtumpnX8Wq4L934Omu1+wfA801bpuxYXRgs/O/l4jMGDpOoQCXrRZ3VFlWekeqqP
	qmmp5b01Wo8OGyOCSebyPioWjenkQ=
X-Received: by 2002:a05:6a21:7483:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3c3ad66597emr22159937637.7.1784692072890;
        Tue, 21 Jul 2026 20:47:52 -0700 (PDT)
Received: from t-rex ([2401:4900:adaa:53ec:4dd9:f3bc:714a:d631])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm6767265eec.21.2026.07.21.20.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:47:52 -0700 (PDT)
From: kr494167@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jackbb_wu@compal.com
Cc: W_Armin@gmx.de,
	superm1@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] platform/x86: dell-dw5826e: fix ACPI _DSM function index and bitmask usage
Date: Wed, 22 Jul 2026 09:17:43 +0530
Message-ID: <20260722034743.13565-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1) (value 2).

acpi_evaluate_dsm() expects a 0-based function index integer (0, 1,
2, ...), whereas acpi_check_dsm() expects a bitmask of supported
function indices (BIT(1), BIT(2), ...).

Because PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1),
acpi_evaluate_dsm() was evaluating Function Index 2 instead of Function
Index 1, while acpi_check_dsm() was checking for Function Index 1
support.

Fix this by setting PALC_DSM_FN_TRIGGER_PLDR to 1 (the function index)
and passing BIT(PALC_DSM_FN_TRIGGER_PLDR) to acpi_check_dsm().

Fixes: 1ab843135a77 ("platform/x86: dell-dw5826e: Add reset driver for DW5826e")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/platform/x86/dell/dell-dw5826e-reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
index 1ca7c3421bb5..64e6e9b1d7a0 100644
--- a/drivers/platform/x86/dell/dell-dw5826e-reset.c
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -13,7 +13,7 @@
 #include <linux/types.h>
 #include <linux/uuid.h>
 
-#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
+#define PALC_DSM_FN_TRIGGER_PLDR    1
 
 static guid_t palc_dsm_guid =
 	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
@@ -66,7 +66,7 @@ static int palc_probe(struct platform_device *pdev)
 	if (!handle)
 		return -ENODEV;
 
-	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR))
+	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))
 		return -ENODEV;
 
 	return 0;
-- 
2.55.0

