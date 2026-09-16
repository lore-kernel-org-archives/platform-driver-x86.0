Received: from mail-ej2-f38.google.com (mail-ej2-f38.google.com [74.125.228.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF7D479865
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555663; cv=pass; b=rh9hsySyEIHeSktCqIzd/e/iUAcEkDPUwmDYG+l7okX8S1hcZKFyGC95bZ2eUtYBPtm4lg/kukDbNOBrKzP3KJKEkuD9MXjGjLVtPBO8nDn3jXMmb3daJdeRbNqduyzdKvT5cQl36D/05TMReE+U2b/UyOBJx0X1atkOOetu4zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555663; c=relaxed/simple;
	bh=VZMBuFp+DS/Db3b4NboyELLEnA2/j8cRPYrFMrmlnOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZntW84YJUBscE0dCdeEW1lDI7/Zc+tcOvJmO1tNVCVuB+8DgjFK4Td5zbeZzlhSelAJ0ceU2kfiI2U/mTHQ5zPsfYVyd6wkNVQbqZgLt+UCni0AwFTVk41i8uOmoYiXZOMfNN4bQrzvf2el7XtuTTf2hOcDbB74tP+QkVXCO5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjZo/uZw; arc=pass smtp.client-ip=74.125.228.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjZo/uZw"
Received: by mail-ej2-f38.google.com with SMTP id a640c23a62f3a-c254f560398so122243266b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 03:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789555655; cv=none;
        d=google.com; s=arc-20260327;
        b=Jx4mUn2cCNJ8lFK5DXywqijiER94Jr0mtL6qmesgcQNR2EIF/+TK2xw9fn1f7RNier
         eIqCY+a2CHVibXb+IK406GC1dXqKWMarKc4FpBllYrR+GqvosLfSzS+MLYOZAwAsglUY
         h14XSkUADB5q60QrK1CCZx9MUU4nzLzg9HOx/Eh1L9JzZSiOsMYccY4pLYP4JoxhlkOP
         7tP8ujyvW57eC7agYQhKtdSWsqGr3EKXXR5v8gx4AqFQgA2ZWXVi59vbJmB4UGf8/512
         9yQFhnKWs58zQh9GuPyVdZgvlCHcl36LTkIth8UVgpND5v6+gK/l7wtr6ycMOapQSjzm
         1+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        fh=SWhXQSyE1QRDudahf73zbWpSr6A8vt36YWRIY6hA/78=;
        b=N8a04qufMrXTbDl0F+ESy6nQpFDXugQWVJ2T3hEgp/ARS61vNFhmyg0vmtUWLWVloP
         tKbSpFwM1EzoX+RxrS3JeHySzePK8WrdgBTv8e1+WNF1AVGBCzspxd2wmH6dki8sWoHV
         P5NUlg3kJpZj6B7xwZgnIrTkPLZjcG5Zlkcf6PQVQKRqW2Avf8OdCn+m/9BAge76Oqtm
         pLhFEigArwQUeJIVO4ygzXyjwlWeHN/CaKhlB8OnmEikVBf4/Rc2sGg0kGSbB0KnfvjQ
         OSzCjGrMyfO6KXa3TWQIIpuif2PtUe1DH9hS1pnmcTUXYJxP+1MO+FDgm+2mtDgtQBfA
         4U/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789555655; x=1790160455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        b=mjZo/uZwisbQ3pAu0+BLZrNRI28L7v4g5JehseIG5DxI4cxEmxziyyGD8bEwM/H3wW
         rUfOuztG8BZ7hynsE3RXgB6cCCt0IsBIC+qWxgPStcxE9OuYcROLg/FiA/+9GofB2Nwc
         RmqvBCZRilYC5NjY7m7NCh4TVKcUlv608n+uxghNwYtlpBjgufecokR6lGlIXPvOcsYn
         +G9AA+8uiFuW8OcgfWptfqUGAieCaw4Zvj/04Pag7DDMIxiOK9mgMlIVIovcMMy2X0VZ
         3sAJvgT9Aea9WcxUOwuV1eAXEQVnK29byUPhl8sOK8MOviOlxq0orbpNIb8ulPgqTQB0
         V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555655; x=1790160455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        b=auVd7hKi71CSDhQjCoVRunGpsMsjFuZRaHMQMg5EVPrMTInVOW/u5nn3IJ7FUZUL3L
         sbwK9WubS89ZRaraV+Lwwd2rBE39qIhlhZNYGvl0z4GFo1k3K59THRs/znf258RPg4QF
         giSOtrrdY6FJDvVoEY4XLkowSYoxxFEKvwb/3+mONKpY/EbVig4ZCSyDX5crTW1k7nvm
         jBPYwoSU1kU+u1aq8aISaXtm6yfgbBaQaX+/M5mf0se1XD+4h287FwqkJhVrvH4N/SOX
         eeWgOwB5RulbPE2oO8V6odDyN69N1UKJzkEolOVsyXa1cimt03Akk7GWR38YBu69WAAT
         eoeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvuwmNkJ9R4x2K96/Ndk4ZAT6V7fQcWc9XXzXBMnvpcb8i0S5/svDQBXgg0iSjU3uxgHeqBUGn0uKoJLi2BnfC5uMB@vger.kernel.org
X-Gm-Message-State: AFuF++nAUoT3+68LjGCwndCDfl97ZKpiWKbwnEhXmet6Hhij7KQTdMyz
	4YMFH7gzU9EYV+9hDUQHTN6/Cr7izviW8bb9Yw3HVzJE00CLgGrRyIADfoO0kZUcYskAMEPAv8a
	1rr9H8fkzWkaGy7raxyShj22P1Lmt3AE=
X-Gm-Gg: AYBFou3SF7NM5nWLW3WcQYX/toSILRaBPbbpOMVnr8JtCLGd1JB07tzyOCcX8mjWLVi
	VD6hWYEd7JTpk30KrWe3vHRT6mYdSpm3rC3XXMov6tDebVD1PAk4r1PmNGvhUqHMqnf0lQNE25u
	7N60ezVYTi34IByRnubKkcZnK5WNlDIkAqmabnn5OW3v4Iwpyet1ry1rYYOerxr7S4CJAZ5wxhf
	hnfi/vWTV/BN/+lb+49gL/Vq+bdUdHDufWhUwrBHe5cHUmGIwdtf5tyJp0O28Imnyckr3KLwE8W
	oizHSsziHqXv5AoOwcOoN+/oBTN1M4J6PdTjdnczItrDNRaAUsVTVrijE2wyHUumebbE7+ziHCe
	8ih8V+0j8LAeA6Vcn8J99ITotHT3PQBB7h+qRwzubVoUh6EkBcA==
X-Received: by 2002:a17:907:9806:b0:c29:ab1d:b5be with SMTP id
 a640c23a62f3a-c29e5308f4emr140996666b.27.1789555655362; Wed, 16 Sep 2026
 03:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
 <20260916004606.165065-1-meatuni001@gmail.com> <372e11de-9835-ef04-dba8-89faafa00ea6@linux.intel.com>
In-Reply-To: <372e11de-9835-ef04-dba8-89faafa00ea6@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 16 Sep 2026 15:47:23 +0500
X-Gm-Features: AcwNN1X723FFcCqfjG2Ew9yyYyMDw9AcuCD52yVJWN42G-AONas8nSu9MuyPPxI
Message-ID: <CADqcGBnxHNwnQs+z4=HzF59HEk2Qhz2ZPoMTEjahTK3KnG7HDA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: zero the hex-string decode
 buffer in hp_convert_hexstr_to_str
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Ilpo.

Noted. I'll include the parentheses in function names in the Subject
line for future patches.

Thanks for the review and for applying the patch.

--
Muhammad


On Wed, Sep 16, 2026 at 3:29=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 16 Sep 2026, Muhammad Bilal wrote:
>
> > hp_convert_hexstr_to_str() allocates its output buffer for the
> > worst-case decoded length, then fills in only as many bytes as the
> > input actually decodes to before shrinking the allocation down to
> > that length with krealloc(). Well-formed input can decode to
> > noticeably fewer bytes than the worst case, so the buffer is
> > frequently only partially written by the time it is realloc'd and
> > returned to the caller.
> >
> > Use kzalloc() instead of kmalloc() for the initial allocation, so
> > any unused capacity starts out zeroed instead of holding leftover
> > heap contents, rather than relying on every current and future
> > caller and code path to fill the buffer exactly.
> >
> > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > Applies on top of "platform/x86: hp-bioscfg: fix slab-out-of-bounds
> > write in hp_convert_hexstr_to_str" (the DIV_ROUND_UP sizing fix),
> > which Ilpo has applied to review-ilpo-next but is not yet in
> > mainline. Sent as its own patch rather than a v3 of that one, since
> > the sizing fix itself was applied as-is; this is the separate change
> > requested on top of it.
>
> Thanks, applied to review-ilpo-next.
>
> In future, please try to add parenthesis into function names in the
> shortlog (on Subject line) as well so I don't need to manually add them
> myself.
>
> --
>  i.
>
> > ---
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
> > index ff28db7..2dab9c0 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > @@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32=
 input_len, char **str, int *
> >       *len =3D 0;
> >       *str =3D NULL;
> >
> > -     new_str =3D kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNE=
L);
> > +     new_str =3D kzalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNE=
L);
> >       if (!new_str)
> >               return -ENOMEM;
> >
> >
