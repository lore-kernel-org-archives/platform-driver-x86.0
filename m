Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852111;
	b=cfqnKN8DFu4oWrsSuso/2TMA8TXSXvjxaEiUmrcBfHGpYLYN5+ddejtM0OVoo1nz1LcD
	 v2umrjxvZY6y0yM4iczgVlvhdoHUmrL32DR0n5LKUNJhKNSHPZbzCqFQM0kaLUxXZggxQ
	 ervHHo7IjGYlHfIKfHF0ggGsPkyez4xffOeuF1D+J8cNblVgI4TDy4QtPTiaGNzNlQblE
	 VZbDWvFOQnWqUJGDLIKVJMZ4Fm3+udLKHPsfK9WwJuLcDGISLHhlIiGxPs6f9iSQIw88y
	 sRi83k4WcYWF2lSKE8ut7v+TX1LZuylPvTIXL5r3fzsyaWfy7yl4Frxdbv+gXhmB1jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
	b=mZulPNRMhVQENnPKjFCt90l/9S3NWw0OSgZN/jWnj84Hx7AqlX9P3R0sl4xgfajqTIj7
	 yKdUEod/dsMgTa8bY0Y0Gy0wNHnPmbrhuS46y94izV2aPns/17m5eHUTRIadaWzfzsDuq
	 kknvrrwPjr8+dwsaHrLFVQtkNLE5FY+zn9USEaYWNtgJNxC/lqgH5qvllexeI0iU6nyl1
	 cJD4wzA0h7JeZANV1kFQFDuoCybvqWw3Bv550DXrPlqtAx8RoBLWtBa7fisMmxpr8TU7K
	 r5ao9gN5kILH8r4/TGKFLtmriGz5B8+cvMXW3Vjp45f1Zu7FXTAq73Yi8sjbv8CPE+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XolEnbUp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B960A2619
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 07:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35B960A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XolEnbUp
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3270749a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 23:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852109; cv=none;
        d=google.com; s=arc-20260327;
        b=rvXz1ugSeYFuAmKzzCK0P36+H3vqAGMKqrieWSG4zqS4O8BqLGdtvyoYvbzIErlzUZ
         UdpKZGvt2u9hxnP2x1HM3PM7tFdgi0MgqLBZKdDQp8LZwlWnEOxyzonwyRA2qrtMLpDq
         n/6dMQF2IdEdt/lFN4b1NQw3pPNsxfD1c/dTtIuryOYcWSRHuBCJXcIfqg0xuTNs05mk
         9QIgVDo08DSnFqije4vxel4B9KoTXCVqDR+2o/Tjo9sDYBc0/Bu3YxPlM2gHF0uxIDOb
         KQlJJ2nMISyeKIebpUfDTvN8/Va15OUlvP+tOOkwHZsJpqWkoUTawRET9MXAeLTQlAb/
         wbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        fh=sHh6tNH10xeCKDlgMRh4T28grgsN2arsB/+iB021tCY=;
        b=Ri5McQFOC7hlYS0yGkbQ76LW2g6n3xEHce8kRbpSGdHxiFMLbxJj9qG4DbP9JcGpOQ
         C/lAN2UeTsEZRjEWJju5yfwi+W76pziDremrZpQOaU1TWGF9iastmHj6HVGx03+/qVuW
         VGF06Wp3CVMVMcNCcjRy66u68Pmu2N9YiweYMhBqYgY0dhZ8sEU15DQAA4HVZ0Mg4yAw
         Xl7Ww+Drwpj6e4tqx8nKV12H5nwEsMmtI+FnKfPnBGwPiUHGT6WAi++WR/lKDMP83Bch
         aKKD92P3+2bdxXqpe9UCrd6zHmshjhPxEYeWb5lxJCuZz4NpvBOO8pTlayajvqT5N/cQ
         6b0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852109; x=1796456909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        b=XolEnbUpEGDNGhRQ0i5jttJVEZ0eyY9lGlgEEjeVgvHuiQWIoK+p7SgKs2icH8vyZ7
         8bUWiyX+8jr6JwUqXcPTs04wo8usD/yW9DrhmChrL97U03LFOwiAj5S7+Eo+UykKnIkM
         RT5vQd2kbukx2uO6cGfeupz6ss3qpAVZa/1sx6Nqz+dHLTiPbPqrWvJ1Fmm+NaWcCLmh
         9zDQkUjWKkUdZsYBrg3P1PvMoWERmMFEhBxs7su3ngogXEqapN6qoRA7SRxbtE0JcqL9
         /JBaQZ1LL3g/nDqDSjf0CPSeOyE3HSQrne/r1twWkawputdrimTMC+1QnAm7kWSXbMue
         gOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852109; x=1796456909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        b=rVqMTzr4wCI00v9DO3372pbxgBSMNZHwO+XJSg3DruvDvpvC6t4VQHHPGPeg9LdXv/
         3W07HUBZptFu0ujrXy+JWVzlSvc9TQS3g1iVyDyz5yBkeBYqFiWnqna93SJQvopixi74
         CSPWpuRXvEcIh0oQ91kke2qwEdlAMwszRe4Qv45MLJeXLHlbr1FDkH3m3d3H+SpL3I1t
         DD5rmmi+LvGUk/BlPL2VQGEksUIfkl1qVaUUJFOuG5MCS/14dMqKCNNEYIyAuYfjy1pv
         6Zv+n4JdddRPkndZoVgNv5bcTj614Z79xsFxvmb8lNHJZmtUtltV9Zh0Uru1FzG2eIgt
         6CoQ==
X-Forwarded-Encrypted: i=1; AL+hErGUN9I0GuLSUUr+LjN02lxYrO6Tj5nnCuwn36GmeYPvUG2byoTbw1CbXpe2AeSDCjGSte6FJ+nQtS+X3b3onfcn20KB@vger.kernel.org
X-Gm-Message-State: APuU4Z+u9v3qEdTXeYF8oQyNSaJojTIHTLq5OSf+xMuhcx938WDUvrS0
	qV4A9wunPczXw81tJdIZJQBtZh7s2LEIvgsiU+Qhfll00MP2bDPgvFmJ0FNKlt1r5yT/4I41dkG
	FpUQ1uk3GE7Jn02fou8TWQyJf9g7L9S+sRg==
X-Gm-Gg: AZFdTZcu8d00KRbfoO+m1EAkgoXui8ymXPO9QWeSUs81Jxbwh62ux+hNEkY6iwOoY7Y
	IzmpQa14UsvMpFv26E+ksHTWs+jPa/0xRRBjXcEmTtCXk+qBHYUEReaR51mUEaanBrVtd0RVAB6
	br8IjzCd4aeLCJ/Ksrh3Ik/d0NLvu4QCD/aP28nNmL8UJF5VQfUshl4p84668WyXN0gjbf/etzs
	TEL6tO2E3wqlwqhvpRfDnDjuUsQ87uWJ40CxP/9Gglz0DfHqGDfoxnNmSQ85Pc6w/QdekhRKfdB
	zvTfJ44ZiykRNvnHVOFaq4Bwgsde2PaOzHMzVdaJ4Auzi+YVULNiW/phmgZvXbRcF9LYVfIQW43
	RIc/3bhOFhukGB6Guj8nSSiytfpSZTJtzXrVsb+e5KmpPnLLT//KI+SMMLjETkqjWLQ==
X-Received: by 2002:a05:6402:42c2:b0:6ba:9142:da2a with SMTP id
 4fb4d7f45d1cf-6ba9142db1emr15404788a12.21.1795852108854; Fri, 27 Nov 2026
 23:48:28 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
 <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
In-Reply-To: <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 15:47:40 +0800
X-Gm-Features: Aa3M54r6lKClANqidOrNI6R44bh0oBv1RuBHpbZYK3mQkRLkMIUiWIncX0Lcey0
Message-ID: <CAH2e8h7mt1MOKWk=oRskBZMBjt9TNx-JOwVv=inK8sTPrdL1xg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] platform: arm64: huawei-gaokun-ec: Reject short
 I2C transfers
To: Lee Youngjoon <getfeus@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:06=E2=80=AFPM Lee Youngjoon <getfeus@gmail.com> w=
rote:
>
> gaokun_ec_request() issues a write followed by a read. If
> i2c_transfer() completes zero messages, the helper logs a transfer
> error but returns zero to its caller. If it completes just the write,
> the helper returns one without having received a firmware status byte.
>
> Return -EIO for a non-negative short count. Preserve the adapter's
> negative errno, the EC status on a complete transfer, and the delay
> before releasing the transaction lock.
>
> Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver=
")
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---
>  drivers/platform/arm64/huawei-gaokun-ec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
> b/drivers/platform/arm64/huawei-gaokun-ec.c
> index ac21f732d..abf05e7ec 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -145,6 +145,8 @@ static int gaokun_ec_request(struct gaokun_ec *ec,
> const u8 *req,
>         ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>         if (ret !=3D ARRAY_SIZE(msgs)) {
>                 dev_err(&client->dev, "I2C transfer error %d\n", ret);
> +               if (ret >=3D 0)
> +                       ret =3D -EIO;
>                 goto out_after_break;
>         }
>
>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

BTW. You don't need to quote the first message, i.e. the cover letter.

Best wishes,
Pengyu


>
> On Thu, 26 Nov 2026 02:06:16 -0500, Lee Youngjoon <getfeus@gmail.com> wro=
te:
> > Hi,
> >
> > These two independent fixes address the host side of the Huawei MateBoo=
k
> > E Go EC protocol. A short I2C transfer can be reported as success, and
> > the normal no-port-update case evaluates a negative shift before sendin=
g
> > its acknowledgement. Both issues are present in the pdx86 fixes tree.
> >
> > For patch 1, a host-side test fed the actual request helper adapter
> > returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
> > A complete transfer still returns the EC status byte, including a
> > nonzero status. For patch 2, UBSan reproduced the negative shift on
> > the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
> > set their respective bits, and out-of-range indices return -EINVAL
> > without a transfer. Both patches were built individually and together
> > as an arm64 Image and EC module.
> >
> > For reviewers interested in firmware inputs, the PAN write can also be
> > checked with a fixed cable configuration on a Gaokun. In an earlier
> > instrumented run, the left charger was online and the right port empty.
> > After a normal left ACK, D3 still reported update mask 01 and port
> > records 05/00 and 02/00. A test-only driver hook rechecked D3 and pendi=
ng
> > work, then issued one empty PAN ACK while both ports were left untouche=
d.
> > The I2C trace captured the following exchange:
> >
> >     host -> EC    03 d2 01 00
> >     EC -> host    00 44
> >     D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)
> >
> > This observation documents the existing empty ACK encoding. The EC
> > accepted the command and the update mask stayed set. The series preserv=
es
> > that input and makes no change to firmware recovery or hotplug policy.
> > The host-side cases above can be exercised without a board by stubbing
> > i2c_transfer() and recording the request bytes and return code.
> >
> > OpenAI Codex assisted with source inspection, the fixes, regression
> > tests and drafting this series.
> >
> > Thanks,
> > Lee Youngjoon
> >
> > Lee Youngjoon (2):
> >   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
> >   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
> >
> >  drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
