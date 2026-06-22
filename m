Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C24283FE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155925; cv=none; b=Uo3PuxmdfGv9brTXNAztpCjpGCwFSVzaATGukx3w4O3oky65Jz8NsCqZPAoivnW1bNUJsGnuClCb9650iIKAsnjBxCmM5+g096eG5RuRYRA4hEnCdOH7ywMEovGQYNCHuabIiOnr0s0lyF5inm7I9xyrkRLZMAJZeQ+HJomQEik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155925; c=relaxed/simple;
	bh=zvJUSJOU9MT+8hzwqsheqpR+y9cS5qFRLsMof9+iqso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axn/eAwpiT1tav3rL5FDbfItWvyw0f3t2dNz4uG0GJ6/7y/izl8X52jL+aoqvs7ldtXBYKHHvv3cQwrrjPfNJyL2LotGRpGZ7zuX73tuIFty1sESiMusPc1gRl/cM4c2qkzB0+MRpqIon+3DqDflUsYBlpxGZPxiog9l+GPcuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/eTeTlW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/eTeTlW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso606275f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782155923; x=1782760723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRfp2IfCP1t7Gy3SU0fOlIx/ZpJ1pzr/xd/DybY0z+Y=;
        b=l/eTeTlWHfWM8PDJph0xp3XcvB3O//awJic7uXiGgHTYjxJTQM82VPOBcO0eeh+oiZ
         /bxLmTm7N4IfXdshgT9nway8bvNNV5BYUwozE+SrdGZcFWQef6O77PYj9b2EFVV4SGYJ
         C1bMhPUI/ZcdqGrNKnzaKayIMJWmDzn+QeWlzfmQN4Pi/UV1nAHQVqsmiTj9Nxxzw2D+
         TxPqKVhGS6YhYcwdWKI8hGqXJQ5OQccxuuPCRaOsktNM0I4V5RGnoxKVIS0ENJ8Yi/Dr
         ri0HGg0g/o+/hN/HopRjWj2t6xIf7n13DzNjDDLuhG7HGKHcwRQgUXbLzUfLx7EzZIuj
         uXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782155923; x=1782760723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRfp2IfCP1t7Gy3SU0fOlIx/ZpJ1pzr/xd/DybY0z+Y=;
        b=aJ1cw7tfk0Ra70kayKgur81s9Sjbu68S9vxyuJCezFsdjJpHi/z7sNwJ4HoogbyJoC
         97k1q51PVjY8n7eADPfnq4nIKSuD9wIv7lryyaToqu0RJD6K/G3Sp0gogGuJ2zVL0j99
         6dJT6QM1UfP5U25GaXwoscvrXFaN4T2447nIlx1N8ft7+HK12GNwgRJqPCLHVUEh2t9Z
         Ptx2Y8hRY1CB7dKE5dBwf9wzqlHHnBXR5fL1Pj89Qqws4vDke6SM7xG078nnn7tNe8N6
         bXDURvEIdOOcb7q2V8G5V/sYsjCgXgFnSI8a2gXG+WSDuCE3sPJN0ELBjDBzXPLomq6k
         EBIQ==
X-Gm-Message-State: AOJu0Yxj4R5Ax/2w4cokUQKGuf7vucMTq2c44NwDvnqdXHmwvMwkWrCq
	+XRXXJMmeqg8r/N5of0Ziv/Gs4g7vvJkFH8M6/bEB3MiswattxSZjFPU
X-Gm-Gg: AfdE7clkCO7HHPgZfJN8CsprkrmzEGNghD1mCSTkf33EZmQy/sDnFb0owyGRORCdBuT
	ZNCF1aBh5NZDBjE4xeIcQxx7Amcw6tbuojkriCKtiGEJKszvEZx3htz97ZeWIoUYAr4F1HBJX6v
	T5LOGkzp20ZLZlvT9J3lrogtNkfDtKO55P6ePYnYUNcJJArFeWlcTIVmqF36VZ0oieqxAQxMxzR
	z2DQvOdzDl+Y71BVeMAxG8ntyJ92J1t8fTl/JqicicOM7m+Ci3q1z3kLBIcNkge2PiPNiXi8Wsc
	g0YDlxMtzlpcif7oc0rmUTeOTrSdGQ/9IQWlpPdgNLyN+z7fwM44JOx0upe37QSUnM6GlfbnsFa
	CZ1zhUF9NOdt5Kk1XrxwLhcLmWHouY4NfdNyWAJDNxcwPCK0fhJds1lsiAjMWSFUnPJ0o3yHtiJ
	VPLVVNDeTDUpk1JtYTDFe8zA==
X-Received: by 2002:adf:f6cd:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-46507102de3mr22628231f8f.11.1782155922606;
        Mon, 22 Jun 2026 12:18:42 -0700 (PDT)
Received: from user ([104.28.155.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f563dsm26255515f8f.3.2026.06.22.12.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 12:18:41 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Mon, 22 Jun 2026 22:18:38 +0300
Message-ID: <20260622191838.23187-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622190409.17268-1-yahia.a.abdrabou@gmail.com>
References: <20260622190409.17268-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Fix a use-after-free error in wmi_add_device()
where if a device_add() fails, it will forward
the error code to the caller function parse_wdg(),
which then frees wblock, but doesn't remove it From
pdev's list, thus if pdev were to call it, it will
call freed memory and result in a use-after-free

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
v3:
  - Fix corruption in v2
v2:
  -  Fix use-after-free in wmi_add_device() by using device_link_del()
 drivers/platform/wmi/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 529825dcfbfe..1afc4d12bdfb 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1268,6 +1268,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
 {
 	struct device_link *link;
+	int ret;
 
 	/*
 	 * Many aggregate WMI drivers do not use -EPROBE_DEFER when they
@@ -1282,7 +1283,11 @@ static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
 	if (!link)
 		return -EINVAL;
 
-	return device_add(&wdev->dev);
+	ret = device_add(&wdev->dev);
+
+	if (ret)
+		device_link_del(link);
+	return ret;
 }
 
 /*
-- 
2.54.0

