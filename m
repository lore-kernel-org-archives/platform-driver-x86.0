Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374FF396D0A
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503804; cv=pass; b=Li2MFylq8zv20zTdSvxYeDXe5P+lk74Xtc4aVWXSJmKQruruPaoYABI2z0vs+Nc//rMrhXwtfxx1HpPUBTWjRs5HLpbmyUdZNCCEmIu7XNyU3z4ziEk02SaU5yFmQsCd78baOszyjsjSNtdmgaWRJnjc74g5VTZAhOYLo/TzbJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503804; c=relaxed/simple;
	bh=E91vaeMNwDF/pEjv7G2aprNsjDohPpm/gfEXupHR2kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obOxRoLgo/7J++g/nIgMu1UPAoAVSe6aMyNKWM4rKGwm/9f/e7YzCJSXQFYh6tFcs8+W7V+TViSHY8EkAJq0QPr8o+Yg8tTeghVzS++5ROe3mJNXCxYibKrNt6za4PxsGjtUOLjSppHNy43NCh248tMJRj6yVpxw8YR/KZ5umXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpYt8ULx; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpYt8ULx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66d24c6963bso7594308a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 12:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503801; cv=none;
        d=google.com; s=arc-20240605;
        b=EGPOgrFvLfVqsAphsU88oJUbFPuHNX5j3/iFtQXmstmeVUUrVLNmFLXjZGU+jSBbyl
         tMbprSz4J/rbuPheTajduQ+5j1gtuBvdJDet+I5J1sQ8n/9p5YOwRBxVqZpbw30iTdGl
         TaEacXiJLJTMACAMafXELrArHie17aGGeLqBKbLxNPExThnNvU26m1hu6DVXPPjUDlp3
         g7pJZwLoZoqW1kiuK/2G4pK/9qT7zwOvAaQDHpr8HA/zDW5Aduvme9NFYwDu/HpvGjAB
         ctfk4nT6WSJKQ2947TiEMdVpC7rvvNFmG0glzEHI7mJX+otpWQVtUDwxlCpeOFhLhUMv
         /o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        fh=RP6K4vFT4EVGjwOFn2Op6Ijd3Fq8yJZCGrpODIf5M60=;
        b=Ia+4xzmn54MoPI13zmuzg8xzJnrXCF976Zf6GWIa6uMtatTLeYmuOi1moWa5Sd+hwg
         JnRb/FrRUoSy1xwzR+mruH5fk/u6WMHi4IRBvdcbslIHdkgY79z4CwydjolzaEM03E6e
         7FkcnQveTZDNlAoex1i9BusneRKEJNmrsnCZIHRFjp7cmWU+YddF6FlIkuYkYUDdhU+x
         Uof3fFpXJ5ay7HgBmZWoJYhLiyUWz/ZDVpyrXLB1MjFho/4W3kFze2dsfimkxRBqfirk
         oEa+75PbccXoma1lmXIvUB6MpqZqIwXYr3Zjqck99U/jFFS5qnep1/Ch2FufN+rNn7Ir
         l1Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503801; x=1776108601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=fpYt8ULxqnw2GUbo8PxtOmsJkkZtVysEaDZlyc4h2P68GO+cYulde84SIJ0uydhpZx
         jXNxQ9O2Gp2cuhIi61UgF3kYmIp0wsH6hphdOhhfWsv/rcIlbgPOzmweaqa3IgtwuzP9
         PGx5z6ohMvudLwSjIw93Q7vdhkwWj/QFO55A7+teVpb6rtuH474NgoX05nB2PuJumkIA
         SbfOZSaseyOcdue3nC51ekx29sYKiCI528A3gJM6P3mDHj/Bib7xmsx64QruetIGRfSe
         g7O7sqUO8j7eozf+iBdwIQCQgVMAopcZ4hX5BfHAeP7lWhUUHW9DOwoC0Z0o7v18+9wK
         9bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503801; x=1776108601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=hS/bVLBqih1TnLt9/xukBkeqveOIWPb6NKDcHBmGi0KEDY979gci1VEJYqNB3zMz8p
         XUtHfmeOowhDTOykCiwff9XL72ZDa3UDrYNiiVEspe7IjDJA0/QVGTef7U0tntAGenSX
         tQZ373D9R1JA5yZknTFtmx44xleolto7+IfraLamIaq7/gf1Uxhm8x41p8hPQ7sdqKD+
         gYp5Y58hTDciph2Te2StpxFUzLzeCFUqN3OelgktIJdG9uPhfsGT+QEJovRwXEC1y66m
         UZPv4NbmhL4W+HoJGHM80FXHJh3Sm3ahqWXJMWy8vJoQBIwr9uyaNYGGSZ5w9S7Wbci2
         sgxg==
X-Forwarded-Encrypted: i=1; AJvYcCWeJRbTUBsmapVCFup6D195Zw/NTk7rwWfD8+7ZxcCLZCGOz54DUqd1UQOz8L0YkK1mEPIa0wAzmIJ2oXkzJsEssiGt@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZHtwy3czKVCRvjmmIXeZUgAL7Lc0y1sKbAgPTeQmQwYVlliT
	d6KrbQMXVPTI7d2VCyHnJe0fcW31dcVB2bunPaGLQiSb08O9jetyFbxWWkuAkjIedI9IcySOW7Q
	F7OC/iZ+GAgHgVf63gYWXxEM5MgI0lD8=
X-Gm-Gg: AeBDiev0SB7f2aN0o1cQAEcUicM+W00w7cZQqdg0mnyEeZveBkDNIup3tn/Zz3OfDxf
	zlcVfEoZY2bMhJMGk3pIvF8AU52otwojIf1KbhNVbL2hZAw8pyONONIppR881r+w7MCUDEZzFrF
	fm1m46xOLf0iAtQRZCYas8whknqKHOD3szpKisFHu2bdNVXHk4xiCnWAmBlOmAWwYWEzjgnCNH1
	MSwecgeJnD9F42U5nckXPDnRPG9ML07iDq818zolOzOi5+q34tydi2V9qBlGVWH7xVCTAeOdd2E
	k3Oe5zdrRXG7DaStEwP0QgMvaQAkUSqG5bb07aBvdLJyyHHHHxwoA1yn8duZAdMOnwyJslmjSo/
	8BgwgphDHPZUVMvKFIA==
X-Received: by 2002:a17:907:d87:b0:b9c:b069:8ac3 with SMTP id
 a640c23a62f3a-b9cb069bac2mr337550766b.3.1775503801341; Mon, 06 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:29:24 +0300
X-Gm-Features: AQROBzA8JV6OQ6clUVeDdQ8y2N7R8Nc6EH_ZR0i5RXUt9ZfYunTBiDn_zltZ3Uw
Message-ID: <CAHp75Vca5R82wEV1hAyu1=zkuQOw3htXT787XhGH+LVN+EHQHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> fwnode_property_get_reference_args() now returns -ENOTCONN when called
> on a software node referencing another software node which has not yet
> been registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENOTCONN.

...

>         for_each_gpio_property_name(propname, con_id) {
>                 ret =3D swnode_gpio_get_reference(fwnode, propname, idx, =
&args);
> -               if (ret =3D=3D 0)
> +               if (ret =3D=3D 0 || ret =3D=3D -ENOTCONN)
>                         break;

If I understood the logic correctly this may be just extended as

  if (ret =3D=3D 0)
    break;

  if (ret =3D=3D -ENOTCONN)
    /* ... */
    return -EPROBE_DEFER;

>         }
>         if (ret) {
> +               if (ret =3D=3D -ENOTCONN)
> +                       /*
> +                        * -ENOTCONN for a software node reference lookup=
 means
> +                        *  that a remote struct software_node exists but=
 has
> +                        *  not yet been registered as a firmware node. D=
efer
> +                        *  until this happens.
> +                        */
> +                       return ERR_PTR(-EPROBE_DEFER);
> +
>                 pr_debug("%s: can't parse '%s' property of node '%pfwP[%d=
]'\n",
>                         __func__, propname, fwnode, idx);
>                 return ERR_PTR(ret);

--=20
With Best Regards,
Andy Shevchenko
