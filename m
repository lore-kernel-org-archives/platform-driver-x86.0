Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A26037754B
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407937; cv=none; b=u2fjVprAkbE1fxPXn2/OhLLRc8/BA8wGru2EX1D9sJWzzQHOqe479iUfrlWiUwNM+gaRuR92Y+H11aSwi/iUN8WhJlx8ogAsI7LKxhHpL+FvlXSH0ylhBtxzBVwv20st3asTqgt4pXapTQrQAUaDzl25Sk0h7Hq/g6odVjGc9ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407937; c=relaxed/simple;
	bh=bY5LKc3I0Jv8nZpUIEOF6lgwuy/yE4feoIlM/xShIEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IcU7MBTTFnIVl3LRGpnUYAUQ17+T5z2lV+M32D5dhoA/ycRAhs70/vqnbzX12YAqhnLTkk2d8+TepTXbVWMB9+SYqHosk+4Q3322wdYYl0wP1WTfUFU3obIAj0de9FaVRL7GvEmVf+tpr1PeGLWipbGfSVnr9d+qYdiS+vRTYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=EaP6yODx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="EaP6yODx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8478a25f268so2907853b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783407935; x=1784012735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JinMzbnW1YyIiCcwbl+3maMIpSRORpZ9ZKiJ12a6GbA=;
        b=EaP6yODx08kgproUFTtnRXilV1dE94XAnTRvYsVcD9t5ocNt4ZsrRoeRxJIBqCmTLb
         3PGJsgCMLDPfdoklquK6PnLQrdLoSnD9lrGLInB6xI7u75Epg4I6EY2zNrJhSA6Q7jsH
         j/NDBeP7Ucd6OXfKb8js3E6k1bXGEaHhU4kJs+I4S1yK3fsAOBI1j09U0E9fy6SHdplm
         ySyggBrfvb7Slw5pxesIPUgChAAx1HvupoSUKUQIHZTqCtRcT9dFfLaknFRAubZfn1L6
         /gXURG11v5Zl7b/GQGTCouhsE5S29K5UnUpHZa/w46E/AWdkXq6uVOeG1lH9fquMKNIp
         MQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407935; x=1784012735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JinMzbnW1YyIiCcwbl+3maMIpSRORpZ9ZKiJ12a6GbA=;
        b=QYjwdl1h8t0YP7rHfZA9U5zm7+TRiGkrLRKbjElAhTVKhoM1zReckkMz5lcgsZKbbc
         dfLr9B1swlZHrxmW46fXbk8+PMJ/FF+mlKdncHxXYscfKJ3JVwvbiZyrInn/bHDEHDbT
         9/g+fSaYfgu3P8D7LOyH4IIjdu3phDBvwzrNYyiWyNtsKSljUKhOYscFzZFjfW7PXwHD
         WEVoYw4oIVpBD7rgB1JPpDhQLn+ULo29mQgOBUTskGzGmBRGVbwjCPtCyBrNZBM9P+A3
         HGgYAQLhJEz2vkf6QQN/sVBUMO34zZQwUuTdEyMS+9FfiI5Z2dLUs8GtAAWx2CLjqnYG
         hxnw==
X-Forwarded-Encrypted: i=1; AHgh+RrVdn4RGRvGtd/nCjq8HwKkGSp/FYu1OYOuZ15O8q1iQmcLxo63eCWaEs4T7IFCeWFEgQCYybaucourw0GK0z2RfjRt@vger.kernel.org
X-Gm-Message-State: AOJu0YyfqWNJcEfpSU/Ye0AoQTBZN5/Sw31KKe/QCDFk/RRQuG8BTe/F
	gQ3wp/VsQsj3qTfvNFmuoArkCK0pEIGeAWWiDPttoa8+lSxGtk2ur8GwzPL0Fi7D+WE=
X-Gm-Gg: AfdE7cmz+TLEf7xMII8Us00mzq7StTHsRMV+T+Ibv0agAmWZ6BrlrOrivnAKJ04TMGw
	fSx7mwHxWBTi8tqMgUBai0PfeEOj6wUPxR+cIrkHSbFNancZsdz2f3VTv7rP4PXdKkKhgKuEU+0
	MLTpYoqBrMnGz5MFl9mO/BVfTU3L9zpP3K6gc3v4an+UrF5v5mSjEvDlxzDojzMbTbWhf+V/uq5
	PizfUnW754ycQ05x37Ab2PSEXOqIM65IIOS4wXIYpkwsu+LoXp4y5zimcoyVY9szNkHEAdzKGkt
	sv0gSOmWovpmgMO2EV+xMoiOUMxz8V+cfxqbYHx1kNs2x8i5IRPoLzERTIBVAFAb/ExmMsq91zy
	QjEtIbz6CI994vUO5sqv1rdQDknHKQ0okcjoqQGp0vJy3dw5lPFjE8GQ7YDu3qEsG67LOAIjghC
	jobkRzhOhZTJ8etLdWRjedTpw48kVuHn6ZWiVL7+4nWfv4TupRYqHpeJB25PJ1Ot0NYjcxf0KRl
	VNNMHEbGThyBwkeWivRa4bT0TrVAdELJ58925urFrE=
X-Received: by 2002:a05:6a00:2905:b0:848:2f74:d8d2 with SMTP id d2e1a72fcca58-8482f74dc63mr1607434b3a.67.1783407935320;
        Tue, 07 Jul 2026 00:05:35 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4986516b3a.28.2026.07.07.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:05:34 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: s.shravan@intel.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: int1092: Fix potential memory leak in sar_probe()
Date: Tue,  7 Jul 2026 12:35:22 +0530
Message-ID: <20260707070524.953741-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for device_mode_info in parse_package() called by
sar_get_data() is not freed in some of the error paths in sar_probe().
Fix that by adding the corresponding free in the error path.

Fixes: dcfbd31ef4bc ("platform/x86: BIOS SAR driver for Intel M.2 Modem")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
 drivers/platform/x86/intel/int1092/intel_sar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 849f7b415c1e..b27fc07c087a 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -273,13 +273,13 @@ static int sar_probe(struct platform_device *device)
 	if (sar_get_device_mode(device) != AE_OK) {
 		dev_err(&device->dev, "Failed to get device mode\n");
 		result = -EIO;
-		goto r_free;
+		goto r_sar;
 	}
 
 	result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
 	if (result) {
 		dev_err(&device->dev, "sysfs creation failed\n");
-		goto r_free;
+		goto r_sar;
 	}
 
 	if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
@@ -292,6 +292,9 @@ static int sar_probe(struct platform_device *device)
 
 r_sys:
 	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
+r_sar:
+	for (reg = 0; reg < MAX_REGULATORY; reg++)
+		kfree(context->config_data[reg].device_mode_info);
 r_free:
 	kfree(context);
 	return result;
-- 
2.43.0

