Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478600;
	b=uQQEKoOmUNOi890u1ro9W9qmD8Kt2eyxZNZm+3iFw0wg26KCQoPe6T/ztxybfdJhnENa
	 bTAzCckGWZs+WmflG9oEfKlBcQ5SPQwraxmpaswHIjOsjMgYVkzGSxna3slq6tkMBWvOM
	 bb79UUH152vPCHoT80eUnF+1NQRFdSNJDud63OhkABHuoClIJ9LdxOEmoy5EVesQiwG4d
	 b34yp6pQ2+bXBRrcHfYFdp51YBFftzWmWIbHwDzALGBdxRN0BIdEAy48rHsyeqPixIL2v
	 Dq4PWE5LTGTw04058A6EiQnTJ06xkRvxUdxwJDR8yf3lmS8flNr/Y54l8eUciFPPw5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
	b=L+j/ef0FHubnNV4kEcHcxbzbtcq9EQ54UN+X6MfEyXzwpQxnhB8UYpT2wjZqE73XxoFz
	 rMyJxsrRmAJmFb7G26BelP1XfCs334RDt9+80RUcChrFhMtq9d8PAqEsnZn2YPI8freL2
	 FGnVOjs9jpuUfnPKezL9dW205Y9CzuVlsGH9K14X0FGEYJcJNloonZFx4yFKVdPwmLVr7
	 ghMSlBo6t6uOJmz2wmNZKM0ISlZpVvVqxQFyOkD7/a1sfraPcwTl62/Jy+BbwRgzEmdQU
	 EnkxAGHusK6UxY5nPsDJRH05YDrVtZdOKCbXntd9CdKu6IQWY6+FIjrPxN6ys4ZeSAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DL0XNOAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3D606A329
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 06:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DL0XNOAs
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so3593750a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 23:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478599; cv=none;
        d=google.com; s=arc-20260327;
        b=QzvwsGCUWBh2ng1dcklpmkHg5+Jr5+BJlD9H+A0y9Y8FvDwQBdj+JCeMfxoM5GtT/N
         zGIhBmBQVNqWJ97x42Q6I4SE+FYvrPE5wH4Qbk83AAUKskdyeU7zvZ4VqYSlMG+UnRvY
         7OZ5bEFrEZT1b4bPg9NQkmU8aLslu1DgvGxIcWuJKeKg+FGbgF8m3V8tp1SvdFaX3MUi
         sjV8WmgZp7WK29EfbzENANBlWFATyeJywUvaHmd9P0dIdq3omoUvxJtYkonVjo9I9zZc
         NVgniAbDR3vRWoT8Y3oGqv23blRxbGnIN+anPSn7V7/TOrwx4SLUFyofApwh0IfBjhn6
         Pw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        fh=0t7KZs4ah5pAAj3IFZQqnqg/F8PjJ4sF32XuBHMMh2c=;
        b=bEOnS7Uy9/rNWQ059W9zBy0pFnBaGb/0lSSITvG8o7P+4mS6iPw4Qy72/tQA3FPvjY
         RUjdN+42jZwBgsgx2SbbXN7+4He5jnPyC3jPLj3PgIJC0NSosL/XF3/nY6ZDhkcS++FP
         IgJRbPb4ILAz8bjJ+rJ50YZ+TL99I/3i3B+H04tZH63V3RTKsFRBHNXvyXL3htooSlBj
         ZZDElycI1RR7v5R69ZLNjkX+H46kj9PZVJdOvO7OXeTAqb0FMCZwlzUG+53TRfpgVMhV
         FlRtzxAI4wsOJE29Eqzi8pVUDq/+wmKEbUccAJaCRhmnxRo2ILSE8R6NT2x4+RJ+EQU2
         MNlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478598; x=1793083398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        b=DL0XNOAsWGfOEzp83z0k6Pps6p636rBuGYVs4tvPxFQ+DvD0cEQJIXHZJqfa5cBX/C
         V1/01WAF5Vpd6NbpQvva7T5p91yQEMyZ1wJdDs9hNJrbDmdVv8a9TcTmv/UfQ+5KYuYg
         3unvL2AYZ2x6G+oMKXpHhK4TQUknywAvJ63wQtVFys087f3IRRyBC5Lhs513kcYUO83x
         FAfIo3MTDUBKdbHraVHzDEVK9YCVlHsYXdXJHz8MIUSHlLoi4UCjLIOAnARJNwhi45FC
         NTLg5GHAz8uudYX+PQ5FuUTy6TsqiFgYT2P5a9uRSQH7ShY2JePGXkI557aRsCeXrkzp
         N6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478599; x=1793083399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        b=gNOyBsTS+dE5v5FTXNbguuE0yaFgdyzN0wC2dvCPKcL45rxXmjcZNaay8oUqLExUG6
         tyV8O3WenHuMFuE8J2IDd9lq5S/WLMS8MohdNY7RLvFCYIjJqOp5EozpUudFZfhs+Iyk
         nBPxUmu+ctrWvt3j3FhEyY15YGa2Rri++H2m0NkesF1rl/vG3fLlOBsY6Xw6bnWXyNIH
         mHVJ3TtYhnczDuFoH6KzAd1Z07YQ34hXY3//yqZap3aGc+eGZA/JsQDGcU5av6Q1xFrP
         gEDPJ4W7qZKzKQhFy2ZxT/G+CnYfqLTytRVUDwEDH+RvpJXij6qF3zB6u8xTdI5UZ2bV
         FgUA==
X-Forwarded-Encrypted: i=1; AKwUvByTeCFArCwgMKlboxBkXN2Ot4UESUxBuLjFudqOV+Xf8NKjMZuC0rWs5OxcfCj0xIqNfFI8xicKNrUYNQCdhpGRTdAt@vger.kernel.org
X-Gm-Message-State: AFq9FYLjt1rfzWAh9nLVNs5opLOB9JpMZciRvAPdYWtP6NjDYhDUTY1H
	nfZ0lORt0leyq/JBlXmLfRW2HEqj2Epwhpl4837l2j/iYLH3CkQ08KXwTL8ZPCVDMlxn3/VgQEz
	AH8t26KW0nWn1Uo+uqyRplzMkWlv6cT8=
X-Gm-Gg: AYBFou19Ct0o47DDibpf+2yUCBzurE34kiHYtHzLHSklmBbg7F3R+KBg1aE3NvR1jxT
	NEcRC8aS7UfjZrfXLBqkeosU1Xfetpc7Sntc8b0vKtNJk7/HNUHWDJaUQykEBtOvmHqJD2WldvM
	djmKGiu4Bg0m26S+vfeTkkx5sSpFcUleGHZTjyOA9qiudccj89aY9nSvrqMlAqSaE6GF0HIv7Q4
	GdSr7Hwqu44PF7diz5TnaUXyA/0p7mJ9dhzrLnu3hzM26nizw8DfodfiSNUtxFH0zKl6ilCO5Qu
	KMNdU6HI5q+4U5fkFMX9hYVnUdbUqfT70qLsQ8ngEVOoNvyN/eFTvTC/1SAqia9bhDj4epVto4k
	lBVHU0/lk24/6znbtKxakKEp2jUYrc7qfsLAt50UlL1xpcJATUj3An4igfEt4d/8vh/evwmgymS
	bZSCmFSBkUbI07QhyH+oRhl0s/AuiMFIextrR8Hvvb
X-Received: by 2002:a17:907:9614:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c419ed3674emr896695466b.30.1792478598514; Mon, 19 Oct 2026
 23:43:18 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-3-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:42:42 +0300
X-Gm-Features: AclHuK_h7thPbK43T1nxg6VzE934IoCX4uM7f6mvAqFm3KhDuLo-7j__7w9G65c
Message-ID: <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
> Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
> reports the chip id of the OV5675 and takes its register settings, but
> its color filter array is a complex 4x4 RGB-IR one.
>
> The silicon is likely the same as the one of the OVTI5675, so it still
> has some features (binned mode, hardware defective pixel concealment)
> that assume the classic 2x2 GRBG Bayer array and thus produce meaningless
> output with the RGB-IR array. Disable them for OVTI5678.

Should be marked as RFC...

> NOTE: This patch cannot be upstreamed as there is no way to properly
> describe the color filter array layout of the OVTI5678. The color format
> is a placeholder at this point.

...and this paragraph should go to the comment block, ...

>
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
> ---

...somewhere here.

>  drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 131 insertions(+), 18 deletions(-)

...

> +#include <linux/mod_devicetable.h>

Not in a new code. Now it's provided by i2c.h. We probably need to add
an ACPI ID header to it.

...

>  {
>         struct ov5675 *ov5675 =3D to_ov5675(sd);
> +       const struct ov5675_mode *modes;
> +       unsigned int num_modes;
> +
> +       modes =3D ov5675_get_modes(ov5675, &num_modes);
>
>         mutex_lock(&ov5675->mutex);
> -       ov5675_update_pad_format(&supported_modes[0],
> +       ov5675_update_pad_format(ov5675, &modes[0],

&modes[0] --> modes
in this case

>                                  v4l2_subdev_state_get_format(fh->state, =
0));

...

> +       ov5675->variant =3D device_get_match_data(ov5675->dev);
> +       if (!ov5675->variant)
> +               ov5675->variant =3D &ov5675_variant_bayer;

With driver_data it makes no sense to support driver_override.
Better to return -ENODATA instead of pinning some defaults.

...

>  static const struct of_device_id ov5675_of_match[] =3D {
> -       { .compatible =3D "ovti,ov5675", },
> +       { .compatible =3D "ovti,ov5675", .data =3D &ov5675_variant_bayer =
},
>         { /* sentinel */ },

At some point the trailing comma should be dropped.

>  };

--=20
With Best Regards,
Andy Shevchenko
