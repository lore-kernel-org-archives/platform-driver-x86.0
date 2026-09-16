Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25799357CEB
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519588; cv=none; b=Q2yZUzZfCSM3J4MFB5MeQYe2tis7HsO3zscuUd9IFpbyQy72k/f2aBJkuxUOiaa6Lr82wonk6AHZD7SOw/x2BLAvUMetNWgqrqLWDEZSyKcoBD4uNLN8q0S2GRJEpdlec936Bux5k8Eq6T0NfTfvlzJXfqAXLaRcyil/5IHukqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519588; c=relaxed/simple;
	bh=DjjWl9UCxcW5dIspAr2nZpFDlJ5BtCju7U8vWE3VYXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBWWyxqux8UwQIXQiZrJudn6ChVJabxkWkKsjyPoA9N/S2oMc6T0gokjtvEEjcUv7f1MMYuS9/lD+ltb+BsRks8kVWBA9whHODaiw7Wxr0FHe82njmBmyiYXJ9yjQ+wLlWHku2NyPXCO4J6o2HqVxTMNKE86O4MrqxSM+mI0U/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAhHAFfk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAhHAFfk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so1581485e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 17:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519581; x=1790124381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUmiXSwhD3hvwXOFubhBLJiWD29cOMNSoetQwSyMxY4=;
        b=BAhHAFfkmi6ECPsA2wCc5WlMwIripLI+efgB7CDuTRgT0QyGSCsUW3dPxTt91foxX7
         qBdWeYZsvj+3I7zNTSUaZJLVfEAxwiXM4G7fvSH2n+Tx2iCXaloh0026m+pbW9RLPA7s
         9fBMTSAoLlJ0ETpJlEpauDJmtu16nuucGXxwnLlDL2E1BFCdXLTZjQaYXAk3JrJtlylo
         Ge6KG9pBmGytoHEf52iZDFdK/C5LgtOkVsu7v5ARzL2HLmmeyf28qnFiJuNNagQNO/+k
         /3EHRrxG0OzwuZl/UxD08YO11LLIiybW3ObvrO9PdH9I4Lu/CccSem0itKoVCDhimYjr
         gkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519581; x=1790124381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUmiXSwhD3hvwXOFubhBLJiWD29cOMNSoetQwSyMxY4=;
        b=AOyDwU9YsYdPuSA9BR0jRVGkqTHlPJVtrq9vC5IBzZDP+wQnvCHhLas9SWRJOGPEK4
         xj7smzQnM2awMAQd5gfN+CQn+00KTmCsc1+jSnu8EvCUqGD6SuO8mZTkcfkctSXgnnjU
         Jd0ri+RNALVjO3dUpRssgLTUHmDs1umHt3uqnYFK5B0maQOvx48jiHP7IkgkKYKOTBEy
         MsA/FX8D1oKS6P3BXmmU/b79bpNu1IxMRUMdEpheEL0sA8hu1OW/mNdQDOpqOBXbPXGD
         p58unjhRjZF2W5af1PkrvQP6hGlg04gtQpfg609UYwOu95fLV9EZVoTjqArriaA3oy7B
         e3cQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAC1EV5cuMuKzXnewvMpoqaOviZB45uzTgp92s0BKNj/9C2vsotCHncTHS3PFuwF4FB6i6qfmBNpHJnOrAiQOZOKPN@vger.kernel.org
X-Gm-Message-State: AFuF++lqmBKcbPv7XeNTijXusCIGOpJFc3nUEEOtIK0QVkRGmLRoK20O
	RvaBNdDFcO5IzhFFZlwqcwGJyDawPLwepCWnX1TW6sTNUM07VUB784gEewcuObcc
X-Gm-Gg: AYBFou03iZ168xvD2xELnf6Sj0hQjgm1MGo4yXGiVIF/69h7pflP2vvkgcCveC37jF7
	mkwMHBbRYrHHhdKTO5d/cPknQ5X/VcrAxhnUm9kRa4HzFKkQaMpDNpHdngvXkByTNcWVwIGtksT
	bWAHelWEUoZXvyfO2eqSuYS7CrgUo1u0isabLn8IpEVdvZsV7wfjy7wSwbWT80Cp2IFTx9yMqFm
	k/qoYyqVfp8qSo3D5xWNCEi7YPgq1IGdlERYF6fjvKHJf12V/4EWSugoht2zs4EcWozAbUjJETC
	xX5jTHQt0hK5Hit6Oe/fxxlt5mKia+hoaeDlzeFECGV3aQlYXhKRA7U3ASzNa7mRCMAoKHPgLio
	mGlyNTtZ7OMn4F/Ls7ueiJALT/UEFqGZg7SYsqCyFuCjwyoDiLrtBUaYOvXW2dJHWkchRNL2UCB
	bc7FGtqiXNTNNsbHrOvlfS2sGG1BfTceZ5uJptwXEP9blOurDUDf6kbU3DtRxUSia2yKgGcXWbT
	2idEfZBkFnUjxyamVhbpWgMAV3rsHElGIoeh90AFgzQnFuEuHyY3tZ4Kv66iw==
X-Received: by 2002:a05:600c:620d:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49eac46430amr9151835e9.2.1789519581001;
        Tue, 15 Sep 2026 17:46:21 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm2692163f8f.35.2026.09.15.17.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:46:20 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: zero the hex-string decode buffer in hp_convert_hexstr_to_str
Date: Wed, 16 Sep 2026 05:46:06 +0500
Message-ID: <20260916004606.165065-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
References: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_convert_hexstr_to_str() allocates its output buffer for the
worst-case decoded length, then fills in only as many bytes as the
input actually decodes to before shrinking the allocation down to
that length with krealloc(). Well-formed input can decode to
noticeably fewer bytes than the worst case, so the buffer is
frequently only partially written by the time it is realloc'd and
returned to the caller.

Use kzalloc() instead of kmalloc() for the initial allocation, so
any unused capacity starts out zeroed instead of holding leftover
heap contents, rather than relying on every current and future
caller and code path to fill the buffer exactly.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Applies on top of "platform/x86: hp-bioscfg: fix slab-out-of-bounds
write in hp_convert_hexstr_to_str" (the DIV_ROUND_UP sizing fix),
which Ilpo has applied to review-ilpo-next but is not yet in
mainline. Sent as its own patch rather than a v3 of that one, since
the sizing fix itself was applied as-is; this is the separate change
requested on top of it.
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index ff28db7..2dab9c0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 	*len = 0;
 	*str = NULL;
 
-	new_str = kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
+	new_str = kzalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
 	if (!new_str)
 		return -ENOMEM;
 
-- 
2.43.0

