Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856818;
	b=4/2No3Q1qpoAG969/ENaVTybny+Ld/YAzs2vm2aINFwwy113HW9XbZJu+4bGKPTEDvOA
	 V+PbcNhDRrX/cs4ZUh3Sm8DdOjVwA1TwWNRO9n4NL1CNz3WmbXtRMnai2XlhSNBIwkalz
	 xFisY7P8ZNjRPGILuIQCqR1Xskx0jkxqwU/fNNxDTOWIi9+vEABgpAFWNxZGe5aZAeXD8
	 4sWt3MKa7GBo38LaLPRZ/lwtL9QBjWxon7Q6+Bwywi+oCGXZ2teIYWVA6WA/bpHmrmSjy
	 Om/rBg3fch7K92DLjUEQ9CI1P1tvckLGwXd7ZFHp3jjv5gb+qhVJRGqo7LNxqoecsWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
	b=CV097Rp1XP41a+xFfeGpbUfTZxJkD4Q4obFw9EiWH7DsuBiGnfcC8aX9314HUIiJEo9E
	 76h31T/UkCauy7I0LDBqkUNMOcVZ7m8tCL6ZVozaj1+roEd96R9UeZV2IgGfkK5MLCZqg
	 M5dX0KVa1nJWLFjlLWiIDtIJymKoDE7hkZC8Q8LtH4CIQ8YnZxKMKUbqQ7n8N0UYAL8sO
	 lpi/hHfc3h8SM106RCuHKYMEEYxScrSj7IwYx3BgGLFWmSrDPw0P30Yp2QKtgBpTjGmHg
	 A2cTJAU12hCeFm3DRd86y0dAiPLDG+0hIvUCd8SRLs8UVw8R2VHkJU9kqMvVj9VT+Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY2TjtuE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23F606A324
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 09:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D23F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY2TjtuE
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ddef424972so7046991eaf.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 01:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856817; cv=none;
        d=google.com; s=arc-20260327;
        b=QXu1UzUDRKDUrK0kwChMjIHVxeC++AB6LcGNr1UDhbY4rsQrAm9xMpCGxyFaVPVTGO
         d5jxWUFl68FTGfaur88FNLiGrIvKQ/WDjRlUdW77vcaf+DEw6h3cxIgdCwTmHXxfbtKj
         EO2Mg1pRHeCNlRkeUtKCYPxEGwSk+s6GNod3psFx2TfLF2TKVT8m+FZWwTYJghsMn9Nz
         Uc1PpF+MzOTMs0QXHgTO8cEtphKDcFJN5t3nwpKNnG7l/MN+opQdXjpo+t+wPcrEgvSl
         hYXgpcPwECi1jim/3Q7jo6UJrPXBeYnBOe4ClW5kU0tF/sdeUVdBp0M1OyYumgLXnWKN
         LQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        fh=Txbx4NA+deNrLdU+Z/97zO+oWpLyZsOU4MkmwgRU8Qw=;
        b=q/vtVgtNFYUoy3yZ9SfdPs1PHJVhAGew03mx5bqk1YG77JhpT6z0lO6KJz8ZDcAfC/
         WlFnyWTep+DIdrOxb5TcZtef6YCVbYA5ukKMvqeQq9P38A5578qstCc8ovJ5KNCjV7DU
         JesQvGQssoOEpNfbZXmMxv3Dq5ws4DcyU/8pvCPvzL5TDhAOpfpfi4G6AFv1pIG22b/f
         3vQ2sgj8dII1oH50XzehmHUHAAon2/wcWDDxufs0XbVy0TGdgmgeNRmC1l8IXt1t4WX2
         rVJfSHqa3zCy2B07p9OzyDv8/oEKRrZQp/wNtrhhcky7mVSgg72uyu+idFes9fiLOXqr
         cuIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856817; x=1796461617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        b=kY2TjtuEqvQxp7S16LVnFjkKt0amS7WrgIC3tSG8+bj57MuWbzfAo5kcj6Zpbp9dyA
         yUBxNMPN9UYF3frksTlfpCXxH/GMUghEcRNPFrrokD3mIWu+B3E9ANu7SwvCCc/mSFqU
         SbBSXfGJNLq+eHSZRhVCZ1/JzSY7cjr4zJmmiLD2GFWbSGBD14YJak+g7FtTjsx4e4vg
         QO/3TvfA5T/agkVRCb02+N9F+sGWno5OwpfNB2vzA5RAtLtgRJ/mr7rZ6wodO3cV/vhA
         n3HYkpDpPiW4FdyWKIJdHOYd1NFzd1Cjnpju7Mc6ZfPbttZSIqdK2aqeg/gEiCIUkJLy
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856817; x=1796461617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        b=GXuVqTakstajxNz6ekdmdxtYt7OcjPowluK5LTTwNIOiPew735ILaEN0LZrokBYkKC
         069P1AGbQXTDBMfNZoE2LWl1s3ImH125w6RwOEMyTMWSbaQfQhHcelHFRVPBj886lG0d
         fSpQHDz18OXs3BMGi2uxlHph9n6dZ07f18/MpWxYx8vLVoidCCU6PTLfbMZSMoOEVIO6
         W7zeSfEvJwdDyZLtuJG67IkyleShlbn4SHHgtL6f57SO6/8GFB6BoNO2MCVNufs8ZxqA
         Pe3dTOUEA/DszVwT/ac58DExGxYBCgo02+wYgrrLJJpHtViw3NVorwCjYGHj9jthdQdW
         GW5w==
X-Forwarded-Encrypted: i=1; AL+hErEqI5XzBR/JAahBU0uHlZBdKSaB3pIPAiOwlEwdZM9cDbbeR4akMV7EPIFBop3EREluwCQTcT/xaTatHg+fw5nrxt1s@vger.kernel.org
X-Gm-Message-State: APuU4Z81bhmYlx+nCvebiJTFG2U5eX+iOqbVCjhm5WlVO5hWRohPA6VE
	uJkSGSGbfFQh0NN67YmhoTes5sY8jYDZQXoSnS4udCAn0mQZQgCWfNuQ92iAU0GNqfC84kzgGSz
	9tVrOxOvFibxYfHOiLKsvxQdHjiEOf9w=
X-Gm-Gg: AZFdTZdOuo0XYh2avrhGbqh1XuC3N8ZJGtdxjYMmeO80Cy50itIoeKQ6eysT/AHdcgi
	eXNukAqS7SBjxGjwoiTlzCbyKP5Rmc/AFK7p2vO+mp9Pujtbpn8sXAKy/QQno29SKLypbf7hknU
	aa6Vo/xE4hqP5QyJL3OK406gRR5OALZCu8ckGSWQ1gNPcaLo7zf0WLeRTTOVPy5LVeF2ECE7K8X
	vOz+wxY5t7dvupgfCyhTL9kwgU1gRMKbGXRyxWotvtmtxmelPSVC6UO351kbjWQq0X7THocY846
	MyUolMukKIkhHgr4I06fTt+ZceHXvZ5TiW/ZdzVHySUncuYAVnmCACaVTdpkKFHxS94wAiyCkrL
	MRsaaVup9zB4KTov+dYa4Roc+LLeMDdWg3vSY+3Q7OKvZ2reGXL7a9rmoounY1f+uvQ==
X-Received: by 2002:a05:6820:5701:10b0:71a:e0e8:bbeb with SMTP id
 006d021491bc7-71b395bbda3mr14331243eaf.88.1795856817530; Sat, 28 Nov 2026
 01:06:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:57 -0500
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
Date: Sat, 28 Nov 2026 04:06:57 -0500
X-Gm-Features: Aa3M54qz3n1PjEY6edKCZOuxdJo2YZfh4h2Ta0eDxxyIHMwc9NfnZ3LIjDvpUJ8
Message-ID: <CA+m4KrC4-oEkg2_+_B=kn5ObqAd1ZB+f+hpe53Cmqx47LHnGDQ@mail.gmail.com>
Subject: [PATCH v2 2/2] platform: arm64: huawei-gaokun-ec: Validate the PAN
 ACK bit index
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
before checking the sentinel, so this normal path evaluates a negative
shift even though it subsequently sends a zero mask.

Initialize the one-byte mask to zero. For an actual port, accept only
indices 0 and 1, corresponding to the two connectors on the MateBook
E Go. This preserves the empty ACK and rejects invalid port indices
before contacting the EC.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index abf05e7ec..bfcf7563e 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -56,6 +56,7 @@ enum gaokun_ec_ucsi_cmd {
 	UCSI_DATA_READ,
 };

+#define GAOKUN_UCSI_NUM_PORTS	2
 #define UCSI_REG_SIZE		7

 /*
@@ -458,10 +459,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
 int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
 {
 	u8 ec_req[] = MKREQ(0x03, UCSI_REG_WRITE, 1);
-	u8 data = 1 << port_id;
+	u8 data = 0;

-	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
-		data = 0;
+	if (port_id != GAOKUN_UCSI_NO_PORT_UPDATE) {
+		if (port_id < 0 || port_id >= GAOKUN_UCSI_NUM_PORTS)
+			return -EINVAL;
+		data = BIT(port_id);
+	}

 	refill_req_byte(ec_req, &data);

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
