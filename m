Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F006418A36
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028389; cv=none; b=ePxoODQ6PcGrOkhhysVbiDA3FvjVOcPUl715//BayFES3ooUJTTWIT/lUkMtLFTJKN2LeySi/eFD88sFjEmdu5E74jydt8zuYPfzBbchfslGsuQuqnWJTD3eVLkZALr1G/mqjh1WkGVqjgPidOLiSnT6OH+5qQUwxuaI6vQKmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028389; c=relaxed/simple;
	bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alcewOZjPLrEkSKuAiaoxst1BcUG1ymNQu2eNcSUgtEIDobGqY+ubbeMxwl834bHkM2N3a01BD4mqSQMCv7A9wiEzCWwSStNypXG18EAYIGaZaYuWUdfVAS8pT4KdSylPy6dScE7uSE8Irm7EL7RkrMoRIqaeqzM4ggo/R19K+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLgmVA74; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLgmVA74"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so14460225e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028386; x=1788633186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=RLgmVA74Pv98zN79EveyDhNtzUOp0v5T8MFcoeLKODI2by1Uv5//ieDZaMkdIWZkBc
         dNS0ekod/hH9gz24uIh3S7iKuepddVBFeGC3MfUAD8YBPBTZ28GBIAy6kf+43lOwGZc+
         Ovfw+R113RTTSGc5FU+N0mLzRjtisvlRj6bPrhXKbMvzir3lHQwtcnKVAPh2ssN2pacg
         ttJJ9dKgJSTz11xjrCEXVqzIJyKoby9DAHR/RyUJ511avUibTBvnG5roVluEQ66mdo/X
         cy7zuNrflYrwUrVte17dBhrE0WhhpJBVf+02HYUAP411op2d/joClsTBbCqqj/n9j2xy
         sgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028386; x=1788633186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=h4YexsrU1g585f4HUR3sFQ/7NziFkl7y4UmduzpkCPapjni/13p5Fvc5D6MBh7vmfm
         oxyQXoE73hX6Q3inbJkGy3vNF9fleo3wXuG0RBALMUHgnvChhUpTE6dG7Cf+KpQQA94i
         LDKVt+ScvY+QBs/vRj7p8WiQj/m8h4hoMoqnKpNEmSMPbwwyxgE00Ma1GMrLCx+iI27R
         zCfs5QKf5rMx3LFlvKR8PCJqTcbPlcofxrgyrjepctUuQcTo1p7eNnJXmmZQ3hE6jihj
         s5F3LoikwwM22C84SrpNZo3ayjHkuVTYZxfPvOkb7rURnTAxzVbgkfkLMr8WmcRGY0wU
         dZCw==
X-Gm-Message-State: AFuF++nnrAhwY/pf+OzCmHwkIS/7vyEtIm6i/rFWbHhdM1depbMnk86B
	/Y/LGy6OesoqFjJE0ZVXHgBgCx1N6jix+OETK2J9D3H1oBdvJHLsv1n4
X-Gm-Gg: AR+sD135fIFMvTqIA5YN6VJsEGSqPqzNghL/SalsPTis0JPdOZoAfF5Ok16tuLCIXjm
	gZksS+pyfPAdpRTU4MY7LMJgtA4GjBDGrpoS9sBDwhdQAOKCWYdU0R94vHE+W8cPa6dZ33AoqrQ
	+VdOmhABNSRNtVKC7Lj0GvkuKHm+89KhZRGOcI/8UdnjLtvQcFX8ySxH6ANXcD4+1II9vQfu0Xs
	I9Bvd82Gj1lXHN4INptUabn3Z1f32JTJNDynUFicroGfPrIfykQFnAmyhkb4RG5FC+mexe+TRYu
	1tMP5VjeUpnCINTOm2+9V6NpWZdkAmTA8eaIqrAcEOMmRQia2cNzvu/k9FxGtOJhaGTpXJ8WV/q
	84CyusnQqZS8DCBHtVhnZ28OJGdi37G5MxrbU2odxCLhpCAV3giiGliIYxmYTiQIj4UmlxNrbdw
	I0LH+SIbpGWlVs7QJ0NXufD2CYOQl7OmSwGB8cr0/veQJJf6pywlk+Maluh0KaF3PrejwiGjiuR
	kG/MGssEU0RIq85Dt+hoQ==
X-Received: by 2002:a05:600c:4445:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49b91c2e150mr230254995e9.2.1788028386010;
        Sat, 29 Aug 2026 11:33:06 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:05 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:32:49 +0100
Subject: [PATCH 3/3] platform/surface: aggregator_registry: Add performance
 profile and fan support for Surface Pro 11
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-3-ebf5cca9d205@gmail.com>
References: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
In-Reply-To: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=918;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
 b=4GzIgkBsV2o4Fqd+QlelJ0rMSJif4w7WE+Cw4asWjQBk4+WVAGjp4y+cfRpKmA4NfW5zuez0b
 3/1hdgl7oszASD4QYnwcRTv0O6IJc+fgx9N46hF73B9Ed3yFbDaGiYn
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The EC on the Surface Pro 11 exposes the performance profile and fan
interfaces. Enable their associated drivers.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 2cb8278d98ea..061d4a567a06 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -410,7 +410,9 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
+	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_tmp_sensors,
+	&ssam_node_fan_speed,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,

-- 
2.55.0

