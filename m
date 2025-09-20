Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4851EDA0F
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758367322; cv=none; b=QxjLT46a2IF4eKm1ukxKSUJHSskIsliUJGPzgxm84wyBKkAL5YUsAUbDQPnO5e6acIq8eqrTDUGJZN8gZrPzrP4ro8RI/yE9FQrvyMJDpdUKyEfE9OLzo58cfRl6X1cZv1wZ7Xt1ZBzzGaR4b+mUBWNHq3FoJy4OVSNun28yhIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758367322; c=relaxed/simple;
	bh=+rLdGsgYuGjcJfG8sQAGZkmn3LVzE0yyvTX6hXEiwRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ta85YIdx8FEmyeB+n0TLrT/lyn/wU6PEYXMo7qiojO/h8lsvPOhcF4tgtpvLg6nHPsNwr1VVwdpZ3jUd4iJzlp1lM12qfhV+i0xwPnfjQOEyqBUPIVSzERtSoKBoR4OT/D7N6JqIgGqBp6aer9HNo02Oukjz+ifvP9JsLaVvNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQIYQBot; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQIYQBot"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc14af3fbso3461239a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758367319; x=1758972119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiyE8MZvpn6pc3tcytojzE+pPGjzTAS+pzglCFec8LQ=;
        b=GQIYQBotn5uxmnxUVaoj/bpt2iMHpIfVblbYjqZ67gXhivnk4fHc+kckZCU7F8Yhqh
         /CzP5fiqg9r4nKoN/MBzWhxeVFK5RZ2VxSR8BwDkn2S1BU7nNI6k3LYYqoelV7o/uUuz
         flf7bbR0zaCF3hulJPSOFAZjhTSqVtODDLtZvwxxNJhXVzkuGBvdACp9j4ezz3NlOiKi
         NiWAz4ojC9nrdYbCC7V2j5MXP5lxWhEvyAO8gGx0yWVQL2Mk+lkJnHzB079r0fBqXuVz
         z0yzdzg2RPGJXs0NIFi5bO1IQUl6vRViT1rEJRAhb/a46a66kU1MmlYgfR0eIWJ23SUf
         iaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758367319; x=1758972119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiyE8MZvpn6pc3tcytojzE+pPGjzTAS+pzglCFec8LQ=;
        b=UE1CAtvOO7CH59FJcApOjTM7KHWQZj7GZ0ZAakFQa04ZMWyn7xFSyYoTuvq5y4Xrhn
         QFkJWxMWLKTgG/rwwvWzcltzf3qhnZ871WA7fAkF/UhJfviYJeogrgSYrAmIwDz9LzZt
         v3rb0qXNg71PdZOL7lXH+1diWqtn8SgP2fZ9Vuwg11wsD6njHypTdaWu/pFCpwQYtg0m
         Tz7MIjgVBocDX3FzCdIvgbOfSfiT0ekCwMZh6/RcjUOT9+4J1qcO8j4f3+UhakjGnmYo
         3YQnDEtDjGPIOxifrSP+Mr69mqaAyF9fiTLf/N/q96Dg80H0xQCEE6zZEksEHabZyh0v
         YBSA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ujGsA0ZTQxHd3jJhpgBvYRljFsnEVN46OVOWpgRe3F2ULMotkYSm1yx4Z4RdtisIanmlQv+8rOdtsVkzO9D4rpEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4g/kEOCj/1IrTqqUHQq4Ngptv+Dv6pevyRbMwzCBq30EfsFX1
	oI3a3cSSNrFALepAVKOuKsLWTcrLDoLoP/GncGKduDNjKvtMPThmM/xxIKQsSWvX5nGjITKwm++
	m/ix6aNyxSZ98EBcrTYG86T+77k+xH9E=
X-Gm-Gg: ASbGncupn16EseT720nJz/WYc2gr0Sz571gO5c/opOKkkileuTcd0jiSQCKVQWOyqPw
	FjsB/S4GBRhCtkgkCWOt6qLf80d8Vksbon9epCnTSccPqyXmDBN/EIMHEQCEV73RCpSt2C5qPkv
	qIXGD+RafeGSzyRFYmFoSOAlTBa2ed5kMlsJgw7QfNydj3dWTS4PDNfcbe2rc2w+yqY1RvtNUfe
	1/tDEk=
X-Google-Smtp-Source: AGHT+IFeiEj70ZQcJf1tL5n90bZSJ1mtJg23x2oOz6LN7BEZQ2PsPZ07W9++FMfiH7Txpzjbyc+BQ8/h55OAooGAqks=
X-Received: by 2002:a17:907:9619:b0:b07:87f5:7cb8 with SMTP id
 a640c23a62f3a-b24f4ebe4dcmr659495366b.45.1758367318853; Sat, 20 Sep 2025
 04:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919204742.25581-1-hansg@kernel.org> <20250919204742.25581-20-hansg@kernel.org>
In-Reply-To: <20250919204742.25581-20-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 14:21:22 +0300
X-Gm-Features: AS18NWAiHZCu3tyYfpgDzY0BY37R5QgJGBY2AzyVA85gXRQhXzbUCQrwjx_ygno
Message-ID: <CAHp75VeuZGUOhQAey6r7Q_mPOmBG4j_UdWerVp1LZpeyUKmZag@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] platform/x86: x86-android-tablets: Stop using EPROBE_DEFER
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 11:48=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Since the x86-android-tablets code uses platform_create_bundle() it canno=
t
> use EPROBE_DEFER and the driver-core will translate EPROBE_DEFER to ENXIO=
.
>
> Stop using EPROBE_DEFER instead log an error and return ENODEV, or for no=
n
> fatal cases log a warning and return 0.


...


>         struct pci_dev *pdev;
>
>         pdev =3D pci_get_domain_bus_and_slot(0, 0, info->ctrl.pci.devfn);
> -       if (!pdev)
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!pdev) {
> +               pr_err("error could not get PCI serdev at devfn 0x%02x\n"=
, info->ctrl.pci.devfn);

TBH, I think this is unlikely to happen. If we have a PCI device, I
hardly can imagine that we can't get it, yet it may be not enumerated,
but the pdev seems to me won't ever be NULL. Am I mistaken?

> +               return ERR_PTR(-ENODEV);
> +       }
>
>         /* This puts our reference on pdev and returns a ref on the ctrl =
*/
>         return get_serdev_controller_from_parent(&pdev->dev, 0, info->ctr=
l_devname);

...

>         /* Reprobe the SDIO controller to enumerate the now enabled Wifi =
module */
>         pdev =3D pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0x11, 0));
> -       if (!pdev)
> -               return -EPROBE_DEFER;
> +       if (!pdev) {
> +               pr_warn("Could not get PCI SDIO at devfn 0x%02x\n", PCI_D=
EVFN(0x11, 0));
> +               return 0;
> +       }

Ditto here.

--=20
With Best Regards,
Andy Shevchenko
