Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597745;
	b=YjHUM6gXSbAqp0PB9wmyMW7qPPdxQPOzS53PYuWwTkEvRWcm6IuTzwracz/oTe+BuAwP
	 83bRKrKerPf1JGBh1VyJB7qSByTvys4xQ3WkNwLjAeIpCS9gtiahhR+fEf22ZT3nGNYyp
	 IJk56c1Ms84/so5jrg2VT5Ot/HFFKMes/HTdpGBkIooZU6pRA7Uw/tpsxDEhv1DpgGrY8
	 kQQGUKk1AIZd5N+L8LS0qLBN88yPbFYaI7qys9ww8vYG0Hn9Uw500D4dggA6+QOTaw2rN
	 u9CuKooU1/xbwN1LXPdYbT8y6Sgvyvy7IDuMRZ0ZZHUL0iBl/x0Yhm7+kE3lkB7Hjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
	b=XrcJE716IYKjLMZNKMCuyRghp05Srv05SS+l3702ZZSG4A95zoezgTjEiYJRDOBg9AbC
	 CETxEzzYyRjgdPuknRw6JpQiqESpsU4/EqSi3ch6XYT/KL2vPGx3CrCVyzMluPu4mUV3l
	 M1Mi3plYWdGR/kobspUVPkSGeqdxEg70VgaIYPx06VTg6hfeiL0twhUDCwKN494DZwCPT
	 UOHFvdAJ+JiICVDzIv5c8tURcvvbQ83b6AC4eo6ox7ApiJCAQtupY6bu5FsCiVT8so1Rf
	 5jkH5NJhxmJpx/j8dt3VCWOFR4hUNqrMzAyBpcVpRMUi72TaM2EovIA8lonkbKmv5hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A4N/QRYq";
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8C606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB8C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4N/QRYq
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eafb65e204so678568e0c.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597744; x=1794202544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
        b=A4N/QRYqxlmQUQM5NgraP6GtrDSTm5Or9yyQBbLE1y0EFL5fmfZFmL4XAsqgixxqOU
         Ix6w/+ya8D//KuqhA6Fc/4MG5fWXv+bW3mclul2wBczLziXY9BulzeqVH/OfhGUxPdWH
         JiKpz+q2gzRVgT6i46fwaVTrMOVxcUkksWXdq4XfRR7Wi1k5o9aXp7lzUKjZ0/WUTIQn
         h1J82d8SRY+jnFXgIywW1GX6Nh7Z3+6j3Dov7SioaLQ0ayeMPzoTQlUrMWtCQR9eQWb8
         kfZ0oDCAjcaqlQ7mhR/CUM7tRK78EtxJSV9FhpxGkdU1KHjrXUASil3wFLk09Z/oLSOe
         XWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597744; x=1794202544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDM85Bt0G9740LbOXzzdtljiTuHAbG1Qc7sd7beOOUU=;
        b=p8zYUKx91rvkL/6+cZXUzBmf69CKLMVrzi8f6Zu6niQm/6+74sBbz/pOpdFHwTB/cG
         9x/CuuV8lbxnJ445QHRJ2Z17ilXxgJU8WdC+w0x1DdRhutyn/ZRJlXLrF1ERUEZ67o6H
         w/T8wSyunSpgUCW5RK4TZqeqydXJiv/Bj4glOHO/pSIf1nH/erQnbhjVqNfwzsWvBNtY
         nAcMKSfXLRY/2KUirpAmowgqz8o/tiEGGg5+aYBoZ/XGtW35gOSa3B/eMSzXQn3YClcc
         6aTqRqzdb1MDZg6cvjjSrwcR7snW1D6eHPR/MMKHHS09s89XeFVg2RTgVB9RS7fzPbVY
         ZMvg==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZyNQvRRlyfm3cCFE9Mx1krjssjeci2dVhgDtrakOtj6jx4oIChjxQ1N5i4ZpOKp9/meF1z1HgM1zzwBwt7KkGUjI@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ywtd83EAgH1v0n3Jm6XIMGYHLJniwC1kQg6aTyqMjWbay4+tl
	nJK9uQ+Q5vGAe3H9gHDPHbRP+jH9m1/1R+OggziowUu21agxkuhz9Pjg
X-Gm-Gg: AYBFou0HQllMzjsUv5rYvrr7oQV9yT/D4kATDtwGHE/XTvFOLfWzm/tkA9pBrbglIC7
	8plxKdSs7j3brpN89yuPRkkxKCBWyPx4TQJ6Xfb/JrV4bXlTopJ2IEMXnKCtmnilGyczgTGpyOl
	rvdbY3+VmRVXXWDYersgOHUuyjnw6cgIy921emcxVVk/iEwW2w5orD7Y1LjImVWTQInKOoWUKEz
	D14njGErNPLGtAuCmnLNIgYGP4sZ9eYC0PNC9fhVrQLT4r137rzUkzRTK/FCkOqism65k/iN4d0
	BPgCjQ573vAV9BXL6SMUDP8Hvvef6anNoIxuzoMEANh+QN+AtYs+QnpPldtBufg37aK4JzxTN94
	ilTSRz1QaB47JOTEHmFGMSh150q+m0TRsKzx7wkMq97hbjQ5dgrTWrEBnvmEO7yLxAKTtDQiYcD
	iPb2/Lo9vKGGuE/ZPghwqmx/PSt6RmwPxALUJfAxYWhjz3s90Aiy0cFZ7lQunzvWxLK9e6BfDjZ
	tQa8NWiuDxjzc5n6RdK7saHmp1O8XFTeuUXzej72//roDLYdRazPeaFAmbHH4UY3rrXHddjs3KO
	WzxLUKgw0JlMK3hhkfJB7+/GRMnnl2xalHXH5A==
X-Received: by 2002:a05:6122:310b:b0:5ea:cd4f:8494 with SMTP id 71dfb90a1353d-5ec6897bcc7mr3560315e0c.16.1793597743759;
        Sun, 01 Nov 2026 21:35:43 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:72cc:e44:b5d6:98cb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c4cbabsm9395668e0c.11.2026.11.01.21.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:35:42 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Fix S2D message ID on Rembrandt
Date: Mon,  2 Nov 2026 02:35:02 -0300
Message-ID: <20261102053503.102598-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 382fe403dc31 ("platform/x86/amd/pmc: Add STB support for AMD
Desktop variants") added S2D message ID 0x9B for Granite Ridge (family
1Ah, model 44h), but only checks the model. Rembrandt is family 19h,
model 44h and goes through the same AMD_CPU_ID_YC case, so it sends 0x9B
instead of 0xBE. The firmware then reports a telemetry size of 1 instead
of 0x100000 and amd_stb_s2d_init() fails with -EIO.

amd_stb_update_args() already checks for Zen 5 before using the Granite
Ridge registers. Do the same for the message ID.

Fixes: 382fe403dc31 ("platform/x86/amd/pmc: Add STB support for AMD Desktop variants")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Tested on a Lenovo IdeaPad Slim 3 15ARP10 (Ryzen 7 7735HS), with this
    driver built out of tree for a 7.0 kernel. The size query returns 1 with
    0x9B and 0x100000 with 0xBE. This laptop's firmware then reports S2D
    address 0, so init still ends in -ENXIO here and I couldn't test an
    actual STB dump.
    
    Based on v7.4-rc1. Found in my own boot logs.

 drivers/platform/x86/amd/pmc/mp1_stb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 8a33e75b71c3..af9ecec532f0 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -266,7 +266,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		if (boot_cpu_data.x86_model == 0x44)
+		if (cpu_feature_enabled(X86_FEATURE_ZEN5) && boot_cpu_data.x86_model == 0x44)
 			dev->stb_arg.s2d_msg_id = 0x9B;
 		else
 			dev->stb_arg.s2d_msg_id = 0xBE;
-- 
2.43.0

