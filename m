Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C553E9580
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383005; cv=none; b=heSq3EJ5VT7Ah53er93bXyLVatM+BofEsu8MdveP9sxavqMwfa7ordn+nxkcWwOba/PDXN2fN14VLHk1gzF+QiU4v1CDiNJeblrE42PlRbVoqUxrqr1zCkdVIhUp3tQR4Xspk26kzBrij7QClkk0tXhRIXekD8KUxTv6mOHUSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383005; c=relaxed/simple;
	bh=HCyWfdZphcYau0fYYUAqLOKget0oXna5JKrdT18pOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGgC/6biWrMmXhOiuXMvlI1cXt05tF5fn7vOmGKQFr9suqGa1tyXoC61FbUDTHWcJ/V927HOpjnE7a2TuLDxym9c4EVIJbclpY1KUR5Kx5Hlc68CzXYWm332j/MSY16NmgHvGnZDVHjkrltTgNlLcaviq6tC2APgL/IASPuEwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWsA/kdV; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWsA/kdV"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b381337e1fso1114248b6e.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382999; x=1788987799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pab9MovL5V6IqQA5mU5VDCmIqD2b0v4m2h5+1m/xuv4=;
        b=YWsA/kdVORQBYjgDdMj1Ma27h0zb35UBuoQfg9NJqeKgbCsWOV5uLZ+/hunbqgmBdK
         yQGR98oC4UXZZaydpEfvYAIvGV38Pvoa9xsaAi21hFSSHK6hLIOztLyTXVBLhBslYXYo
         NJkFhFelx6kNzWRc22H0M6GzO8K9/lHMgNeZUlUpSllOZWUToks0/gCfEBHucdffuT/8
         CWrHGOk8YxiyUfl5LH7HpD6p8Z4sXZlZJ7oURuWC0lkeiQJXBrMCSA74HGynA2UbBqp2
         Mrypk/v/hswgkesWB39mLow9wfm8WtvcVVkyf3StXM1xoqBj1819lien5LkzZt6MhK56
         WxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382999; x=1788987799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pab9MovL5V6IqQA5mU5VDCmIqD2b0v4m2h5+1m/xuv4=;
        b=ZSOqb6FKAxiQYFgOpO31pTTAhMA10f8uwjpP5c/Dw/b8NAYC8p3AO4kC9pN6dqJexx
         vyyTjivwuu9JmBY3ITW8Ap6AirmEf7ou+fDnyq5E57izS1kkMZOwvQrMkzNOTB/4IsGh
         W2uSEDqkmbzWK1fM+jzWzf/cSl3Rr1GTi2UzNw95yK4+eRKtri1KpREIzcKXoga5ZS/n
         /8rG3hBON7oKG5Ev6hZMShsocRC9FBoQ67L0U2g2jzCpunJ+kKcm7Ke0uO6sTfjVHgOd
         b82fsSEDP1/SRORdnEu5IHszBm1yQQ12Yy7J+3JlXNV2ti0gWRNdcVNMb0KH4uZxaszq
         DbMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2cOqHfiAdSrr9jNBKh3RWwvxhNeoHd1kKRJe/h0bs2LQjjLHt//DFvHs27qX0G1wQGTpc6qkFeTGAOcUJT0oqckji@vger.kernel.org
X-Gm-Message-State: AFuF++lJWZ5WYTqMr7KnZaA+vLgfwg4tXA7weFKbFbwmdQpF8znfyTlD
	bTLTuCn3ZXHUR5EZdkdiB+y6fsozKf4eb1wCR02AYJCJ12k1hfkFBQim
X-Gm-Gg: AR+sD11lfMe51Vgt3gBsGgqPEVbf80cJErQngwkfZcmuYnUfTStfbujjrnGxOrwF/xX
	hWrvZKRecoGUFW31ZAK1hWoBMM6f7QDQElVF6ZcOLCpsRdP3Wh81zJlo/rY9SlwtGO2CZCC+FCd
	VleAS1D0pfg6dlqi9/wfoNDE+/qsanM8TYJTIii1D8EioKJnTpu/ioDeVDHROcr151tgpY8V+7A
	eACAgPyCcqbVBxWaTPvAJGiTm5ep2l1y9CKPRjugCNSaio9JepFSFx9engG0TkR/O8H5Y3O2bKX
	AAz8nNBvsQ8OZIJb6xuVDYFZhR4EO/33RjRnT+wtqSlBQL5ZYtMR744XrvNGQ1hOiET1sh134bb
	28A1YPWoQj7TwNt473VyFdphghmp86PrgX2toI/rnAsQrWYYpPFpnwJuPoJkfexAuDk2ux/LUmx
	t/2nCVUZ0vpFDzt0YkTqdCs2OheOkIY2lCX5O/hJPc55fmEnfKgEFFjxW4lJPbpprV8E/m4d9r9
	xA=
X-Received: by 2002:a05:6820:200a:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b481039390mr5531478eaf.20.1788382998571;
        Wed, 02 Sep 2026 14:03:18 -0700 (PDT)
Received: from localhost ([2600:1702:2f06:6c0:72f2:e1f9:8fe4:eed8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm3742773eaf.2.2026.09.02.14.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:03:17 -0700 (PDT)
From: Jack Boykin <jtboykin.jb@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jack Boykin <jtboykin.jb@gmail.com>,
	stable@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: Fix power_supply refcount leak in amd_pmf_get_battery_prop()
Date: Wed,  2 Sep 2026 16:02:12 -0500
Message-ID: <20260902210217.69483-1-jtboykin.jb@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

power_supply_get_by_name() takes a reference that is only dropped on
the error path. On success it leaks, five times per policy evaluation.
Unregistering the battery later trips the use_cnt WARN_ON in
power_supply_unregister() and never frees it.

While here, return -ENODEV instead of an uninitialised 'value' when
no battery matches, and stop at the first supply found rather than
letting the last one in the table win.

Found by reading the code. Fix and changelog drafted with Claude Code
(Fable 5.1) and reviewed by hand. Compile-tested only (allmodconfig,
W=1, sparse); not run on Smart PC hardware.

Fixes: f4627dfd0e19 ("platform/x86/amd/pmf: Add support to get inputs from other subsystems")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse
Signed-off-by: Jack Boykin <jtboykin.jb@gmail.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 94355b435..ba852397c 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -199,13 +199,11 @@ static int amd_pmf_get_battery_prop(enum power_supply_property prop)
 			continue;
 
 		ret = power_supply_get_property(psy, prop, &value);
-		if (ret) {
-			power_supply_put(psy);
-			return ret;
-		}
+		power_supply_put(psy);
+		return ret ? ret : value.intval;
 	}
 
-	return value.intval;
+	return -ENODEV;
 }
 
 static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.55.0

