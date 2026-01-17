Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAE2E228C
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680528; cv=none; b=dMpEWMKqkkqlU6omufjjVzuH6xhqKiZSklvELghUVcGu+qeoJGPZ6x8juXETI4oksFHno0JeE8wwOzbLCMWMWBksvOe9XF1bTrmtxcAxT65SgVliO3IgCx1Ig3e9A1c5R5YMhEWRjeqv3xpxX2DYUtDqbufxb8PZuJDBQJYLZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680528; c=relaxed/simple;
	bh=az11xVI2VI3m+GIkes3ujiFCYiSSBp8WmRmTIXATdhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfDSzp92q2PZXN6baFHpREY2nX/d1iQM3+fs54DVbOsGgpCA4oQ1dVSyWCGn11pIetpyMmmx1gcfd+O68k8vzFD7EG+97Q6tdXUrYuO06qDCr8umVlqnBCcsxrtzCiee7mmXE2hnuQMh9QH7cUZUfhKmlUzEiTXBoQ4Z4sNLep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kner3qMm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kner3qMm"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-383247376a4so27248961fa.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768680513; x=1769285313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RbTl2no563I1t5iVCBq06N85An7LSNG5Mo6eMjPjXY=;
        b=kner3qMmnl7w7WsIQ+Kz3NG7MILWPUlZJacjj+cN8VDNQzUPHmUWbonRLyr+XwsGfG
         aro3dw4uY84oQhomAtuhI3RK9JAO+Ug+n4Te82GDpI/k5OXVSn9Fqozpfz3Jw2ww2voS
         kqqM5a8n5UqpohH+WPluhCc0MIElJU5EOP3DSsHvTYCIYpO112+sfo3c07t7GdDpU0s7
         aADKXYXhQuEoBc4CAxDl00TDQm0ijgcqmD7/syAYRPYGVgL5QS112VgwjvS7KdrnU8Ow
         gPZMSRM2kmOCSo6BAQRkWGvC4uPWu+YFuo6VU1IfncWDd+vq9dK7UgIp1lry9WYxlf9u
         eTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680513; x=1769285313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RbTl2no563I1t5iVCBq06N85An7LSNG5Mo6eMjPjXY=;
        b=uos3hHl30S1bHW6jNIYeua6vPXD6o6FOORQo+vJ9OgtrPuVfAC1JCbt/W32vDEcAHC
         gBZYbrmo6WHLZvGcANRg+Cw2QjegrAmFZIP8btZo8l5KijMHdpYrZ6iPsDxkqBkMFC+S
         n/NZZVZ8LWHE/shLNjMbanyFdoeX8aM7gbBzMz17WG7xUiWR2+lTdAmrioDkfIbCNK3n
         yqS73+QO2pBYDySC1pZIFetp7bTItbgRPc2QcMfxpqxQqJ41PGzJFqi3svKfT1gfdAvo
         t0xE931f2nCf8x28IgcIk6ZiF5vaNk5/yEvc+aAMBFDYgmuGQnUxKfrxkPdMVgRR5omj
         WnUg==
X-Gm-Message-State: AOJu0YyCj53SGOhE0CZEtWxfXAYKkZ3BUvuvz4sv5+JhgIZlVNXhmrQw
	uHV45pb8g3HxboieZn476NowckejcDmYmRovtq3aYsixxzwJc4QjhCibkj9DEP5W
X-Gm-Gg: AY/fxX7QziaCd70kw2vO1BYW6MO2PE2k8KQ0JmaletTpSj1NwCcLz8Uv3IAWJptX3I9
	zpEaHUIBqkh8SKJNy5D4T1Mh6/YzprRg+DpEGiq22IZtGc+OgV70iUiw92pBMrc57wRaBxw2Dps
	yq/EdWOiZGCZdiqaHn2mX+dr+ypInIpln05Ume1Kc7L0dUWdgm8W3wOLbJ6AN+CdHKrzNp6yqow
	Y77wv0ieC2pIQfoEPfSpeKstD+RIcXv1GAX0JjBKzs+5mIvkAFUVYtJHl8HcdmGJ1YIT7itXPhM
	jkbH00m12npKolcGn6UBvIbJW5UBZB0lwdnhlcr9q5R8jTRelQEcSGnfmF7QxxQFg4tx5gb2oEF
	VFd6sv5YwYA2/orY4gY43yiD25DVHpdlPiWJ9bIZefZOOn9pF4nT843fTlw+saNTOYS50jN0J9G
	tP0iI=
X-Received: by 2002:a05:651c:991:b0:37b:ab43:8958 with SMTP id 38308e7fff4ca-383866fcdb1mr18469351fa.16.1768680513132;
        Sat, 17 Jan 2026 12:08:33 -0800 (PST)
Received: from gl-laptop.flowwow.loc ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb94f6sm19114571fa.49.2026.01.17.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:08:32 -0800 (PST)
From: Alexey Zagorodnikov <xglooom@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Alexey Zagorodnikov <xglooom@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] platform/x86/amd/pmf: Introduce option to disable Smart PC function in PMF
Date: Sun, 18 Jan 2026 01:08:11 +0500
Message-ID: <20260117200819.12383-2-xglooom@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117200819.12383-1-xglooom@gmail.com>
References: <20260117200819.12383-1-xglooom@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8fc293c9c5380..00a4fc899c727 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -53,6 +53,11 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+/* Force to disable Smart PC Solution */
+static bool disable_smart_pc;
+module_param(disable_smart_pc, bool, 0444);
+MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	amd_pmf_init_smart_pc(dev);
-	if (dev->smart_pc_enabled) {
-		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
-		/* If Smart PC is enabled, no need to check for other features */
-		return;
+	if (disable_smart_pc) {
+		dev->smart_pc_enabled = false;
+	} else {
+		amd_pmf_init_smart_pc(dev);
+		if (dev->smart_pc_enabled) {
+			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
+			/* If Smart PC is enabled, no need to check for other features */
+			return;
+		}
 	}
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
-- 
2.52.0

