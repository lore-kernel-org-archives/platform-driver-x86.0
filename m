Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795848087;
	b=tbzvg7KTTxWFNPS1IqcG5RkNZ1DcSpld+EABY0R1SAWFmbcSB5/Cmy1Xsmwxys+GbUVK
	 jNcExmcPw4VXDT684zN1+lXABpx4yzG/OCGEisA9mHoT9hJ/6Hrw+0KPeHWBpAPZcVlvk
	 av8+GVg97Vk6xM2QTBa5zMnK3tNeZFaKRVn33O12q/s3/HVWbZjgeAsB5idGj1PjLhA99
	 n12UFMTpvEdSXov7MunJUb0dscI329fhG5iThJZO+hSFIARjVw8a24zzReq1G1bYL2rlU
	 rySl6UBvrtiefmquliInzTeoVXUv3zi4Kf5zpwE09uzfhErTX8Bz+WqzyOhTg32jGyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
	b=lawTtjDNczeLFQ8B1bP1HsIRyRHcSUS9F9MNww8MoWYZ2dZtbo4mz4pOmqbZ8Z+43GdC
	 c2OnaIHbZapS2XMm4jawMkoaAgapTK1Ud3MS5j1iZCcHr3yoTxEWbycPLgwPhIc1YbXLY
	 M3xFN8VKq5TBQWAn6Yb1tF5NZDQmAV+sdSutzPnKyrQ1V7/S9IfWNuAjUKs9+8JVVT/Qz
	 3OI0p8hYoJPrNwl9tzM9ftfY6824aRFSrFCUlXWGZyFh9bcdPPIXLvBqz6D4munMWuVRK
	 /WVZtKqrZASarhCqngyciuSSTesbUIBHz0OxHOI29S0eTsvf1tk7cT75p+wv4YPb1aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQybSDtB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3329606A31E
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 06:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3329606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQybSDtB
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so10017119a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 22:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795848084; cv=none;
        d=google.com; s=arc-20260327;
        b=suK9Pfxq3uIG5cXbqY5gX856Lt79xFSft4Gu/S6IeSwSXZkWhZ/sjJmBeOx6qc+KP0
         AKzc9aw5Nl7EOiQXJZAoE8hB4XVJAeSUnyolurmlZdVb4gpu0ms4eY2JUAHHp8Q4h++5
         GvDJngQbP1ffHbUvPze9CVPtMWu0t07dNXauzkRw1ZBddXmGfZGxlx7VGD08H1nfCzXA
         QhvdMUmtPslAb4iWJ9npZJQ+rBTHHY8llHgT4bF68n2hbyHdl0sl1DYoVHoZta+fyx9B
         Z8bSeoe/obBlB3+xPK5p0wbnVz/S2YqpagjUxr0GYGaqYlZuXVUuHtmRuPDbUeElNUO5
         osOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        fh=uMM1sli1Ku0PDsqxGYqOBufmoXoamskJ1xNgUHLYkwI=;
        b=PzisIW9bByn+0hc3NPargca9vqEvibPV71IoDXftAFxNBuXtDe4MMCGaIRZug/A1Tr
         VVkhOX2tTwKnh4r/8eoGmBgYjnD9h2Tx1BF5yedIYyJ32cKQ0KbG09Zoa99ktrZlv+on
         DqyFSyd4LOUTuItdr38vClOaMCvF33htpjby7x9aB0U3D2OWHEFxo/x1vq3PXbB4Efdv
         A7DYTL8LzunPelwxI2Rq/mfy/R9iga4prRMUJ8d/Clat4Br9URRSs3ISIEEtxIfYqlID
         +rScFdGPZ6zrfHRSJ7SYB9QwU0HwN5aCghp1RtX7/vbVFa6lDNfavd5E1Ic4hiUPK9DL
         1dGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848084; x=1796452884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        b=fQybSDtBSYSP63sA+Dhuxd41ygwl9HyMUjLHfuzEEzy4HfDfta0h9NlZ+MbGd3jDjQ
         MyrsS+RXPcHsempSKS0motl9CACsouVxDgMXbq1dq2Vhtwwyv4EeeBmVwyPuUgCIGvvp
         tZ8/vd/AsFYeKI32awrvcw/FFg/w/xTkxRfcU0pnFjRmDZ1C9fGcP3AnvUHPukCIQeDL
         ft7io6FRNzfgUHOicVdUImV8FKvqrIkeuanuyCEar/uoIzuuC8CWbjFo/EmnKJpYtjqJ
         Szq27lTFmatHrESkiNKOSl7USdwnaalYXGD7yIwhcanP2igb6w44ESO4D/Yvkj5DJ6iL
         RoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848084; x=1796452884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        b=ZXh+yZzTSxTqpjEgiV6gJMEHM0zea17HDYSRtPEuYBg29rf++P5VDIPcK+KnHKwFC9
         heUHsSAH3V4V1bYdxM5G4CACoe3zuH3uVp/bZLBQ1PJyzw0gUNnMUqG6Qt/K3rEpA8md
         7XYmENbI41uvNlYgUGQ5zFAD3UGzLUOOqSEcNG/U01AHG8C0VnisoT94Fx3OLWjdlPhy
         5gGwGipPWKMD2ls27L82XHAU57vf+78esCdQZite8lJJPiJsqZ9ZUwWuoPYw0YNIZf3Z
         dUpnxqIg0HhSu/CYRUATE+WrKzBM6Ztgbklqoh9KDbKAFAOOkWaeBArW8CHYw/UGc1My
         ldBA==
X-Forwarded-Encrypted: i=1; AL+hErG7VWSLEY2J3Vgtx+zW13VErV9r27dIqkrgh6nHGdouIEIA7F37Ohvv72MY6pRrLKKbeGr5iySiSXaPDfY7Fuwj4FwN@vger.kernel.org
X-Gm-Message-State: APuU4Z/v5nSkbcC6ZDv0ihePusS55O9xffcllq/kkRHis2YWMHYKgRAP
	aWWVMq1c4iraalyenAd4G9SxtEkoZtErJ0gyjsqgT97Obl9ROOuGatfH6UHkrDXGq5CwVbB7xF4
	p6V6ZjJnt5HPOXA/oDSciCk09AiXa7EM=
X-Gm-Gg: AZFdTZfo0ITytYI5+50gOustngPALNrnNdgNxVEZ87Zx+m19/P0A5eoj8AjxN4eGP3n
	tuEhgTcHcuz3lF5OwM/A1b5L0z9xUfGFLiH8doU5V1Lm8G+wHWQRgM80+0c993Jw9MqRm6WZnPR
	NU0u3OqrHp5/jjYy/98+towl6W4VpXjruCXR9exrBWWzFSzDBvQBTvFPBUYT2lSeE3a4AMJwfep
	qbY3PfbZaSmzzS6gkb2WZP/sWPTJiG4Kc9WTKepnLp883S0Aqssep7H/3l0LDkZVeCZJDFz5U98
	pqKJxOcTbZfUf734i37sx1zZaWyXN/yjJZ2F/QW7Jw1ukdo8umRNefgSf272AEdPHEZ4WPUNAfB
	eUdZH364GQqCIEoSFBxRgUTernx5RG5oiSWTYBBWz98DRIRijrJPIqpuNvVs3H1u+rw==
X-Received: by 2002:a05:6402:400f:b0:6b8:f674:e099 with SMTP id
 4fb4d7f45d1cf-6ba37eb3c34mr18985707a12.34.1795848083935; Fri, 27 Nov 2026
 22:41:23 -0800 (PST)
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
 <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
In-Reply-To: <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 14:40:39 +0800
X-Gm-Features: Aa3M54rIbBUc2-WSIwCdRQCLMBJaGAzOY1ddUipy-U0olltRp5nyMORY2PJkeYo
Message-ID: <CAH2e8h5B5x_5CAvLgZz737bgYPL9MMhRcck1bdsy+PyMUKW-LA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] platform: arm64: huawei-gaokun-ec: Validate the
 PAN ACK bit index
To: Lee Youngjoon <getfeus@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:08=E2=80=AFPM Lee Youngjoon <getfeus@gmail.com> w=
rote:
>
> The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
> reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
> before checking the sentinel, so this normal path evaluates a negative
> shift even though it subsequently sends a zero mask.
>
> Initialize the one-byte mask to zero. For an actual port, check that
> the index fits in the mask before setting its bit. This preserves the
> empty ACK and rejects unrepresentable indices before contacting the EC.
>
> Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver=
")
> Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.o=
rg
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---
>  drivers/platform/arm64/huawei-gaokun-ec.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
> b/drivers/platform/arm64/huawei-gaokun-ec.c
> index abf05e7ec..95e867596 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -458,10 +458,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
>  int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
>  {
>         u8 ec_req[] =3D MKREQ(0x03, UCSI_REG_WRITE, 1);
> -       u8 data =3D 1 << port_id;
> +       u8 data =3D 0;
>
> -       if (port_id =3D=3D GAOKUN_UCSI_NO_PORT_UPDATE)
> -               data =3D 0;
> +       if (port_id !=3D GAOKUN_UCSI_NO_PORT_UPDATE) {
> +               if (port_id < 0 || port_id >=3D BITS_PER_BYTE)

This is right in logic, but we should follow the hardware fact, this
tablet is designed with two connectors, even if a new product with the
same EC is released, it must not have 9 connectors, so using
BITS_PER_BYTE may confuse us.

Best wishes,
Pengyu




> +                       return -EINVAL;
> +               data =3D BIT(port_id);
> +       }
>
>         refill_req_byte(ec_req, &data);
