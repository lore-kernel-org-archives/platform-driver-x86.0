Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676809;
	b=26kONnrb/W/pnDFOLimRvihdkBUNn7Y0R7IHpWcY2aOp17riupbV6kixFyQDCDopk+gN
	 GE9wZCDtHgfisD0izYGYcOLUiCkOl7dzyV0w9wZlJT7N23a2t7I8dvhEoq4wgNghQYmQV
	 FkfHMwbVLruwIb5cb+HSPb6QHb68Cdo22B/ESQkbsBZzZXI0fAgdCBd8Fvx0SDpWUq6eQ
	 G8tadBQJYC0VrQta+0zIVoIZLb7kc3AxE4BdfkpEHjuqNylYoAhZoz7qVCO0hcDl4pQwH
	 Bk9mHrsSa7NWyOqPsTwFq1BNegmdN+z744AT53USu39lcsDNpYc013jiZc8K5BFho3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
	b=T5ZXS9yYNiIeHCbqe7SKrmDnoVrdRrnT8Rq3umF4njR1+qRYq5lz83/eOLM3hBpZ/06f
	 +73o4I9QpJ7UlpKmLvLnCdaU0kEJavoKqu29DEZZONCjeptRe6Ou55SAKee2kNqttvMFm
	 TS4ryqBXtC6z+kbNncLC0uOjRG271y4+F8Q2CCSaur3Rg3EzccwRsnY+98WQ1Qlgf/sZF
	 7v/uvhoqqq50saTEJFGdw7NHZ0EJdM+U5yLNgGwhMxS5+xTiFD8ow2HGflyXFYpZ47Reb
	 6OyQsBQgxN5La4YEvBz2zIkMXMZ8pR1hbOGrUffhFoX4AWuMyaVg7k69cVUe+jgK6rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xB7RViL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69BD606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xB7RViL0
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df7f544919so4006400eaf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676808; cv=none;
        d=google.com; s=arc-20260327;
        b=mxh+gPFax9eXNjAt/STamog+Zlm2Bm0M7mfNf+R3uMV7xcXlFJiRQb/RxgxxOEKYt7
         BpZh5TjrT0VqjtOKPy0U8letcRZ3/640JBHs/X3OcLG9ovHRRfCJ5p7nMslzFWCPf/zk
         xzTxxzNL3e309s1H5VU152UWm+QB8+X4Kpj9hJws8oqjmlDQSeCiUh8AhpY38aJz1N1n
         u/sRfFU0CnD089Vti7EIsHq2+tBoMz4jJY8uj07u12SFVbp7ne61ZvZEOxs0At+jNhMS
         3sDGjYMRpwCZL7ltckWfMneg0ijr6iAWikU/3jzAlsmQBiazq1TaUK0RCZOytSRY7+vN
         aSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        fh=I0WlyI3gqSr+gFpOE96JRcqOlCfxMVWTHMZd4Kx6Plg=;
        b=TpAljRoAH1idUB+pTNsMbnYhO2YaNQlqOQ5jkl/azqEkzhlSGqc/MKTBqxCHSClCTB
         CUkg/msXzNeBZnFomMvLsKPITcHTFPu24mMAA7b7p6HR4Cqc1FRFbeuKHrt5FzI5NQi9
         ZJPBNlDZCelIXCgM3tqPi5TMM48PbEQNcuYG08PSU2rsAlMypKU11+MyMHgBGC62fVpr
         MuvTQ9DXM452/KYwTjyimq5q7ijRgjiFe9bJQYeY/FTq4R/AWIMB9bUGftQ7XwK7swLH
         oNASuuF0CqGBdmQIpTeNUXdZ+Lq5oZ07ZvaJcuRCQjdUlJnaBN9GT77yNYMZU5tP94YE
         L1yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676808; x=1796281608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        b=xB7RViL0Qm2HDqntJgtv31vB6wqSzk0mWQxvI9vjk9mas4YmcxlZMLcgZwpEyqSnSD
         fUGiVloXiZRw5+dydJomD3aYAReIwO1H6qF4JLGcc4IAnPZ2Pw9h3/c27N0P7uUU1f3g
         vk7Twjdjs5rm5hWe5at1Ey/NI3i1fqjV2SGFM2dp9zJrVOd7HTG2tm8A1pfXHLJEBBFP
         XHJtv6WP1fWxn+flyVfZUoKqi5KIBQlUBfweDm1mYzBQEcWaZxiipVfsYTaGk6dKKXFZ
         Y8YUql9jXKyeAX+jYx4eXHfjuVrBNpvxuz/3s4Tcuf0uO36QCVHwrHTh8ULt8hbMPYFg
         UZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676808; x=1796281608;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        b=xjUb/saqF1VmRYVI7lEMlc+nSyDFu+cqKfXUa2eMuVYdjCRzCHMqJX1vz8CMuWqn9t
         YgyLwFmsNwFWsSQtECGk8C9qkwLvFbcDCiitQLUgQFE8SZ7iniW5HZ1UMlHiAl/Cy8ER
         iN5T7hs48tlKa/RVV+Myt7NcgI9uApLPNQmny+D2wiP58k6D7pi3nHMMTD8/duyw2zdj
         W6aJS/b6LYbLi6QXOYMTxzptZSYWBld6vafXNnpLDbbtZfvMZSCN2jgRp5M0l/uC/t/y
         pFeC4FaCfZdfPGMNQk9WQb3MYeaSDM1qfHvKtJmvGm6p0lQJt/x10Ao5qzjfpR1OZk/8
         nIJg==
X-Forwarded-Encrypted: i=1; AL+hErEyLMd6LEFgrWSzjWyf8jDqWdex78ZgHDcXPdYX0BM/3c3yyGomtHFZ0SIGAU7jcX1e6wUqn7KSkNP1aKu/h0iQEHvF@vger.kernel.org
X-Gm-Message-State: APuU4Z/XmZstz081TRF7jZUuFtIX08WAb1I2qaHh0BFZwlwIyiHYj2HS
	iP3yF7Oi1gCE99mgTIIYC2OQCcm/doDlH+wwrHwuxYc0b3Ro0zQU094A7YtKyHhiOA3Ft6w8lUK
	VApehM2v2ogZoxbR7WaDGFZUiE4LHJMA=
X-Gm-Gg: AZFdTZcmrQzSspCMSB0GldHxoBpVrL5ALEFJhj2rbgxJclwi9kmrRnAyu/94at6yd8d
	jX8r//gAeW43xwvVGymdp+JkhPzaiq5bYLTV+o49HJULF3jbeApdmOWQ8XjV9y1scxnCAuUAJyr
	aQ10VbT39Y0aagDaBQm/ko/SADWAfgZj1WW7lkKlVoiggUQwygp8R3TMNsyMqbe/bBdurg1csOE
	Si/p/D5x+LfoPZeuSwuCBQlqV/Kf0Let/iUO7KHKI1ooDFXTRCDFnxZkdTbjYfBAwtHgiE0CGt4
	H6/ODoA2bQ7IPewjDPlb4hsxICn1W0FlJjghikSvySoM15EcC+FT3oqS8O/9qSHBq4K5twGy2uu
	l33wYyTfjbUG5MQiVwsEqAGWqWiHjojr1hPxr4DatnYjU4QlTq6lQc7PPlCeB+pH1tQ==
X-Received: by 2002:a05:6820:a29c:10b0:6dd:e81a:5906 with SMTP id
 006d021491bc7-71b394dbcf5mr13813445eaf.50.1795676807667; Wed, 25 Nov 2026
 23:06:47 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:06:46 -0600
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Date: Thu, 26 Nov 2026 01:06:46 -0600
X-Gm-Features: Aa3M54r4sbmQWAvLgNa8a9_OjeQhUqX1RUq0k2cmQkyFbM362EOUw7mP_XR5FuU
Message-ID: <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
Subject: [PATCH v1 1/2] platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
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



On Thu, 26 Nov 2026 02:06:16 -0500, Lee Youngjoon <getfeus@gmail.com> wrote:
> Hi,
>
> These two independent fixes address the host side of the Huawei MateBook
> E Go EC protocol. A short I2C transfer can be reported as success, and
> the normal no-port-update case evaluates a negative shift before sending
> its acknowledgement. Both issues are present in the pdx86 fixes tree.
>
> For patch 1, a host-side test fed the actual request helper adapter
> returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
> A complete transfer still returns the EC status byte, including a
> nonzero status. For patch 2, UBSan reproduced the negative shift on
> the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
> set their respective bits, and out-of-range indices return -EINVAL
> without a transfer. Both patches were built individually and together
> as an arm64 Image and EC module.
>
> For reviewers interested in firmware inputs, the PAN write can also be
> checked with a fixed cable configuration on a Gaokun. In an earlier
> instrumented run, the left charger was online and the right port empty.
> After a normal left ACK, D3 still reported update mask 01 and port
> records 05/00 and 02/00. A test-only driver hook rechecked D3 and pending
> work, then issued one empty PAN ACK while both ports were left untouched.
> The I2C trace captured the following exchange:
>
>     host -> EC    03 d2 01 00
>     EC -> host    00 44
>     D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)
>
> This observation documents the existing empty ACK encoding. The EC
> accepted the command and the update mask stayed set. The series preserves
> that input and makes no change to firmware recovery or hotplug policy.
> The host-side cases above can be exercised without a board by stubbing
> i2c_transfer() and recording the request bytes and return code.
>
> OpenAI Codex assisted with source inspection, the fixes, regression
> tests and drafting this series.
>
> Thanks,
> Lee Youngjoon
>
> Lee Youngjoon (2):
>   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
>   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
>
>  drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
>
> base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
