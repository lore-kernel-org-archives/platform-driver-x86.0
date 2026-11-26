Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676891;
	b=SWBmOJ3nusp0vwJhIlnd5pWytW3ZZ9aR15l2kQYD6tfkhI4VY8cmyQVKXlb8TRd6meJd
	 POV9EG9NSgcj/s3MJfwaiZB/4iw9VwCS3xQUWULOmAbbWmSS7+noA0KVi2fwRz0+BgAmx
	 Y/0UNfj3HUdcfrzlbGiMtaj/ze97QbMjut9wOc4ofQMLm2PDVuOsrwde7A/EOsjgyJPAq
	 ocqUSVPU2gqG5DYk7BHmSSeboK70YIF4CRAZK40VMBdKrQjo6yOF/7kNd0PB8nBGMtZz+
	 ukyk4SCVfr9ukk7aG3Pnd8JggUZ5cltXSe06eke/jmYYB6Pyh0O6QzBz/kVeJtMuxiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
	b=PFaSJIICYvp3IpOpD627XkxEEMliBkcMtFB5PnWPIAUdyto8miRSJLC+fcQxTB4JYgky
	 RF9paQBU9jvwvCSEwbJ+5PVmJX9vPl3SR1b217bFPbYg1rF6WZ/kel7aTytE+eIh1ZBPZ
	 zp0OApklFkbO2SBPsW29hiU1t4WFvCmNQwgOe/FZr0xQGDBYq5llB2lFaC1eUKVgdob2o
	 /Ae+Af84hmAxqAdAy2fLQzMKicrDhYDDphW1i/d86bxWALSGwH4CPqoqVxc+cWA0AQ3OJ
	 yCXwIUWKkl0VRkMVaqs6ZbzpgA0VYRVVO4jUSYancW9EPCaK4+jdCMp1kXy/fpuEfYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrQ69w7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6E606A323
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrQ69w7r
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-703be215729so2951717eaf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676890; cv=none;
        d=google.com; s=arc-20260327;
        b=o8e7sYLG6rIS4iq4m1KPAf56DtVhtasgeBpi0vh+91bMuu3dzZ0JQthxR2LfjWX2QY
         3HB/5Fkr+EAtf2D3RUEgkTMLWmS93zu1rXJf1h7Nl7huuq/w3vqZmC/t7N1dJEtp5Akb
         SODWRUP5uXToFuAyHgTEXQi5/Sa2zzPASCYjn47mc9m7KqxmiLHM9mPUFsftSb7yJ7Cm
         s7uQU9Gooy8DJVMQyRYDoGIJC7kGSwYOpmtET6pDYqKalij9WplgIUlvZf8SQup9VM7f
         QznFRUS1v0QrIjrkBFKlIFLNfdTimZNfkvAchAXGuxMNctm1Z5FSZZ1rzTQx3imNTwwY
         QcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        fh=cceJaiH08J8EWE9FDqz0OyJL1GoeiWBTBontEFS6Mi0=;
        b=WEX+brQarFfRyQ5HXtKt3+VAq7+UKnag4BEjQqGELKF+qZO41rzJ6DODETefQTkSfY
         ivXIJlByX/XiwuR5/3RnzXCzbtnII3pG3V9EFf4wz6qnTosm7OQvGD4d+xqokC0CmPm2
         Ws7gPy7EJPyOuyffvOeF9kjtDfK3vYqS5Ucoagc4MJGZFEAdALcuuRjcRHXEf0gEkLKG
         lJU+gSAKjwjpPQgPLQegLp+MIgnatT3FnRi88UH1acvsouQ3xv9asel0S7KPh7QFv4Dq
         21RSSsx1Jsugu5t8hCaxInnLLM0hyBVnb89btDqTP9il1nJEMts7aBL0yoR2jBNy6mLC
         DEHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676890; x=1796281690; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        b=zrQ69w7rPqzFpzwZh5MZxKFu10YqpWrixIw/XJEZoWUIJiTrXhD3GDLcMG3w9pI2jc
         1epDSR6wGqGuY0RL3Gl2vCHFjasJBUVDeLnHrlkfEd0pkLmurZZtWpnIardJVxhK801D
         XAfqyZpy1zIkE9EDyOV9OREcYkGSmVuz1hK+GuTiQMrQZj2l9h5ul6E7fU29ibwD1IlC
         OKKD/AvDs+IWje/Kt7Z1sIUtbiFlQLrSaWBCAYcDFrM6OwHRftGmc3mPj/VLlut+KfTj
         iuAI/H+x5WXQw7SoeLa+h8OQ+GJR99uyOyxPjuSXwIPIhwGvqAL+jRWUNfwCObXiEJ30
         vf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676890; x=1796281690;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        b=IuxEKrpc+sJ3bcodE3s39dcE6cIX1EGChlSyHCo1V4U+Q4yG5oX0MjaQRVYwSYHdOe
         Cyc65WlZhtJ3iTNy3YNVqOJP42nmlF6tfmHP2JIBfub6DV+orQAwU8JG2orn6ix+mNk+
         3ZkfPN+bsUNjC5q5JI+OPGn6iuVqg9oUNPk1Gk5qNi3lvmslkNT7GVUBbuo5BZ1a+ULl
         FFzRemQFGX7h1upAeA9rVFLZSL6Z/He7Fl++XGH4pamzlj8iHu4GPXzxcJUjZIHWYpTB
         AFSunpDD2eehwh7qeoKQs1kngsOAvGr+sI7240AC5JT7mFSYb3+hzD7hY8dvzKsKZ7SV
         lIBA==
X-Forwarded-Encrypted: i=1; AL+hErFWfiR3aZthSAEoiSHKDvegD8q5nfWrRa3lM7qKrzy8sRqL/WBeYb4xjZZuAm/4ybqhxuP+pFem84y21RKdnrnBmz3W@vger.kernel.org
X-Gm-Message-State: APuU4Z89T8lCZtYYv5QAD8QYOBkPy2AHket3VDyCgiUTA8EvpgpJr9xo
	3kDmOrknHSNsNtjJHYX3g/yMki0N2wn5rzNGbI7a7CPT3dQVsCYZHYwfcvkLRO8HgQeK++mN76X
	RaQPBiH01aI7zSojs3jryScE2fO5Iup4=
X-Gm-Gg: AZFdTZf8MbFMXjfXWXnN8CbjGfKnmDvAADUJuHneKvU6Lw57QZ1s0Sf2VwrKUVJtFiZ
	IsBsfU6yuJBZVeUmSpySt2vKaLtxRPHV9Gixu92HSFwSiEhhq0hTp7BKstIoZcVtAVkeKxDr9O8
	TiGVvb/9EGJi7i/uYP084unsSq41zu52frOWzNtZqQxvy/VZ2Y8rHb0Y5I2LLQMSEGZD7ILL4sV
	mVAm4I043+U33bQDVtqhH0gtfJmYEsiS3vC7+3D8jb7Uod0UZLNzJMyz4R25utcOt+B6YTWlKq8
	G4aPPMqwctlLNetMzV7Ay5TsK2XgZwAW6CWrjelRh6HgryiSnhnmmM/eXeSWj+FDiXu34BTSbxz
	pyvrqAnVvO2XufV4bfku3Wp8Hyqbk/KpJB4rhgm19LmHY6EoE2z0QHon0wXUC4jus3jtoyryMJu
	YJ7jxHz9CdaR8=
X-Received: by 2002:a05:6820:5709:10b0:71a:f119:9c1c with SMTP id
 006d021491bc7-71b3920f378mr11544663eaf.11.1795676889819; Wed, 25 Nov 2026
 23:08:09 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:08:09 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:07:41 -0600
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 01:07:32 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Date: Thu, 26 Nov 2026 02:08:09 -0500
X-Gm-Features: Aa3M54oGC8JyzC7ZHjS2hKqgJ3x0iDaaz23uGuqDSEQk8n_JxJTKR7rbcP0z74o
Message-ID: <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
Subject: [PATCH v1 2/2] platform: arm64: huawei-gaokun-ec: Validate the PAN
 ACK bit index
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
before checking the sentinel, so this normal path evaluates a negative
shift even though it subsequently sends a zero mask.

Initialize the one-byte mask to zero. For an actual port, check that
the index fits in the mask before setting its bit. This preserves the
empty ACK and rejects unrepresentable indices before contacting the EC.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index abf05e7ec..95e867596 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -458,10 +458,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
 int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
 {
 	u8 ec_req[] = MKREQ(0x03, UCSI_REG_WRITE, 1);
-	u8 data = 1 << port_id;
+	u8 data = 0;

-	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
-		data = 0;
+	if (port_id != GAOKUN_UCSI_NO_PORT_UPDATE) {
+		if (port_id < 0 || port_id >= BITS_PER_BYTE)
+			return -EINVAL;
+		data = BIT(port_id);
+	}

 	refill_req_byte(ec_req, &data);
