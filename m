Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856818;
	b=d5r0IioXCx5owMaFjGyzBKstuCEThp0GF3Eea2NCE6+VcVuY5LBGHCDXr3k8DQw6Ji0b
	 lpRAW6iMUgMoVG/sg2KpgkxUrjP+V3eqjroybSR1z0JB5I0AzqLs4qHCaxa6F1iX5GHLp
	 EdsinhC9ysjWMpqJ6/nnSj6JLnF5mbYqeBTDdR8GKfgS+OncgPgVq7RDHgwCvEeB4tbhm
	 voBMM0Rd8zhJ16JfPq7j1z1eS0mZ5gr6d3qwdLmiz1xA2/Vc/zbVsB/DCOdSdXj7grHt4
	 b9ubALRV5oJHPXlVOnWaifp4HMfvsgz8C8UQKPin9+5pcxkZoMptG7vJNkVhXtQkfVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
	b=aWBvR90kPdIbBjNB7BBdXo4jxuX1gMYUaz97thdvzPsKOmQOHq1IflKku85bpkUW7zbB
	 PToTsRQGWX/NCkS5OnORdkR/gqtADh54woguFOKodwB1a+gOnHR7Gqnd8DwgJLnBHAk/z
	 W9ePuFO9YrSlArZojj6Tso70MeZSqqdRTwr2RB7b9sqRNn8Cz8FjvAMT1X8xmwrp3CbkP
	 MoCJbaKoAz815k2TcVxHeEo1VWhTw4aAlWvzrylBbD5V4bjyiBlIQgZQjMpEbc6Vke2xW
	 sLZiuQUgn/K5hK4UqUYIMjWukgNreCr5UQjuEqMNeygoQTD0rL8VeGfltn/OZ3cw8Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4Z+hek;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D138606A31F
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 09:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D138606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4Z+hek
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-55650fe1f0dso4913209b6e.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 01:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856817; cv=none;
        d=google.com; s=arc-20260327;
        b=MbeL6yjcN01Tmzc4juiZoYrQsWk8uWSv6QxIDRfm8rpVNUH2CJCiaLYyLaFVbjOMdi
         Il0Dx9GjPl00oR6xGSOpEtWoQ7XqzVyjsuJIT0AdgQs2sppSfTT+lc9XdcX9RHlkrJas
         faSrWrWRj2AYnsowzM77fP7nEzTVsgPpyqGkIISGwJWeAgRG1p36epXcbQhA0Q1bpWad
         Mv3D0jqYS4xlXngWp6dhwZAZO3D9EjCm0IK0tpAhHdDtdoKi6GZTNZdAP4IlmxE82nCx
         0gvyO0NbGulE9gzp7HCZfASCacFePowUV1lOac12tiUieOK5gDibh+v+vr45kFYJtlej
         CtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        fh=hslNFXwJf6Fi+iy2C5UkALJmI3UDwGPZBYv+fbLT4sc=;
        b=R29c2Dx3ybbahB8u3KnNhr04SKFNq9jYcbfT00VI2s5E7CrSZncLmBp0Ft37+32YIO
         +4jfsw/my0o9f8zw/qNLFqqD43Vt+P/XSmA8rilfpRCKUpTwMnENgDpOEwgzsghMG0TK
         HMCPkPt2ado6sQleQJNtTbGzBXoAhSf2TEZyfxZBeHsrr7GQzvfyQblP4tbT/W0Vq7wf
         hFuhJLolh73c3d1EuSckjKa3kEQt0LDXS7q5UVCzhS58wjpMKzlvcbnc8l2wk8YuZwfX
         ysEHv9TvTEXPYwVBU5efRNYPhhWfVXEq5fUguK+t7OKeErXS1MOSm3OloCPJSdPHoA0M
         CBPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856817; x=1796461617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        b=Xh4Z+heknMtsqxhaOWRk0CnR2/f2M5IDwDtGNDpFQnsnIasXTHCOgk3a/0nCsv4ryy
         NZflXtiSGt2N4Qm5s1fIMQZINfk+VcdfeSf6RYlClwjyKsTbjpDfoIPB+ZNQIenwslVn
         w5KqPpkmMy/RSMF8gPovUhePh9468dHP4BYfjFjBiVwvmMFXbKfiLlGoLH9u8UVKG0u3
         vIObSXhhjswuLK15a5uarTFz9K1fdajQ5bod93v45TSqGs5/tAMsd1yrH/hHekTSUekK
         Qt/xhfc7aUyUz19GXgyR2hcO4QIe66HwrRE4OFgdwVG+r4hJULfWKce7aiS10NbXsXiL
         hscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856817; x=1796461617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        b=qGOOD5/mtT0rdnjbT8k3vF2pIY5B/DSBzLq6iYXKzGQ1JlLyoloUZeloDjJGj1I0HY
         ZJrUc8nW8qQ7f5ROxK3+H0M/4fyUc4KaIBhbHijT4Cduap2G4ZvS3KBVtbSxvOxim0Gt
         Tv/RJUyw9TO6k5BShpf8KuYxDGuPAKWTavDTwQ6GtYdx+6MFXNMw8ieNzSKg4RISO/2C
         mdJ8OfAAzA+rkPRGet+jDJ6smmmzZN1Q7nw/F/10mQVQOf5H/40eHZqelaFEKhEQN33e
         ymaxtd3kK9RQoJUNdHMhIpZYpxZafMzb0OBEzhd8EHbfPWuigq28Ii9crQbisjYXWdeK
         fXeg==
X-Forwarded-Encrypted: i=1; AL+hErH0g0j6s0wa4u1QxYyMOdY9FHT1wYF+1K+YICDGjkWQSauT0xzRUq4H7VMrmfIWeI81FQzcGjLzzt2LnvXcgpiqW65H@vger.kernel.org
X-Gm-Message-State: APuU4Z9kLXv79njV50LoZlg4hLmH7r7VYb3GwQQEWhQMAfj9rbrkwj3G
	CKWwfXFda76We7KKivGJh+gG3jlI20UCIqLq2D23ohNJ8NNMxCfD7QvTknN44vvZrJERd4tVQb2
	9Og/hQPCRPDUdGb31vFS14bfHwOIA7Mo=
X-Gm-Gg: AZFdTZcu+7aoPSPT16Shm6xSc97JeHmK1vXFpQPzXo6DVdDrPj8vLxre6sZ01Wx/8wf
	sAi7PnThMeGG9WJijYlIt5LKhrMJdOvBHQdGcSVAIGXFbU5J3RgaIsY2UyPvYgWZj0m8mRevuL0
	DKnyyL6KBIc7AOAW+1Dhm0fpFHapWEV0D1a4OSiQ7hKmD9g9xw1Cp2rC97Qzy0nBkLMobngcwLW
	/hF9RFhiVKLcLTagJ+CegNZNNL6FWuhfGOPwCfP0GacU6vM5U2ha5Qk8YIa/GYRMGiKSpIktUsk
	1DSvwJCxSQAqMJWmCykeSShjSuQIiAMyrAzsYjyabKrfnf/z1vv0RFl64nACSeVPj0L+1sZh2fU
	2eaFcty9IrIP80pTU1FfYrgbQoBUT8imrCVi1xF+jyh9qhxb/IcFhcG4QI/qIQ8AuVQ==
X-Received: by 2002:a05:6809:8c:20b0:57e:644f:7dc0 with SMTP id
 5614622812f47-57e644f7e23mr7101887b6e.53.1795856817064; Sat, 28 Nov 2026
 01:06:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:56 -0500
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
References: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 28 Nov 2026 04:06:56 -0500
X-Gm-Features: Aa3M54p161hdYLu_o80LkaY4fJESt148cuRdHuYF5j6V7LAF57510-9zgzImjW4
Message-ID: <CA+m4KrCviR01-RnsX2RkaCUr_iXHbQjObtdiUmRfZm8ooOGWYg@mail.gmail.com>
Subject: [PATCH v2 1/2] platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

gaokun_ec_request() issues a write followed by a read. If
i2c_transfer() completes zero messages, the helper logs a transfer
error but returns zero to its caller. If it completes just the write,
the helper returns one without having received a firmware status byte.

Return -EIO for a non-negative short count. Preserve the adapter's
negative errno, the EC status on a complete transfer, and the delay
before releasing the transaction lock.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index ac21f732d..abf05e7ec 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -145,6 +145,8 @@ static int gaokun_ec_request(struct gaokun_ec *ec,
const u8 *req,
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret != ARRAY_SIZE(msgs)) {
 		dev_err(&client->dev, "I2C transfer error %d\n", ret);
+		if (ret >= 0)
+			ret = -EIO;
 		goto out_after_break;
 	}

-- 
2.53.0



On Sat, 28 Nov 2026 04:06:44 -0500, YoungJoon Lee <getfeus@gmail.com> wrote:
> These two fixes address short I2C transfers and PAN ACK mask
> construction in the Huawei MateBook E Go EC driver.
>
> Changes in v2:
> - Patch 1 is unchanged.
> - Patch 2 validates against the two physical connectors, as suggested
>   by Pengyu Luo. The no-port-update sentinel still sends a zero mask.
>
> An I2C stub and UBSan verified the empty ACK, both valid masks,
> rejection of invalid indices without an I2C transfer, and short
> transfer handling. The series builds as an arm64 Image and EC module.
>
> OpenAI Codex assisted with source inspection, regression testing and
> drafting.
>
> Lee Youngjoon (2):
>   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
>   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
>
>  drivers/platform/arm64/huawei-gaokun-ec.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
>
> base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
> --
> 2.53.0
