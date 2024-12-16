Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63A725634
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 02:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734315947; cv=none; b=l496U0TKQqTolesQkTb3SAf6ecBiZeRVIx/HTdrEpVXW+HF1WZ7j0qj1GOQ6xoCKpAcoeXUiacZynHlI7A5VJvOHGtdghYIv7jcEvPlV5vJwxjQr19jl0ZWO+DT8zstm1tmpphyjHeqWBy9bOKwJYoSKJ0FkwTrRNUP7MYoj3iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734315947; c=relaxed/simple;
	bh=sfBlyUIhL1Z755utdA7pyUXJcXfLJ4QW26XMOHj7YK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pd8yTVYncQUYe+ATXGvOHAjsTwZuipsjyeLJMMuUZRpBEtWDSlzqgzGU9hvm8u3z0thUkIsx1993m6gCHl3i+32SW5u/lKVa5tZCtBVl2A0f6mC64xegIH/1t/eSjd9iNeZWk2w0WKiGf2D0aKRxjzloZdzSlpxWi0crxEpTkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=UZfA7VkQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="UZfA7VkQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso2602442b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Dec 2024 18:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734315945; x=1734920745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AI+1I0Sd++lnFKZV72CeKKSRP2WHff7VwkqWUKHRtpQ=;
        b=UZfA7VkQBJFYwFM3hXvIi2dQPXGed67G86zWM732bhGNJxFsWaA8Av/2ZpbI5fBPxb
         opzj5aG00fnkEQnvi1DMMJJEUeU9asPcOZphk2DXTccxhMGHJsc8FGL+djH+gKiDgUrX
         Jzl3LqUSXbI6KMii7xclycKq/Ttfv4vkVOVQt94CF0jswV0O3vUkNQVMF3126T7jQ8aJ
         2RDHjslwNKjjnYqiyIs/CDaF/kX7EaK9lt/FaXwjY11dxOOS7cwvfZVCnfkYwuGjocNC
         A7241Z6lAZjiryxuORGRHJbUAhaqB1QpS1pM444+uVpL1re3WZXgk/UPYn+it7BH+KeI
         1drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734315945; x=1734920745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AI+1I0Sd++lnFKZV72CeKKSRP2WHff7VwkqWUKHRtpQ=;
        b=f78fX4bxzix+tQMc+7Dueb/FJTYwiddPFEWcXeb25SMIFzBNQgBuRt68KzDKa9jwGQ
         bcxA3OjkSSChFPv4sS/5Lxu3kr+8EaauF+7BpFp0qCR4Y3M0bMUQHpvnoyusRpcK79X+
         C8mv1UlqngBm5EAnQ7SguYhESEmF56IlW3Ii+pEmt5tIjnT4FbizrdVd31S4a+kWV015
         cSTGv99v8XBXwaalrqpZW04gT4JubCFHMbZgAKEEWzhZ2DSMSmPeuRGQnr2fZcXnGhXL
         qZ3p9uBE/zOfDKX1xMGbB/n7sses0HTI9JYghL4CkxfZLhZZiCZJ7NKpIByBleV6Lr5s
         gPSg==
X-Gm-Message-State: AOJu0Yx0XC1jQcZ2NkfciJN9e+7ltToStpO7dgMCeZStYY+kPuT4wnan
	pxD1zgv2zzq5rDMPMZOem+qkrFL7nCck8/+iatqGrl+x6s50R/P9lH3S+97Qnv0=
X-Gm-Gg: ASbGncuEc2ERWVdhaHqLMWcRNlHiE6LUui/EIhHE2m1JtpwB2ISEZNRdkQE+B3fjs8H
	L4KBf/PY0+Zb2wKXvPGWx+xb6N4OfdJHh83fH3D8odFAPnhZVm6WPj7kSbjYvSqExJKse6qxIH5
	m/u6t8I9zVObTkQivbvfno45sb7vkZpuel+Nb8SlHoBx1D+AimVUleO5WH38GREnInLpCn5cyns
	IZd9OtU+FNr7+8xX7f2bzFORbwm+AY+7A2czh4Kj2MGQz77kfmG+QrjkBaB4qj7AU1DREd3G7xz
	jUeAXRkYJZwMOJMnfbJaNgH88EllpExwEkufbCPiCBs=
X-Google-Smtp-Source: AGHT+IEtAdG5315vBEvCAToiwaXwIuCmCWshjmD1BQrgwBvILxbKQF2m5/67CdsiWmj+kkrDVg38XQ==
X-Received: by 2002:a05:6a21:9990:b0:1e1:becc:1c81 with SMTP id adf61e73a8af0-1e1dfe0001bmr16266266637.32.1734315943920;
        Sun, 15 Dec 2024 18:25:43 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c140ebsm3150726a12.58.2024.12.15.18.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 18:25:43 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: vadimp@nvidia.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] platform/x86: mlx-platform: call pci_dev_put() to balance the refcount
Date: Mon, 16 Dec 2024 11:25:38 +0900
Message-Id: <20241216022538.381209-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mlxplat_pci_fpga_device_init() calls pci_get_device() but does not
release the refcount on error path. Call pci_dev_put() on the error path
and in mlxplat_pci_fpga_device_exit() to fix this.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 02daa222fbdd ("platform: mellanox: Add initial support for PCIe based programming logic device")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/platform/x86/mlx-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 671021cd1f59..9c7f30a47f1f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6237,6 +6237,7 @@ mlxplat_pci_fpga_device_init(unsigned int device, const char *res_name, struct p
 fail_pci_request_regions:
 	pci_disable_device(pci_dev);
 fail_pci_enable_device:
+	pci_dev_put(pci_dev);
 	return err;
 }
 
@@ -6247,6 +6248,7 @@ mlxplat_pci_fpga_device_exit(struct pci_dev *pci_bridge,
 	iounmap(pci_bridge_addr);
 	pci_release_regions(pci_bridge);
 	pci_disable_device(pci_bridge);
+	pci_dev_put(pci_bridge);
 }
 
 static int
-- 
2.34.1

