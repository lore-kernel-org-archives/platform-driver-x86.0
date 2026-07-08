Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449934D911
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481232; cv=none; b=X1wgx/vYYWq7LRsNpVVvPoCCpmVwJvZNpcLJiATYvjz0g7ySU0lZ6JQxxIe8VYcmEm0s1PvUUekHzYjO9AoMSy3mdZnijsgokDh5+7KkB2CHZU08+VxnKZYgsLuguSianKR335U3j5nWy070d5k2pYxYRcRdSrBjVS3VTEyj5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481232; c=relaxed/simple;
	bh=tiAwWhgrOF5esX/oJdX4cN/GfwZh3r2mm9x0YJ534CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orOXNNJ0Tlm6+SqKn3HPKzI6IK+qyFlnhgQcdloC4DxeMe+zKwRhAzPYlPfodg+T2c//SIqD78ZPJYw2PunhvacNx72hSelz5y0g1puOFDDcdth3SgAsk3arkv3jTuoMnPXBGziNJFraBw1fkbf6r+Hzt12QwqD/9N2ReCCzX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+VuDEXE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+VuDEXE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso2133135ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 20:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481230; x=1784086030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaRCJCTiLWyv/qBvqQIx4436rj+7nnKiJhzkqnAXxjU=;
        b=q+VuDEXEgmg2DCSmjHYcNgRPstvSWjCJRaDWi7PMBCCWnJ5zYi53nJwJiGCyedOEwx
         GZ6jW2+3P3V1TlPbOZgh+qFfRPcwp3q9vSkb1lAWICi00VAmhi/dzga4eOLDIG8Pnc4V
         k39v9gqZYUt2jERWyZ69hok0crFHOli42iE1WlwfWgLfiTpYjV4MqhCVWj7sQNBIqYNU
         IRxE0TFVM7LKVgS1iZJx+zzzQ+c/O9Jr2ZyIF2hTZj7Wn4vBIr01YJIzaf+r8QI2fbAU
         v5s6WcWi+bHUjG7PoT9Vpr5sRT5Y8YJ7x8zW0nZgB7nY9wCcOF8fqOECcAjVUIwrbwHo
         2QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481230; x=1784086030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaRCJCTiLWyv/qBvqQIx4436rj+7nnKiJhzkqnAXxjU=;
        b=jJsh5zh4cPyK5qbYDz6H/bJPVuxYW+vUs/tIf0I7qJ5+vA6UaU6ClSK8kQQQrQ8KEd
         gRGMhW5c2wU04BZh7kRHaOT6tTy3IyLqkEae3WENP0vawtMec/tqB4ZNBAe4h8//BTdC
         FEF9JaUu4ZGR5vB12890e4YdQ6jlXGESCK7JK6qcL+cU0F7JPyqfPOiRWlzMJocz0Qp/
         IOgd6t3nj8VU4vlltbShmHg2kRXkWVuJOA6oUbBwl/xWPZQVtIDNVlrwWtLEC7tDilJ4
         dM/Pw18jcUkerzXxS4NFgpo7OXMttJxlQ5r0Lu6hhJcnbWCACiFXVcg5Frbf+aIDP80B
         Cusw==
X-Forwarded-Encrypted: i=1; AHgh+RoiedV35n18UsNEolcszUHS9LtKeYi6O9aJg9QsvAM4G+M34wGfyadmgKovG5D93Nsll2wqRnLuMXfa/FXrf2RlbBHN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLdLkWDCE9VHWSB64u+kG711O9VA2mIDpgw/ZEgKLJ4hD4z/P/
	2JtB+Sjhsd8rV863AUeqAiuEuBw/UEI6mJnffgj7wyENQIhWlhwM+GY1
X-Gm-Gg: AfdE7cn69mmC75+zRJ9Xqb3ISibEHsLv+6DJm9Qx/fbhS0Eum8DMaElEe4h54kiWVgE
	h/cwfqYszuLPrrlcsPsF9f2zT3D4UEDeWdVbmeRhSE/r4L1WjQj0PZ/d1trf8j5tHTD0c0HGsM/
	K36hHZ1JtXLDWM5SDXS/YfeKCQ3pUaanT2wvxwtaCCIKpK6565qGQmMiUlZbbDcMudUYm83O1z1
	oYME6MrB/5BICscqi4q8C/DyQlu7T729vrcG2mEsfcb9Bd5oH7Crz7edPVDK5pzzFlB66oOqhJI
	GPvbopn31oydOpngQtG8Yk8Yc8u442uNEZiBXcjL8lN6hRrpxu0AlwKyoqNjAHY6arQdLNtsYai
	Hkue9TElmzhBQuWymKkayaj4mrhexQ6PJSq8Vgnb8+yk+t/2G9hr82TumoxbVIW/CaOKPyW5g+j
	Qs1hhZUV+t+s0ZsOT+Dxqq
X-Received: by 2002:a17:902:ec90:b0:2cc:89ce:2ef8 with SMTP id d9443c01a7336-2ccea5962b1mr7241585ad.40.1783481230397;
        Tue, 07 Jul 2026 20:27:10 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e5e8sm20421745ad.54.2026.07.07.20.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:27:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] platform/x86/intel/vsec: reset state before re-enumerating
Date: Wed,  8 Jul 2026 11:26:47 +0800
Message-ID: <20260708032647.712412-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change referenced by the Fixes tag split the VSEC enumeration logic
out of intel_vsec_pci_probe() and made PCIe error recovery call
intel_vsec_pci_init() directly. This avoids another pcim_enable_device()
devm action and another devm allocation during slot reset, but it also
means that error recovery reuses the priv structure allocated by probe.

On the initial probe, priv is zeroed by devm_kzalloc(), so state[],
suppliers[] and found_caps start from their initial values. During slot
reset, the existing aux devices are removed before re-enumerating, but
the reused priv still records the old devices as registered and the old
capabilities as found.

The next intel_vsec_pci_init() call can therefore short-circuit in
intel_vsec_register_device() with -EEXIST, or stop early because
found_caps already matches info->caps. The aux devices removed during
slot reset are then not recreated, leaving VSEC functionality missing
after PCIe error recovery.

Reset the VSEC registration state after removing the old aux devices and
before re-enumerating them.

Fixes: 348ccc754d89 ("platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/intel/vsec.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 3ae4557b32b4..52ac4b4460a2 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -51,6 +51,13 @@ struct vsec_priv {
 	unsigned long found_caps;
 };
 
+static void intel_vsec_reset_state(struct vsec_priv *priv)
+{
+	memset(priv->suppliers, 0, sizeof(priv->suppliers));
+	memset(priv->state, 0, sizeof(priv->state));
+	priv->found_caps = 0;
+}
+
 static const char *intel_vsec_name(enum intel_vsec_id id)
 {
 	switch (id) {
@@ -850,6 +857,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
 {
 	struct intel_vsec_device *intel_vsec_dev;
 	pci_ers_result_t status = PCI_ERS_RESULT_DISCONNECT;
+	struct vsec_priv *priv = pci_get_drvdata(pdev);
 	unsigned long index;
 
 	dev_info(&pdev->dev, "Resetting PCI slot\n");
@@ -870,6 +878,13 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
 		devm_release_action(&pdev->dev, intel_vsec_remove_aux,
 				    &intel_vsec_dev->auxdev);
 	}
+
+	/*
+	 * intel_vsec_pci_init() reuses priv. Reset the registration state
+	 * after tearing down old aux devices or the rewalk will skip them as
+	 * already registered.
+	 */
+	intel_vsec_reset_state(priv);
 	pci_restore_state(pdev);
 	intel_vsec_pci_init(pdev);
 
-- 
2.43.0

