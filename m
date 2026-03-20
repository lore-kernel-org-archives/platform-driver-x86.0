Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737237A486
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047753; cv=pass; b=FlC4t1htoOhskoYz1LUZDEBOE0Bf2VW3kwNQlU3wfrOP/yHy98qYn5zGv7I32C03x0/ljm7PGu1Tc3la1W87ivRZgXC2d2prlBwJniq0qBx4uH3B9Dxp/1h1FbM+WnZxwJkE6mmwjJOEL2jlpgBTLBgFVRD5VgVXG3TBKKpJM6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047753; c=relaxed/simple;
	bh=AHyz3fklJvx0xq22pb18w1unw0EL2aMHoAXZ0+CKbWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxS5ouV9hlMTr8AaNo6SmbQP0kZoKzcgfwpuC37F7bbpVO4w4g1uVVEV+rk+kh2cIQ0/EkZqPTO6AgQY9x0aQc4alT6O3OaBu0AGA8h1TbWGlJ47C6XEonCwF5H7K5p5j2SaQKUHKbyXUCLH/bB/bLHUER6vnsux64QXYVdxtZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZBC+ojC; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZBC+ojC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97ed4ad579so192819166b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774047751; cv=none;
        d=google.com; s=arc-20240605;
        b=LmdGfvun2TEzVNOU9Tf7DawD8uScZIS/XiuUZ0ZpA1PrSEj79ICBowALIV/uPyDZmh
         VjsIb/3dMA/e4BRe0Scuej2glfoIAmLCBdgVzJ6oBQ/6zHxDNomE0OguK/QDCGULMXMB
         xoUmffjzA/OrXMLIcXeReKJM4B1bWlnImOW4UPIZYi6YjR65TpSjYlOoUH6rVZFkGLpn
         AjlF+QZcBFAWXvyUmNP1iAJjL8EUzbpxHQf+sUFsXTakBnBzphabKRWRrfc0QD3tziZt
         d6ZKgUgMNbfdRKx6Sx25zHCGnMLePV7vPghCstD+tkEo4ubSOjJj/hY9QGQVdlEWidMh
         d+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V07roURxLiPH4bJcO7EjRaWdLNkdljJhSl8QwyA234g=;
        fh=51PFcLc/oIS9+UcpGqJhh+32PF7FpGGwYr04RCM/85Q=;
        b=f5Uiu0DFmiI2FcBMWqKYoSG/vBcCj0fVp9uKUXWb2NgDsHUj7vfvnRYPMExrbieZuv
         ge0o8cHaznia/OiaJsrq+kJ04AIhG0IQm/qVk74zxe8ZE4rp9xoAEolDZxWleS81XDA0
         HDVPs+ij+vhgSq6QsMAB0s0Gk1ldcADlATf+UewK2i3NoorlaGPtyQAYwlktK6Tf90Oe
         AyCnQLAkdnN8oWQjMiod8Qlkml4NfWoT0xdNkdcpBHArTnTHff4FH+H+HqhmT24Fynzg
         BTd3XrMWmOQT6u2VL/efzYSy3ESYohJMF/BSUp2GroJqikJthvioyl7EE5dX093T+ra9
         xZHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774047751; x=1774652551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V07roURxLiPH4bJcO7EjRaWdLNkdljJhSl8QwyA234g=;
        b=BZBC+ojCwrE3rbl3uOkj2Wm6vKQ3clrYV/+Gxsc4DvwDoWDd/nv0pP0Skd0HkWI1Qk
         IxahjBFArZKMQE011YYio6rB1fQONgNcDsC0VikE0ZnGAgr+JfNIUAzccEGWCjBM4BYx
         dsxpbzartlolzSSOp6R+zFkURUaSqRNbE0ZxqRfLafGSa1XDViyuVuwPgVimud/HHfUZ
         at+HPpK4nADbZt5hwk+MGC2NKy9CZBD+qR5uh2leywDQtC4a5Ao3KDNWAGuphtoZkGIZ
         4Wn+HewdO+u1nT3jlRePaGku/xlNVPr1Xb1JEikasr+m6z4OTzC12e6nKhnE3ceJ+z0s
         Ml0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774047751; x=1774652551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V07roURxLiPH4bJcO7EjRaWdLNkdljJhSl8QwyA234g=;
        b=dywpxy3kz/8w72Eir2cyLJLaEi5eGAN/q66fdKRXq3XtZFW0pOFARWYadrApKyPPiB
         uWU+InkAS7731U9KTkRQAQgwgu5b+qs+/wgx9P8soKWEpMJWp8LdiN4I3trh+zhS3VmA
         tPR2xGu3Pz/a7MyrIFuUFxC+342ENEQQQFSBycxqqSItgqpWWATC3dJjTVANQwLNDpVG
         qz2d/L4XOHB9bgMvU+Ve2Lx8PbOm935VXZe4ysW3XUWKb+W+e1dnQ9SPFtDv5TKW3Ozq
         Mc4I1z+FRLe/aVunSkGiot7h4l8tm2JvzvT6hxEcuuY6eFN3dJExHGHmXdFlSoCgXKQ3
         OiXw==
X-Gm-Message-State: AOJu0YzuvNu59Z89uLsU4cp5poaQYykpiHxs2rJYUOsOIu+Gv3XMPIqu
	Kx0CPfuk9+E1Z/MXkqhMhhs1AJoufKqHgzgvWlysogfCpvR9E2i1pRcn4S+dpiOLF3V1bVXHmRP
	2U5v+8dykmWWn60U9IqrVgegKt5/37Bw=
X-Gm-Gg: ATEYQzyHzOmCcoKYh/5nCbK4eYaqhnszbk9QEKNfyxKFdxafTu3EPHgFR1Ez4NgXz/k
	rP1hFlN9JmIT2AX9XnIK7v947y8KhBQYyrwYBcSqI8Fqj164qZBbpHo6c28eY0yI1+MRE3LlGsN
	Qqc/rs/NomyGjKcdNaO2LHAzWPycFHOzH7cuBKMzHvTzp64igGYZCSeWr0hcyz6Xjb/LUL6VaA+
	tFD8+FvAW0xDIFmIGcelgFdKMK1JzeVcdhcOc69vpPPT9CxpryCrJxUTrz7DbUuO6k+NQDz6uja
	NpUZDiNtPUupX5SnB2D2bNeAsMs9kASW/mPkkBFKNDgAtekOaQVhwi8jc8EsoYtEKfudWk4CLyA
	WqUeM3EOscPh21H1E
X-Received: by 2002:a17:907:6b8e:b0:b97:b6ef:fc8c with SMTP id
 a640c23a62f3a-b982f25c0e0mr330690766b.23.1774047750284; Fri, 20 Mar 2026
 16:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320004928.29914-1-rosenp@gmail.com> <202603201131.55E516E@keescook>
In-Reply-To: <202603201131.55E516E@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:02:18 -0700
X-Gm-Features: AaiRm51O8ViZNiu7LruN-oqaROpmM-E7ADuhJhQg9PSIufXB_A0G4gbrOHvaBaI
Message-ID: <CAKxU2N9fqr8XunsR+=-P8AngLbUbphTq6aFnEJ_yEGhue9d2wA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: simplify allocation of sinf
To: Kees Cook <kees@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, 
	Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:32=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 05:49:28PM -0700, Rosen Penev wrote:
> > Change to a flexible array member to allocate once instead of twice.
> >
> > Allows using __counted_by for extra runtime analysis. Move the counting
> > variable assignment to right after allocation as required by
> > __counted_by.
> >
> > Remove + 1 to allocation. It's already done in the previous line.
>
> Are you sure this is an accidental +1? I see the "num_sifr++" that
> happens earlier, but it's not immediately clear why either that or the
> +1 in the original allocation are needed. I'd like to understand why
> either/both are/aren't needed.
Looks like a rebasing mistake to me honestly.
>
> -Kees
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/platform/x86/panasonic-laptop.c | 17 ++++-------------
> >  1 file changed, 4 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform=
/x86/panasonic-laptop.c
> > index d923ddaa4849..4d663fffbcc8 100644
> > --- a/drivers/platform/x86/panasonic-laptop.c
> > +++ b/drivers/platform/x86/panasonic-laptop.c
> > @@ -248,11 +248,11 @@ struct pcc_acpi {
> >       int                     ac_brightness;
> >       int                     dc_brightness;
> >       int                     current_brightness;
> > -     u32                     *sinf;
> >       struct acpi_device      *device;
> >       struct input_dev        *input_dev;
> >       struct backlight_device *backlight;
> >       struct platform_device  *platform;
> > +     u32                     sinf[] __counted_by(num_sifr);
> >  };
> >
> >  /*
> > @@ -1017,21 +1017,15 @@ static int acpi_pcc_hotkey_add(struct acpi_devi=
ce *device)
> >        */
> >       num_sifr++;
> >
> > -     pcc =3D kzalloc_obj(struct pcc_acpi);
> > +     pcc =3D kzalloc_flex(*pcc, sinf, num_sifr);
> >       if (!pcc) {
> >               pr_err("Couldn't allocate mem for pcc");
> >               return -ENOMEM;
> >       }
> >
> > -     pcc->sinf =3D kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
> > -     if (!pcc->sinf) {
> > -             result =3D -ENOMEM;
> > -             goto out_hotkey;
> > -     }
> > -
> > +     pcc->num_sifr =3D num_sifr;
> >       pcc->device =3D device;
> >       pcc->handle =3D device->handle;
> > -     pcc->num_sifr =3D num_sifr;
> >       device->driver_data =3D pcc;
> >       strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
> >       strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
> > @@ -1039,7 +1033,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device=
 *device)
> >       result =3D acpi_pcc_init_input(pcc);
> >       if (result) {
> >               pr_err("Error installing keyinput handler\n");
> > -             goto out_sinf;
> > +             goto out_hotkey;
> >       }
> >
> >       if (!acpi_pcc_retrieve_biosdata(pcc)) {
> > @@ -1111,8 +1105,6 @@ static int acpi_pcc_hotkey_add(struct acpi_device=
 *device)
> >       backlight_device_unregister(pcc->backlight);
> >  out_input:
> >       input_unregister_device(pcc->input_dev);
> > -out_sinf:
> > -     kfree(pcc->sinf);
> >  out_hotkey:
> >       kfree(pcc);
> >
> > @@ -1140,7 +1132,6 @@ static void acpi_pcc_hotkey_remove(struct acpi_de=
vice *device)
> >
> >       input_unregister_device(pcc->input_dev);
> >
> > -     kfree(pcc->sinf);
> >       kfree(pcc);
> >  }
> >
> > --
> > 2.53.0
> >
>
> --
> Kees Cook
