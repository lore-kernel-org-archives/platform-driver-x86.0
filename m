Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1308D531
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763253896; cv=none; b=tDUwmNpNNXFcdYh+lR9bCr5SzAFMKBOvqnREKPmT83QJruw4Bc3qZQjvZptX2TAVpGnD4oUMYIH1YcFrVrsiLQmhUZ55cxpXQRw8HVgoTdcHl6rboWLdjP9Ej1Rpj7ZUt5eszI8kFKJxQ7E/27Dic3NgnZcpmJ7C291naa9TiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763253896; c=relaxed/simple;
	bh=JSWLNusBB9Hl8Iv0g2fpizDEtZUn9LSMdF+Zy7LNzRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJIfy8dE1ZMMwyaXs62VCBJwogVXPqURXAH5EicxilOARYPMx9UcAxI7JU9Sbps3EwSbqXpODf3ih3yAnQnSF2zZ0fzKQqel58oc8TPNs03+TzIST52t2risnJl8pXW8ZLWXg4JB1wL0hIFId+myPcOuS4nlRByUi80hgYltANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=canonical.com; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 919013F213
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 00:44:51 +0000 (UTC)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5db1e7fd021so6864075137.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Nov 2025 16:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763253890; x=1763858690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7XYX8lLsvj79T5sHpXiR/cflnEPgpB2ChbCzWTaCoM=;
        b=uG5d2i9f4EN5MtEafz6ARGUm4IB9rsBRsNzJrmpC5IonXyV8+fSgW1gaxpvqKWfOn/
         Q8QUqLiXNLC3vCWcunhTdEwIERLwBAEHXO7Xlthc1RICROqiSlykSNmQFifSc4KirqRo
         xhm4p3ZrbK2MTW8JfrtOV8I7/bfnLnZ5w0nYpYWhE3ZcdD3Dx+KGJr9AAz+lUXQKEm4y
         cMEJPoOFyqj/lwNQjg6gtN5dABZfW/Wh50QqfysZf9T7PXrFdsZj9VMkMJM+2ojGJyJp
         sRLznkSQnbKIfz+C4biJQqaTMzAXZ9tQui4AqsvBxAv+HRkiNcdqoGA+LHu5NZ5M7YLq
         aE4w==
X-Gm-Message-State: AOJu0YzygFcYSotPQPexwIdCh6rpiG5g5jl4Ayfz43PMF7CbGcWwlFya
	WCEnUgGZuWHT/lD/9QWZW+trPwi7+eE8gGvZJ0zH4csEUet3pk20EDoDIO2K1NYJHKQeZWeexnl
	miGyXSyxRLlNpSFKXnXQ/RAU4uDS5lPiBE6rf1EYuBKyWN+jDwUubY7IPvJK2F/Am6BQEt6KcUW
	aAVku7tweqq+0vicN+i8Gtcr7k1vKB6ZfH8gu9vXXsDtkNJwp2GVU23b6qbg30U89aAA==
X-Gm-Gg: ASbGncuTsDusYxA1hyVzvot2z8Gm6ZVLHPDdkkyIvZLj4PRp/EU7DCuSUdBi6Eka5pq
	zGboUkcttYK5SEeF+Of2+b6f6Q1hgeg5W5r6DZ0ekqEfkI6YqI148qlO/oRv4H3a4zxoMpS3oE/
	tP8z9iK6SUg/CDmmqPpbu0Qq7mKIhVQNgP93t9sOi4rY+ob0TeJHBtUm0/4QFLLJ1V+CajAgv0R
	Yv8r1F8Yk/EZfV/Yg==
X-Received: by 2002:a05:6102:91a:b0:5df:c33d:6e3f with SMTP id ada2fe7eead31-5dfc54fed34mr3094805137.13.1763253890226;
        Sat, 15 Nov 2025 16:44:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKNe7WczHK0cJFuqSZ99pjoVVaLb20TpRW6QrSBVuv/dHzgl7uaOldeg8M0u8QOR9XmofsxiyUTtzqnZiBRd0=
X-Received: by 2002:a05:6102:91a:b0:5df:c33d:6e3f with SMTP id
 ada2fe7eead31-5dfc54fed34mr3094802137.13.1763253889851; Sat, 15 Nov 2025
 16:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007084734.25347-1-anthony.wong@canonical.com> <DE91X624SV94.1C3A31K6FDMD3@gmail.com>
In-Reply-To: <DE91X624SV94.1C3A31K6FDMD3@gmail.com>
From: Anthony Wong <anthony.wong@ubuntu.com>
Date: Sun, 16 Nov 2025 00:44:12 +0000
X-Gm-Features: AWmQ_bkwrL8lhqjrjqVqXR_P1R4dkZZ_61HTkjErrJswMjxT-aCDCeb3zDAQStk
Message-ID: <CAE7LaDCG0QSprA4LST-qp4Vv_if9gqE=0h5LCoxiEGZsBFvz0A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: alieneware-wmi-wmax: Add AWCC support to
 Alienware 16 Aurora
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kurt,

On Sat, Nov 15, 2025 at 6:23=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wrote=
:
>
> On Tue Oct 7, 2025 at 3:47 AM -05, Anthony Wong wrote:
> > From: Anthony Wong <anthony.wong@ubuntu.com>
> >
> > Add AWCC support to Alienware 16 Aurora AC16250.
>
> Hi Anthony,
>
> I'm very interested in getting this merged.
>
> Do you have access to this model? If so, either testing the
> `force_gmode` module parameter or attaching the acpidump of this laptop
> would be amazing.

Here's the acpidump of the machine:
https://people.canonical.com/~ypwong/alienware16-aurora-acpidump

I tried the `force_gmode` module parameter but it doesn't seem to do
anything, how to check if it's really in effect?

Once this is cleared up, I can send a v2 with the suggestions you
provided below.

Thanks,
Anthony

>
> Either way, I have a couple of comments that I missed. First there is a
> typo in the title: alieneware-wmi-wmax -> alienware-wmi-wmax.
>
> >
> > CC: stable@vger.kernel.org
>
> CC -> Cc.
>
> > Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>
> > ---
> >  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/p=
latform/x86/dell/alienware-wmi-wmax.c
> > index 31f9643a6a3b5..eb7c3fb6b078d 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> > @@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks =3D {
> >  static struct awcc_quirks empty_quirks;
> >
> >  static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> > +     {
> > +             .ident =3D "Alienware 16 Aurora AC16250",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora =
AC16250"),
>
> I suggest we drop the "AC16250" so we won't need additional patches if
> Dell releases Alienware 16 Aurora R1, R2, etc.
>
> > +             },
> > +             .driver_data =3D &generic_quirks,
> > +     },
> >       {
> >               .ident =3D "Alienware Area-51m",
> >               .matches =3D {
>
> Thanks!
>
> --
>  ~ Kurt
>
